local core         = require("newpaper.theme.core")
local filetypes    = require("newpaper.theme.filetypes")
local ftplugins    = require("newpaper.theme.ftplugins")
local plugins      = require("newpaper.theme.plugins")
local treesitter   = require("newpaper.theme.treesitter")
local configModule = require("newpaper.config")
local style        = require("newpaper.style")
local autocmds     = require("newpaper.autocmds")
local M            = {}

local function safeRequire(module)
    local ok, val = pcall(require, module)
    if ok then return val end
end

local terminal = safeRequire("newpaper.theme.terminal")

function M.syntax(syntax)
    if not syntax then return end
    for group, color in pairs(syntax) do
        M.highlight(group, color)
    end
end

function M.highlight(group, color)
    if not color then return end

    if color.style then
        if type(color.style) == "table" then
            color = vim.tbl_extend("force", color, color.style)
        elseif type(color.style) == "string" and color.style:lower() ~= "none" then
            for s in string.gmatch(color.style, "([^,]+)") do
                color[s] = true
            end
        end
        color.style = nil
    end

    vim.api.nvim_set_hl(0, group, color)
end

function M.setup(userConfig)
    configModule.setup(userConfig)
end

function M.load(configApply)
    if configApply then
        configModule.setup(configApply)
    end
    local config = configModule.config

    if config.style == "auto" then
        config.style = vim.o.background
    else
        vim.o.background = config.style
    end

    vim.g.newpaper_colors        = config.colors
    vim.g.newpaper_lualine_bold  = config.lualine_bold
    vim.g.newpaper_lualine_style = config.style

    if vim.g.colors_name then
        vim.cmd([[hi clear]])
    end

    vim.o.termguicolors = true

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    local colors       = safeRequire("newpaper.colors")
    local configColors = colors and colors.setup(config)
    local configStyle  = style.setupStyle(config)

    local groups       = {
        core,
        filetypes,
        ftplugins,
        plugins,
        treesitter,
    }

    for _, group in ipairs(groups) do
        for _, syn in ipairs(group) do
            M.loadHlGroups(require(syn).setup(configColors, configStyle))
        end
    end

    -- if terminal and terminal.setup then
    --     terminal.setup(configColors)
    -- end
    --
    -- M.loadCustomSyntax(config)
    -- autocmds.setup(config, configColors)
end

function M.loadHlGroups(synTheme)
    if not synTheme then return end
    M.syntax(synTheme)
end

function M.loadCustomSyntax(config)
    if not config then return end
    M.syntax(config.custom_highlights)
end

return M
