local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        DifftAdd        = { fg = newpaper.diffadd_fg, bg = newpaper.diffadd_bg },
        DifftDelete     = { fg = newpaper.diffdelete_fg, bg = newpaper.diffdelete_bg },
        DifftChange     = { fg = newpaper.diffchange_fg, bg = newpaper.diffchange_bg },
        DifftInfo       = { fg = newpaper.strings },
        DifftHint       = { fg = newpaper.purple },
        DifftDim        = { fg = newpaper.comments },
        DifftFileHeader = { fg = newpaper.blue, style = style.b_bold },
    }
end

return M
