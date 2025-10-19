local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        CursorLineSB     = { fg = newpaper.cursor_nr_fg, bg = newpaper.aqua },
        CursorLineSignSB = { bg = newpaper.sb_contrast_bg },
        CursorLineTerm   = { bg = newpaper.none, ctermbg = newpaper.none },
        FloatBorderNorm  = { fg = newpaper.borders, bg = newpaper.bg },
        FloatBorderTerm  = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
        FloatCLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.float_bg },
        FloatCLineSign   = { bg = newpaper.float_bg },
        FloatFoldColumn  = { fg = newpaper.folded_fg, bg = newpaper.float_bg },
        FloatLineNr      = { fg = newpaper.linenumber_fg, bg = newpaper.float_bg },
        FloatSign        = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        FloatTitleNorm   = { fg = newpaper.borders, bg = newpaper.bg, style = style.b_bold },
        FoldColumnSB     = { fg = newpaper.folded_fg, bg = newpaper.sb_contrast_bg },
        FoldColumnTerm   = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        LineNrSB         = { fg = newpaper.linenumber_fg, bg = newpaper.sb_contrast_bg },
        LineNrTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        NonTextVisual    = { fg = newpaper.tex_tikz_orange, bg = newpaper.selection },
        NormalContrastSB = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
        NormalInverse    = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
        NormalTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        NormalTermFloat  = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
        PmenuBorder      = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
        SignColumnSB     = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
        SignColumnTerm   = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        TermCursorNCTerm = { style = style.reverse },
        TermCursorTerm   = { style = style.reverse },
        Italic           = { style = style.italic },
        Bold             = { style = style.bold },
    }
end

return M
