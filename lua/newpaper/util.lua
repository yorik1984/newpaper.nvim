local check = require("newpaper.check")

local M = {}

function table.contains(tbl, string)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            if table.contains(tbl[k], string) then
                return true
            end
        end
        if v == string then
            return true
        end
    end
    return false
end

function M.syntax(syntax)
    for group, colors in pairs(syntax) do
        M.highlight(group, colors)
    end
end

function M.highlight(group, color)
    -- stylua: ignore start
    local c = {
        fg  = color.fg    and "guifg=" .. color.fg    or "guifg=NONE",
        bg  = color.bg    and "guibg=" .. color.bg    or "guibg=NONE",
        st  = color.style and "gui=" ..   color.style or "gui=NONE",
        sp  = color.sp    and "guisp=" .. color.sp    or "",
    }
    -- stylua: ignore end
    local hl = "highlight " .. group .. " " .. c.st .. " " .. c.fg .. " " .. c.bg .. " " .. c.sp
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    else
        vim.cmd(hl)
    end
end

-- Delete the autocmds when the theme changes to something else
function M.onColorScheme()
    if vim.g.colors_name ~= "newpaper" then
        vim.api.nvim_clear_autocmds({ group = "newpaper" })
    end
end

function M.autocmds(config)
    local group = vim.api.nvim_create_augroup("newpaper", {})
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            require("newpaper.util").onColorScheme()
        end,
    })
    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*" },
        command = "setlocal winhighlight=Normal:NormalTerm,"
            .. "SignColumn:SignColumnTerm,"
            .. "LineNr:LineNrTerm,"
            .. "TermCursor:TermCursorTerm,"
            .. "TermCursorNC:TermCursorNCTerm,"
            .. "CursorLine:CursorLineTerm "
            .. "signcolumn=no nocursorline nonumber",
    })
    for _, sidebar in ipairs(config.sidebars_contrast) do
        if sidebar ~= "NvimTree" then
            vim.api.nvim_create_autocmd({ "FileType" }, {
                group = group,
                pattern = { sidebar },
                command = "setlocal winhighlight=Normal:NormalContrastSB,"
                    .. "SignColumn:SignColumnSB,"
                    .. "LineNr:LineNrSB,"
                    .. "CursorLineNr:LineNrSB,"
                    .. "CursorLine:CursorLineSB,"
                    .. "CursorLineSign:CursorLineSignSB "
                    .. "signcolumn=yes:1 nonumber",
            })
        end
    end
end

function M.load(config, theme)
    -- Patch https://github.com/folke/tokyonight.nvim/commit/0ead86afe390603f9bd688103d7a5fc6724a828e
    -- only needed to clear when not the default colorscheme
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "newpaper"
    -- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        -- imort tables for plugins and lsp
        M.syntax(theme.loadPlugins())
        M.syntax(theme.loadLSP())
        theme.loadTerminal()
        async:close()
    end))
    -- load base theme
    M.syntax(theme.loadEditor())
    M.syntax(theme.loadSyntax())
    M.syntax(theme.loadTreeSitter())
    async:send()
    M.autocmds(config)
end

function M.loadSyntax(synTheme)
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        M.syntax(synTheme.loadPlugins())
        async:close()
    end))
    -- Load other syntax
    M.syntax(synTheme.loadSyntax())
    M.syntax(synTheme.loadTreeSitter())
    async:send()
end

function M.loadPluginSyntax(synTheme)
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        M.syntax(synTheme.loadPlugins())
        async:close()
    end))
    async:send()
end

function M.loadCustomSyntax(config)
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        M.syntax(config.custom_highlights)
        async:close()
    end))
    async:send()
end

function M.colorOverrides(colors, config)
    for key, value in pairs(config.colors) do
        check.keyExistsError(config.colors, colors, "color", "Use: from newpaper/colors.lua")
        -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
        if type(colors[key]) == "table" then
            M.colorOverrides(colors[key], { colors = value })
        else
            if value:lower() == "none" then
                -- set to none
                colors[key] = "NONE"
            elseif string.sub(value, 1, 1) == "#" and string.len(value) == 7 then
                -- hex override
                colors[key] = value
            elseif not colors[value] then
                -- another group
                error("newpaper.nvim: color '" .. value .. "' has wrong format. Use: '#XXXXXX'")
            else
                colors[key] = colors[value]
            end
        end
    end
end

function M.deviconsOverrides(config)
    local devIconCustom      = config.devicons_custom.gui
    local devIconCustomCterm = config.devicons_custom.cterm

    -- https://github.com/kyazdani42/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua

    local group = vim.api.nvim_create_augroup("devIconsCustom", {})
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            local function get_highlight_name(data)
                return data.name and "DevIcon" .. data.name
            end
            local function set_up_highlight(icon_data)
                local hl_group = get_highlight_name(icon_data)
                local highlight_command = "highlight! " .. hl_group
                if icon_data.color and devIconCustom then
                    highlight_command = highlight_command .. " guifg=" .. devIconCustom
                    vim.api.nvim_command(highlight_command)
                end
                if icon_data.cterm_color and devIconCustomCterm then
                    highlight_command = highlight_command .. " ctermfg=" .. devIconCustomCterm
                    vim.api.nvim_command(highlight_command)
                end
            end
            local icons = require("nvim-web-devicons").get_icons()
            for _, icon_data in pairs(icons) do
                set_up_highlight(icon_data)
            end
        end,
    })
end

return M
