local util         = require("newpaper.util")
local configModule = require("newpaper.config")
local config       = configModule.config

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

    util.load(configModule.config)

    end

return { setup = setup }

