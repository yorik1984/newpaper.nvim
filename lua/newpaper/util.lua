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

    -- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
    if color.style then
        if type(color.style) == "table" then
            color = vim.tbl_extend("force", color, color.style)
        elseif color.style:lower() ~= "none" then
            -- handle old string style definitions
            for s in string.gmatch(color.style, "([^,]+)") do
                color[s] = true
            end
        end
        color.style = nil
    end
    vim.api.nvim_set_hl(0, group, color)
end

-- Delete the autocmds when the theme changes to something else
function M.onColorScheme()
    vim.api.nvim_clear_autocmds({ group = "newpaper" })
end

function M.autocmds(config, theme)
    local group = vim.api.nvim_create_augroup("newpaper", {})
    vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            require("newpaper.util").onColorScheme()
        end,
    })
    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)\\@<!" },
        command = "setlocal winhighlight=Normal:NormalTerm,"
            .. "NormalFloat:NormalTermFloat,"
            .. "FloatBorder:FloatBorderTerm,"
            .. "SignColumn:SignColumnTerm,"
            .. "LineNr:LineNrTerm,"
            .. "TermCursor:TermCursorTerm,"
            .. "TermCursorNC:TermCursorNCTerm,"
            .. "CursorLine:CursorLineTerm "
            .. "signcolumn=no nocursorline nonumber",
    })

    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)" },
        callback = function()
            local newpaper = theme.colors
            vim.b.terminal_color_1  = newpaper.git_removed
            vim.b.terminal_color_2  = newpaper.git_added
            vim.b.terminal_color_15 = newpaper.git_fg
        end
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
    M.autocmds(config, theme)
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

function M.colorOverrides(colors, configColors)
    for key, value in pairs(configColors) do
        check.keyExistsError(configColors, colors, "color", "Use: from newpaper/colors.lua")
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
    local help = "Add nvim-web-devicons to runtime path or do not use in setup() option «devicons_custom»"
    local plugin = "nvim-web-devicons"
    check.requiresPluginError(plugin, help)

    -- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua
    local group = vim.api.nvim_create_augroup("newpaper", {})
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            local devIconCustom      = config.devicons_custom.gui
            local devIconCustomCterm = config.devicons_custom.cterm
            local function get_highlight_name(data)
                return data.name and "DevIcon" .. data.name
            end

            local function set_up_highlight(icon_data)
                local hl_group = get_highlight_name(icon_data)
                if hl_group and (icon_data.color or icon_data.cterm_color) then
                    vim.api.nvim_set_hl(0, hl_group, {
                        fg = devIconCustom,
                        ctermfg = devIconCustomCterm,
                    })
                end
            end

            local icons = require(plugin).get_icons()
            for _, icon_data in pairs(icons) do
                set_up_highlight(icon_data)
            end
        end,
    })
end

return M
