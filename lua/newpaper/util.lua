local terminal      = require("newpaper.theme.terminal")
local configModule  = require("newpaper.config")
local style         = require("newpaper.style")
local M             = {}

local function safeRequire(module)
    local ok, val = pcall(require, module)
    if ok then return val end
end

function M.contains(tbl, value)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            if M.contains(v, value) then
                return true
            end
        elseif v == value then
            return true
        end
    end
    return false
end

function M.syntax(syntax)
    for group, color in pairs(syntax) do
        M.highlight(group, color)
    end
end

function M.highlight(group, color)
    if color.style then
        if type(color.style) == "table" then
            color = vim.tbl_extend("force", color, color.style)
        elseif color.style:lower() ~= "none" then
            for s in string.gmatch(color.style, "([^,]+)") do
                color[s] = true
            end
        end
        color.style = nil
    end

    vim.api.nvim_set_hl(0, group, color)
end

function M.onColorScheme()
    vim.api.nvim_clear_autocmds({ group = "newpaper" })
end

function M.autocmds(config, color)
    local group = vim.api.nvim_create_augroup("newpaper", {})
    local util  = M

    vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            util.onColorScheme()
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
            .. "FoldColumn:FoldColumnTerm,"
            .. "TermCursor:TermCursorTerm,"
            .. "TermCursorNC:TermCursorNCTerm,"
            .. "CursorLine:CursorLineTerm "
            .. "signcolumn=no nocursorline nonumber",
    })

    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)" },
        callback = function()
            vim.b.terminal_color_1  = color.git_removed
            vim.b.terminal_color_2  = color.git_added
            vim.b.terminal_color_15 = color.git_fg
        end,
    })

    for _, sidebar in ipairs(config.sidebars_contrast) do
        if sidebar ~= "NvimTree" then
            vim.api.nvim_create_autocmd({ "FileType" }, {
                group = group,
                pattern = { sidebar },
                command = "setlocal winhighlight=Normal:NormalContrastSB,"
                    .. "SignColumn:SignColumnSB,"
                    .. "LineNr:LineNrSB,"
                    .. "FoldColumn:FoldColumnSB,"
                    .. "CursorLineNr:CursorLineSignSB,"
                    .. "CursorLine:CursorLineSB,"
                    .. "CursorLineSign:CursorLineSignSB "
                    .. "signcolumn=yes:1 nonumber",
            })
        end
    end
end

function M.setup(userConfig)
    configModule.setup(userConfig)
end

function M.load(configApply)
    local config = configModule.config

    if configApply then
        configModule.setup(configApply)
        config = configModule.config
    end

    if config.style == "auto" then
        config.style = vim.o.background
    else
        vim.o.background = config.style
    end

    vim.g.newpaper_colors        = config.colors
    vim.g.newpaper_lualine_bold  = config.lualine_bold
    vim.g.newpaper_lualine_style = configApply and (configApply.lualine_style or config.style) or config.style

    if vim.g.colors_name then
        vim.cmd([[hi clear]])
    end

    vim.o.termguicolors = true

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    local colors = safeRequire("newpaper.colors")
    local configColors = colors and colors.setup(config) or {}
    local configStyle  = style.setupStyle(config)

    local groups = { "core", "filetypes", "ftplugins", "plugins", "treesitter" }

    for _, groupName in ipairs(groups) do
        local group = safeRequire("newpaper.theme" .. groupName)
        if group then
            for _, syn in ipairs(group) do
                local module = safeRequire(syn)
                if module then
                    M.loadHlGroups(module.setup(configColors, configStyle))
                end
            end
        end
    end

    terminal.setup(configColors)
    M.loadCustomSyntax(config)
    M.autocmds(config, configColors)
end

function M.loadHlGroups(synTheme)
    M.syntax(synTheme)
end

function M.loadCustomSyntax(config)
    M.syntax(config.custom_highlights)
end

return M
