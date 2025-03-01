local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        MasonBackdrop                    = { bg = newpaper.bg },
        MasonHeader                      = { fg = newpaper.orange, style = style.b_bold },
        MasonHeaderSecondary             = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
        MasonHighlight                   = { fg = newpaper.darkgreen },
        MasonHighlightBlock              = { fg = newpaper.fg, bg = newpaper.aqua, },
        MasonHighlightBlockBold          = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
        MasonHighlightSecondary          = { fg = newpaper.orange },
        MasonHighlightBlockSecondary     = { fg = newpaper.fg, bg = newpaper.lightorange },
        MasonHighlightBlockBoldSecondary = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
        MasonLink                        = { fg = newpaper.links, style = style.links },
        MasonMuted                       = { fg = newpaper.comments },
        MasonMutedBlock                  = { fg = newpaper.grey, bg = newpaper.bg },
        MasonMutedBlockBold              = { fg = newpaper.comments, style = style.b_bold },
        MasonError                       = { fg = newpaper.errormsg_fg },
        MasonHeading                     = { fg = newpaper.keywords, style = style.b_bold },
    }
end

return M
