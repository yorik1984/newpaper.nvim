local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        Cursor               = { fg = newpaper.bg, bg = newpaper.cursor },
        CurSearch            = { fg = newpaper.search_fg, bg = newpaper.search_bg, style = style.b_bold },
        nCursor              = { fg = newpaper.bg, bg = newpaper.teal },
        vCursor              = { fg = newpaper.bg, bg = newpaper.purple },
        veCursor             = { fg = newpaper.bg, bg = newpaper.darkpurple },
        oCursor              = { fg = newpaper.bg, bg = newpaper.navy },
        iCursor              = { fg = newpaper.bg, bg = newpaper.green },
        rCursor              = { fg = newpaper.bg, bg = newpaper.magenta },
        cCursor              = { fg = newpaper.bg, bg = newpaper.darkorange },
        ciCursor             = { fg = newpaper.bg, bg = newpaper.darkorange },
        crCursor             = { fg = newpaper.bg, bg = newpaper.darkorange },
        smCursor             = { fg = newpaper.bg, bg = newpaper.yellow },
        TermCursor           = { style = style.reverse },
        TermCursorNC         = { style = style.reverse },
        CursorColumn         = { bg = newpaper.active },
        CursorLine           = { bg = newpaper.active },
        CursorIM             = { fg = newpaper.bg, bg = newpaper.cursor },
        CursorLineNr         = { fg = newpaper.cursor_nr_fg, bg = newpaper.cursor_nr_bg },
        CursorLineFold       = { fg = newpaper.folded_fg, bg = newpaper.cursor_nr_bg },
        CursorLineSign       = { bg = newpaper.linenumber_bg },
        ColorColumn          = { fg = newpaper.none, bg = newpaper.colorcol },
        CommandMode          = { fg = newpaper.orange, style = style.reverse },
        Comment              = { fg = newpaper.comments, style = style.c_style },
        Conceal              = { fg = newpaper.tex_math },
        DiffAdd              = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
        DiffChange           = { fg = newpaper.texts, bg = newpaper.diffchange_bg },
        DiffDelete           = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
        DiffText             = { fg = newpaper.texts, bg = newpaper.difftext_bg },
        diffAdded            = { fg = newpaper.git_added },
        diffRemoved          = { fg = newpaper.git_removed },
        diffChanged          = { fg = newpaper.git_modified },
        diffOldFile          = { fg = newpaper.texts },
        diffNewFile          = { fg = newpaper.titles },
        diffFile             = { fg = newpaper.grey },
        diffLine             = { fg = newpaper.blue },
        diffIndexLine        = { fg = newpaper.purple },
        Directory            = { fg = newpaper.teal, style = style.b_bold },
        EndOfBuffer          = { fg = newpaper.eob, bg = newpaper.none },
        ErrorMsg             = { fg = newpaper.errormsg_fg },
        FloatBorder          = { fg = newpaper.borders, bg = newpaper.float_bg },
        FloatTitle           = { fg = newpaper.borders, bg = newpaper.float_bg, style = style.b_bold },
        FoldColumn           = { fg = newpaper.folded_fg, bg = newpaper.linenumber_bg },
        Folded               = { fg = newpaper.folded_fg, bg = newpaper.folded_bg },
        IncSearch            = { fg = newpaper.magenta, bg = newpaper.search_bg, style = style.b_bold },
        InsertMode           = { fg = newpaper.darkgreen, style = style.reverse },
        LineNr               = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg },
        MatchParen           = { bg = newpaper.aqua, style = style.b_bold },
        ModeMsg              = { fg = newpaper.accent, style = style.b_bold },
        MoreMsg              = { fg = newpaper.accent },
        MsgArea              = { fg = newpaper.msgarea_fg, bg = newpaper.msgarea_bg },
        NonText              = { fg = newpaper.disabled },
        Normal               = { fg = newpaper.normal_fg, bg = newpaper.normal_bg },
        NormalFloat          = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        NormalMode           = { fg = newpaper.teal, style = style.reverse },
        NormalSB             = { fg = newpaper.sb_fg, bg = newpaper.sb_bg },
        Pmenu                = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
        PmenuSbar            = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
        PmenuSel             = { bg = newpaper.pmenu_sel },
        PmenuThumb           = { bg = newpaper.teal },
        Question             = { fg = newpaper.darkgreen },
        QuickFixLine         = { fg = newpaper.silver, bg = newpaper.titles, style = style.reverse },
        ReplacelMode         = { fg = newpaper.magenta, style = style.reverse },
        Search               = { fg = newpaper.search_fg, bg = newpaper.search_bg },
        SignColumn           = { bg = newpaper.linenumber_bg },
        SpecialKey           = { fg = newpaper.disabled },
        SpellBad             = { bg = newpaper.spellbad, sp = newpaper.red, style = style.error },
        SpellCap             = { bg = newpaper.spellcap, sp = newpaper.tag_navy, style = style.error },
        SpellLocal           = { bg = newpaper.spelllocal, sp = newpaper.regexp_green, style = style.error },
        SpellRare            = { bg = newpaper.spellrare, sp = newpaper.regexp_orange, style = style.error },
        StatusLine           = { fg = newpaper.teal, bg = newpaper.silver },
        StatusLineNC         = { fg = newpaper.lightgrey, bg = newpaper.silver },
        StatusLineTerm       = { fg = newpaper.fg, bg = newpaper.silver },
        StatusLineTermNC     = { fg = newpaper.lightgrey, bg = newpaper.bg },
        Substitute           = { fg = newpaper.search_fg, bg = newpaper.yellow },
        TabLineFill          = { bg = newpaper.tabline_bg },
        Tabline              = { fg = newpaper.tabline_inactive_fg, bg = newpaper.tabline_inactive_bg },
        TablineSel           = { fg = newpaper.tabline_active_fg, bg = newpaper.tabline_active_bg, style = style.b_bold_i },
        Title                = { fg = newpaper.titles, style = style.b_bold },
        ToolbarButton        = { fg = newpaper.fg, style = style.b_bold },
        ToolbarLine          = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
        VertSplit            = { link = "WinSeparator" },
        Visual               = { fg = newpaper.bg, bg = newpaper.selection },
        VisualMode           = { fg = newpaper.purple, style = style.reverse },
        VisualNOS            = { fg = newpaper.bg, bg = newpaper.selection },
        WarningMsg           = { fg = newpaper.magenta },
        Warnings             = { fg = newpaper.magenta },
        Whitespace           = { fg = newpaper.disabled },
        WildMenu             = { fg = newpaper.wildmenu_fg, bg = newpaper.wildmenu_bg, style = style.b_bold },
        WinBar               = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },
        WinBarNC             = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },
        WinSeparator         = { fg = newpaper.win_border, bg = newpaper.none },
        healthError          = { fg = newpaper.errormsg_fg },
        healthSuccess        = { fg = newpaper.hint_fg },
        healthWarning        = { fg = newpaper.warn_fg },
        qfLineNr             = { fg = newpaper.silver, bg = newpaper.titles, style = style.reverse },
        RedrawDebugNormal    = { fg = newpaper.bg, bg = newpaper.fg },
        RedrawDebugClear     = { fg = newpaper.fg, bg = newpaper.lightorange },
        RedrawDebugComposed  = { fg = newpaper.fg, bg = newpaper.green },
        RedrawDebugRecompose = { fg = newpaper.fg, bg = newpaper.red },

        -- Custom newpaper groups --
        CursorLineSB         = { fg = newpaper.cursor_nr_fg, bg = newpaper.aqua },
        CursorLineSignSB     = { bg = newpaper.sb_contrast_bg },
        CursorLineTerm       = { bg = newpaper.none, ctermbg = newpaper.none },
        FloatBorderNorm      = { fg = newpaper.borders, bg = newpaper.bg },
        FloatBorderTerm      = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
        FloatCLineNr         = { fg = newpaper.cursor_nr_fg, bg = newpaper.float_bg },
        FloatCLineSign       = { bg = newpaper.float_bg },
        FloatFoldColumn      = { fg = newpaper.folded_fg, bg = newpaper.float_bg },
        FloatLineNr          = { fg = newpaper.linenumber_fg, bg = newpaper.float_bg },
        FloatSign            = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        FloatTitleNorm       = { fg = newpaper.borders, bg = newpaper.bg, style = style.b_bold },
        FoldColumnSB         = { fg = newpaper.folded_fg, bg = newpaper.sb_contrast_bg },
        FoldColumnTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        LineNrSB             = { fg = newpaper.linenumber_fg, bg = newpaper.sb_contrast_bg },
        LineNrTerm           = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        NonTextVisual        = { fg = newpaper.tex_tikz_orange, bg = newpaper.selection },
        NormalContrastSB     = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
        NormalInverse        = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
        NormalTerm           = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        NormalTermFloat      = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
        PmenuBorder          = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
        SignColumnSB         = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
        SignColumnTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
        TermCursorNCTerm     = { style = style.reverse },
        TermCursorTerm       = { style = style.reverse },
        Italic               = { style = style.italic },
        Bold                 = { style = style.bold },
    }
end

return M
