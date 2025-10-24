local winhighlight = require("newpaper.winhighlight")
local presets = require("newpaper.presets")
local M = {}

local function onColorScheme()
    pcall(vim.api.nvim_clear_autocmds, { group = "newpaper" })
end

local function updateLualineStyle()
    vim.g.newpaper_lualine_style = vim.o.background

    pcall(function()
        local ok_lualine, lualine = pcall(require, "lualine")
        if ok_lualine and type(lualine.refresh) == "function" then
            lualine.refresh()
        end
    end)
end

function M.autocmds(config, color)
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local augroup = vim.api.nvim_create_augroup("NewpaperLualineStyle", { clear = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = augroup,
                pattern = "*",
                callback = updateLualineStyle,
            })
            vim.api.nvim_create_autocmd("OptionSet", {
                group = augroup,
                pattern = "background",
                callback = updateLualineStyle,
            })
        end,
    })

    local group = vim.api.nvim_create_augroup("newpaper", {})

    vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            onColorScheme()
        end,
    })

    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)\\@<!" },
        callback = function()
            local win = vim.api.nvim_get_current_win()
            winhighlight.applyWinHl(presets.lazygitWinHl(), "local", win)
        end,
    })

    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)" },
        callback = function()
            if color then
                vim.b.terminal_color_1  = color.git_removed
                vim.b.terminal_color_2  = color.git_added
                vim.b.terminal_color_15 = color.git_fg
            end
        end,
    })

    if config and config.sidebars_contrast then
        local sidebars = {}
        for _, sidebar in ipairs(config.sidebars_contrast) do
            if sidebar ~= "NvimTree" then
                sidebars[sidebar] = true
            end
        end

        if next(sidebars) then
            vim.api.nvim_create_autocmd("BufEnter", {
                group = group,
                callback = function(args)
                    local bufnr = args.buf
                    local ft = vim.bo[bufnr].filetype

                    if sidebars[ft] then
                        for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
                            winhighlight.applyWinHl(presets.sidebar(), "local", win)
                        end
                    end
                end,
            })
        end
    end

    if config and config.preset then
        local function applyPreset(patterns, event, preset, preset_name)
            if type(patterns) ~= "table" or next(patterns) == nil then
                return
            end
            if type(preset) ~= "function" then
                return
            end

            vim.api.nvim_create_autocmd(event, {
                group = group,
                pattern = patterns,
                callback = function()
                    if event == "FileType" then
                        if vim.b.__preset_by_filename_applied then
                            return
                        end
                    elseif event == "BufEnter" then
                        vim.b.__preset_by_filename_applied = preset_name
                    end

                    local win = vim.api.nvim_get_current_win()
                    winhighlight.applyWinHl(preset(), "local", win)
                end,
            })
        end

        local event_for = {
            by_filetype = "FileType",
            by_filename = "BufEnter",
        }

        for key, event in pairs(event_for) do
            if type(config.preset[key]) == "table" then
                for preset_name, patterns in pairs(config.preset[key]) do
                    if type(patterns) == "table" and next(patterns) ~= nil then
                        if type(presets[preset_name]) == "function" then
                            applyPreset(patterns, event, presets[preset_name], preset_name)
                        end
                    end
                end
            end
        end
    end
end

return M
