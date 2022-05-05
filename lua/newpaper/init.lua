local util = require("newpaper.util")
local theme = require("newpaper.theme")
local configModule = require("newpaper.config")
local config = configModule.config

local langSyn = {
    texSyn  = require("newpaper.theme.languages.tex"),
    vimSyn  = require("newpaper.theme.languages.vim"),
    mkdSyn  = require("newpaper.theme.languages.markdown"),
    htmlSyn = require("newpaper.theme.languages.html"),
    rubySyn = require("newpaper.theme.languages.ruby"),
    tomlSyn = require("newpaper.theme.languages.toml"),
    yamlSyn = require("newpaper.theme.languages.yaml"),
    luaSyn  = require("newpaper.theme.languages.lua"),
}

local plugSyn = {
    jinja = require("newpaper.theme.plugins.jinja"),
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
    local configStyle = require("newpaper.style").setup_style(configApply)

    util.load(theme.setup(configApply, configColors, configStyle))

    for key, _ in pairs(langSyn) do
        util.loadSyntax(langSyn[key].setup(configColors, configStyle))
    end

    for key, _ in pairs(plugSyn) do
        util.loadPluginSyntax(plugSyn[key].setup(configColors, configStyle))
    end

    util.loadCustomSyntax(configApply)
end

return { setup = setup }
