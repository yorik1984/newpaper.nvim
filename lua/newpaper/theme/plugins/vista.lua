local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        VistaParenthesis = { fg = newpaper.navy, style = style.b_bold },
        VistaScope       = { fg = newpaper.keywords, style = style.k_style },
        VistaTag         = { fg = newpaper.navy },
        VistaKind        = { fg = newpaper.ocean, style = style.k_style },
        VistaScopeKind   = { fg = newpaper.teal, style = style.underline },
        VistaLineNr      = { fg = newpaper.cursor_nr_fg },
        VistaColon       = { fg = newpaper.orange },
        VistaIcon        = { fg = newpaper.teal },
        VistaArgs        = { fg = newpaper.darkengreen, style = style.b_italic },
        VistaPublic      = { fg = newpaper.green, style = style.k_style },
        VistaProtected   = { fg = newpaper.maroon, style = style.k_style },
        VistaPrivate     = { fg = newpaper.darkyellow, style = style.k_style },
        VistaFloat       = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        VistaBracket     = { fg = newpaper.navy, style = style.b_bold },
        VistaPrefix      = { fg = newpaper.ocean },
        VistaHeadNr      = { fg = newpaper.darkgrey },
    }
end

return M
