local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local cheatsheetSyn  = {}
    cheatsheetSyn.colors = configColors
    cheatsheetSyn.style  = configStyle
    local newpaper       = cheatsheetSyn.colors
    local style          = cheatsheetSyn.style

    cheatsheetSyn.loadPlugins = function()
        local plugins = {
            -- Cheatsheet -----------------------------------------------------
            -- cheatComment         Comment
            -- cheatMetadataComment Comment
            cheatMetadataTag     = { fg = newpaper.maroon },
            cheatMetadataSection = { fg = newpaper.darkengreen },

            cheatDescription     = { fg = newpaper.string },
            cheatSeparator       = { fg = newpaper.tag_navy },
            cheatCode            = { fg = newpaper.darkorange },
        }
        return plugins
    end

    -- stylua: ignore end

    return cheatsheetSyn
end

return M
