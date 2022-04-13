local util         = require("newpaper.util")
local theme        = require("newpaper.theme")
local configModule = require("newpaper.config")

local texSyn       = require("newpaper.syntax.tex")
local vimSyn       = require("newpaper.syntax.vim")
local markdownSyn  = require("newpaper.syntax.markdown")
local htmlSyn      = require("newpaper.syntax.html")
local rubySyn      = require("newpaper.syntax.ruby")
local tomlSyn      = require("newpaper.syntax.toml")
local yamlSyn      = require("newpaper.syntax.yaml")
local luaSyn       = require("newpaper.syntax.lua")

local jinjaSyn     = require("newpaper.syntax.jinja")

local function setup(userConfig)

    if userConfig then
        configModule.applyConfiguration(userConfig)
        if configModule.config.style == 'light' then
            vim.o.background = 'light'
        elseif configModule.config.style == 'dark' then
            vim.o.background = 'dark'
        end

        vim.g.newpaper_colors        = configModule.config.colors
        vim.g.newpaper_lualine_bold  = configModule.config.lualine_bold
        if userConfig.lualine_style then
            vim.g.newpaper_lualine_style = configModule.config.lualine_style
        else
            vim.g.newpaper_lualine_style = configModule.config.style
        end

    else
        if vim.g.newpaper_colors == nil then
            vim.g.newpaper_colors = configModule.config.colors
        end

        if vim.g.newpaper_lualine_bold == nil then
            vim.g.newpaper_lualine_bold = configModule.config.lualine_bold
        end

        if vim.g.newpaper_lualine_style == nil then
            vim.g.newpaper_lualine_style = configModule.config.lualine_style
        end
    end

    util.load(theme.setup(configModule.config))

    util.loadSyntax(luaSyn.setup(configModule.config))
    util.loadSyntax(texSyn.setup(configModule.config))
    util.loadSyntax(vimSyn.setup(configModule.config))
    util.loadSyntax(markdownSyn.setup(configModule.config))
    util.loadSyntax(htmlSyn.setup(configModule.config))
    util.loadSyntax(rubySyn.setup(configModule.config))
    util.loadSyntax(tomlSyn.setup(configModule.config))
    util.loadSyntax(yamlSyn.setup(configModule.config))

    util.loadPluginSyntax(jinjaSyn.setup(configModule.config))

    util.loadCustomSyntax(configModule.config)

end

return {setup = setup}
