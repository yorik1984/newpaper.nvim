local M = {}

function M.setup(configColors, configStyle)
    local cheatsheetSyn       = {}
    cheatsheetSyn.colors      = configColors
    cheatsheetSyn.style       = configStyle
    local newpaper            = cheatsheetSyn.colors
    local style               = cheatsheetSyn.style

    cheatsheetSyn.loadPlugins = function()
        local plugins = {
            -- cheatComment         Comment
            -- cheatMetadataComment Comment
            cheatMetadataTag     = { fg = newpaper.maroon },
            cheatMetadataSection = { fg = newpaper.darkengreen },

            cheatDescription     = { fg = newpaper.strings },
            cheatSeparator       = { fg = newpaper.tag_navy, style = style.b_bold },
            cheatCode            = { fg = newpaper.darkorange },
        }
        return plugins
    end

    return cheatsheetSyn
end

return M
