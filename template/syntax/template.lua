local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local langSyn  = {}
    langSyn.colors = configColors
    langSyn.style  = configStyle
    local newpaper = langSyn.colors
    local style    = langSyn.style

    langSyn.loadSyntax = function ()
        local syntax = {

        }

        return syntax
    end

    langSyn.loadTreeSitter = function ()
        local treesitter = {

        }

        return treesitter
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
