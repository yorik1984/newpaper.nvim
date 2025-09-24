local core         = require("newpaper.theme.core")
local filetypes    = require("newpaper.theme.filetypes")
local ftplugins    = require("newpaper.theme.ftplugins")
local plugins      = require("newpaper.theme.plugins")
local treesitter   = require("newpaper.theme.treesitter")
local terminal     = require("newpaper.theme.terminal")
local configModule = require("newpaper.config")
local style        = require("newpaper.style")
local colors       = require("newpaper.colors")
local commands     = require("newpaper.commands")
local M            = {}

function M.syntax(syntax)
    if not syntax then
        return
    end
    for group, color in pairs(syntax) do
        M.highlight(group, color)
    end
end

function M.highlight(group, color)
    if not color then
        return
    end

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
    local config = configModule.config

    if configApply then
        configModule.setup(configApply)
        config = configModule.config
    end

    vim.o.termguicolors = true

    if config.style == "auto" then
        config.style = vim.o.background
    else
        if config.style == "light" or config.style == "dark" then
            vim.o.background = config.style
        end
    end

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    local configColors = colors.setup(config)
    local configStyle = style.setupStyle(config)

    local groups = {
        core,
        filetypes,
        ftplugins,
        plugins,
        treesitter,
    }

    for _, group in ipairs(groups) do
        if type(group) == "table" then
            for _, syn in ipairs(group) do
                local mod
                if type(syn) == "string" then
                    mod = require(syn)
                elseif type(syn) == "table" then
                    mod = syn
                end

                if mod and type(mod.setup) == "function" then
                    local hl = mod.setup(configColors, configStyle)
                    if hl then M.loadHlGroups(hl) end
                end
            end
        end
    end

    terminal.setup(configColors)

    M.loadCustomSyntax(config)
    commands.autocmds(config, configColors)

    vim.g.colors_name = "newpaper"
end

function M.loadHlGroups(synTheme)
    if not synTheme then
        return
    end
    M.syntax(synTheme)
end

function M.loadCustomSyntax(config)
    if not config then
        return
    end
    M.syntax(config.custom_highlights)
end

return M
