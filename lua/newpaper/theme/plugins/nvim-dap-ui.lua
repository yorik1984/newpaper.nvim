local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        DapUIVariable               = { fg = newpaper.darkengreen, style = style.v_style },
        DapUIScope                  = { fg = newpaper.teal, style = style.b_bold },
        DapUIType                   = { fg = newpaper.keywords },
        DapUIValue                  = { fg = newpaper.teal },
        DapUIModifiedValue          = { fg = newpaper.red },
        DapUIDecoration             = { fg = newpaper.blue },
        DapUIThread                 = { fg = newpaper.ocean },
        DapUIStoppedThread          = { fg = newpaper.ocean, style = style.b_bold },
        DapUIFrameName              = { fg = newpaper.navy },
        DapUISource                 = { fg = newpaper.lightblue },
        DapUILineNumber             = { fg = newpaper.darkorange },
        DapUIFloatBorder            = { fg = newpaper.borders },
        DapUIWatchesEmpty           = { fg = newpaper.magenta },
        DapUIWatchesValue           = { fg = newpaper.nephritis },
        DapUIWatchesError           = { fg = newpaper.error_fg },
        DapUIBreakpointsPath        = { fg = newpaper.lightblue, style = style.b_bold },
        DapUIBreakpointsInfo        = { fg = newpaper.darkyellow },
        DapUIBreakpointsCurrentLine = { fg = newpaper.orange, style = style.b_bold },
        DapUIBreakpointsLine        = { fg = newpaper.orange },
    }
end

return M
