local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    -- stylua: ignore start

    local languageSyn  = {}
    languageSyn.colors = require("newpaper.colors").setup(config)
    languageSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper     = languageSyn.colors
    local style        = languageSyn.style

    languageSyn.loadSyntax = function ()
        local syntax = {

        }

        return syntax
    end

    languageSyn.loadTreeSitter = function ()
        local treesitter = {

        }

        return treesitter
    end

    languageSyn.loadPlugins = function()
        local plugins = {
            -- Plugin
        }

        return plugins
    end

    -- stylua: ignore end

    return languageSyn
end

return M
