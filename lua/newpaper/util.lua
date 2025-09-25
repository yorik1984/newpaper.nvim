local core         = require("newpaper.theme.core")
local filetypes    = require("newpaper.theme.filetypes")
local ftplugins    = require("newpaper.theme.ftplugins")
local plugins      = require("newpaper.theme.plugins")
local treesitter   = require("newpaper.theme.treesitter")
local terminal     = require("newpaper.theme.terminal")
local configModule = require("newpaper.config")
local style        = require("newpaper.style")
local colors       = require("newpaper.colors")
local gui2cterm    = require("newpaper.colors.gui2cterm")
local commands     = require("newpaper.commands")
local M            = {}

local function safe_require(name)
    local ok, mod = pcall(require, name)
    if ok then return mod end
    return nil
end

function M.syntax(syntax, cterm)
    if not syntax then
        return
    end
    for group, color in pairs(syntax) do
        M.highlight(group, color, cterm)
    end
end

function M.highlight(group, color, cterm)
    cterm = cterm or false
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
    vim.api.nvim_set_hl(0, group, cterm and gui2cterm.expandCterm(color) or color)
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
        for _, syn in ipairs(group) do
            M.loadHlGroups(require(syn).setup(configColors, configStyle))
        end
    end

    terminal.setup(configColors)

    M.loadCustomSyntax(config)
    M.deviconSetup(configColors)

    commands.autocmds(config, configColors)

    vim.g.colors_name = "newpaper"
end

function M.loadHlGroups(synTheme, cterm)
    if not synTheme then
        return
    end
    M.syntax(synTheme, cterm)
end

function M.loadCustomSyntax(config, cterm)
    if not config then
        return
    end
    M.syntax(config.custom_highlights, cterm)
end

local AUGROUP = "NewpaperDeviconsRefresh"

local function get_config_colors(cfg)
    if type(cfg) == "function" then
        local ok, res = pcall(cfg)
        if ok then return res end
        return nil
    end
    return cfg
end

local function do_refresh_and_apply(cfg)
    vim.schedule(function()
        local web_devicons = safe_require("nvim-web-devicons")
        if not web_devicons then return end

        if type(web_devicons.refresh) == "function" then
            pcall(web_devicons.refresh)
        end

        local theme_devicons = safe_require("newpaper.theme.plugins.nvim-web-devicons")
        if not theme_devicons or type(theme_devicons.setup) ~= "function" then return end

        local configColors = get_config_colors(cfg)
        local ok, hl = pcall(theme_devicons.setup, configColors)
        if not ok or not hl then return end

        local newpaper = safe_require("newpaper")
        if newpaper and type(M.loadHlGroups) == "function" then
            pcall(M.loadHlGroups, hl, true)
        end
    end)
end

function M.deviconSetup(cfg)
    if not safe_require("nvim-web-devicons") then
        return false
    end

    vim.api.nvim_create_augroup(AUGROUP, { clear = true })

    vim.api.nvim_create_autocmd("ColorScheme", {
        group = AUGROUP,
        pattern = "*",
        callback = function() do_refresh_and_apply(cfg) end,
    })

    vim.api.nvim_create_autocmd("OptionSet", {
        group = AUGROUP,
        pattern = "background",
        callback = function() do_refresh_and_apply(cfg) end,
    })

    return true
end

return M
