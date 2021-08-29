local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local languageSyn = {}
    languageSyn.colors = require("newpaper.colors").setup(config)
    languageSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper     = languageSyn.colors
    local style        = languageSyn.style

    -- LuaFormatter off

    languageSyn.loadSyntax = function ()

        -- Language syntax highlight groups

        local syntax = {



        }

        return syntax

    end

    languageSyn.loadTreeSitter = function ()

        -- Language treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    languageSyn.loadPlugins = function()

        -- Language special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
        -- LuaFormatter on

    end

    return languageSyn

end

return M
