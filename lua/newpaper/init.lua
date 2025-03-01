local util         = require("newpaper.util")
local configModule = require("newpaper.config")
local config       = configModule.config

local function setup(userConfig)
    if userConfig then
        configModule.applyConfiguration(userConfig)
        if config.style == "auto" then
            config.style = vim.o.background
        else
            vim.o.background = config.style
        end

        vim.g.newpaper_colors        = config.colors
        vim.g.newpaper_lualine_bold  = config.lualine_bold
        vim.g.newpaper_lualine_style = userConfig.lualine_style or config.style
    else
        vim.g.newpaper_colors        = vim.g.newpaper_colors or config.colors
        vim.g.newpaper_lualine_bold  = vim.g.newpaper_lualine_bold or config.lualine_bold
        vim.g.newpaper_lualine_style = vim.g.newpaper_lualine_style or config.lualine_style
    end

    util.load(configModule.config)
end

return { setup = setup }
