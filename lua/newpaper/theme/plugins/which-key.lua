local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        WhichKey          = { fg = newpaper.keywords },
        WhichKeyGroup     = { fg = newpaper.teal, style = style.b_bold },
        WhichKeySeparator = { fg = newpaper.darkgreen },
        WhichKeyDesc      = { fg = newpaper.strings },
        WhichKeyFloat     = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        WhichKeyValue     = { fg = newpaper.darkgrey },
    }
end

return M
