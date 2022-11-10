local util         = require("newpaper.util")
local theme        = require("newpaper.theme")
local filetypes    = require("newpaper.theme.filetypes")
local plugins      = require("newpaper.theme.plugins")
local devIcons     = require("newpaper.theme.plugins.devicons")
local configModule = require("newpaper.config")
local config       = configModule.config
local configApply  = configModule.config
local configColors = require("newpaper.colors").setup(configApply)
local configStyle  = require("newpaper.style").setupStyle(configApply)

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

    util.load(configApply, theme.setup(configColors, configStyle))

    for _, fileSyn in ipairs(filetypes) do
        util.loadSyntax(require(fileSyn).setup(configColors, configStyle))
    end
    for _, fileSyn in ipairs(plugins) do
        util.loadPluginSyntax(require(fileSyn).setup(configColors, configStyle))
    end

    if configApply.devicons_custom.cterm and not configApply.devicons_custom.gui then
        util.deviconsOverrides(configApply)
        util.loadPluginSyntax(devIcons.setup(configColors))
    elseif configApply.devicons_custom.gui then
        util.deviconsOverrides(configApply)
    else
        util.loadPluginSyntax(devIcons.setup(configColors))
    end

    util.loadCustomSyntax(configApply)
end

return { setup = setup }
