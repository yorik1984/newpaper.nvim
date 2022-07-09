local util = require("newpaper.util")
local theme = require("newpaper.theme")
local configModule = require("newpaper.config")
local config = configModule.config

local filetypes = {
    "html",
    "lua",
    "markdown",
    "ruby",
    "tex",
    "toml",
    "vim",
    "yaml",
}
local plugins = {
    "cheatsheet",
    "jinja",
    "nvim-tree",
    "rbs",
    "telescope",
    "trouble",
}

local function setup(userConfig)
    if userConfig then
        configModule.applyConfiguration(userConfig)
        if config.style == "light" then
            vim.o.background = "light"
        elseif config.style == "dark" then
            vim.o.background = "dark"
        end
        vim.g.newpaper_colors = config.colors
        vim.g.newpaper_lualine_bold = config.lualine_bold
        if userConfig.lualine_style then
            vim.g.newpaper_lualine_style = config.lualine_style
        else
            vim.g.newpaper_lualine_style = config.style
        end
    else
        if vim.g.newpaper_colors == nil then
            vim.g.newpaper_colors = config.colors
        end
        if vim.g.newpaper_lualine_bold == nil then
            vim.g.newpaper_lualine_bold = config.lualine_bold
        end
        if vim.g.newpaper_lualine_style == nil then
            vim.g.newpaper_lualine_style = config.lualine_style
        end
    end

    local configApply = configModule.config
    local configColors = require("newpaper.colors").setup(configApply)
    local configStyle = require("newpaper.style").setupStyle(configApply)
    local ftypesFolder = "newpaper.theme.filetypes."
    local plugsFolder = "newpaper.theme.plugins."
    local devIcons = "newpaper.theme.plugins.devicons"

    util.load(configApply, theme.setup(configColors, configStyle))

    for _, value in ipairs(filetypes) do
        local fileSyn = ftypesFolder .. value
        util.loadSyntax(require(fileSyn).setup(configColors, configStyle))
    end

    for _, value in ipairs(plugins) do
        local fileSyn = plugsFolder .. value
        util.loadPluginSyntax(require(fileSyn).setup(configColors, configStyle))
    end

    if configApply.devicons_custom.cterm and not configApply.devicons_custom.gui then
        util.deviconsOverrides(configApply)
        util.loadPluginSyntax(require(devIcons).setup(configColors))
    elseif configApply.devicons_custom.gui then
        util.deviconsOverrides(configApply)
    else
        util.loadPluginSyntax(require(devIcons).setup(configColors))
    end

    util.loadCustomSyntax(configApply)
end

return { setup = setup }
