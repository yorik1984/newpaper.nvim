local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- cheatComment         Comment
        -- cheatMetadataComment Comment
        cheatMetadataTag     = { fg = newpaper.maroon },
        cheatMetadataSection = { fg = newpaper.darkengreen },

        cheatDescription     = { fg = newpaper.strings },
        cheatSeparator       = { fg = newpaper.tag_navy, style = style.b_bold },
        cheatCode            = { fg = newpaper.darkorange },
    }
end

return M
