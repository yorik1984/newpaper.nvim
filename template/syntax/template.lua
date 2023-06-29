local util = require("newpaper.util")
local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local langSyn  = {}
    langSyn.colors = configColors
    langSyn.style  = configStyle
    local newpaper = langSyn.colors
    local style    = langSyn.style

    langSyn.loadSyntax = function()
        local syntax = {

        }

        return syntax
    end

    langSyn.loadTreeSitter = function()

        -- fallback to 0.7
        local treesitterOldKey = {
        }

        local treesitter = {

        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
    end

    langSyn.loadPlugins = function()
        local plugins = {
            -- Plugin
        }

        return plugins
    end

	-- stylua: ignore end

	return langSyn
end

return M
