local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- general
        SagaActionTitle        = { fg = newpaper.bg, bg = newpaper.hint_fg },
        SagaButton             = { fg = newpaper.hint_fg },
        SagaTitle              = { fg = newpaper.purple, bg = newpaper.float_bg, style = style.b_bold },
        SagaBorder             = { fg = newpaper.borders, bg = newpaper.float_bg, default = false },
        SagaNormal             = { fg = newpaper.float_fg, bg = newpaper.float_bg, default = false },
        SagaToggle             = { fg = newpaper.grey },
        SagaCount              = { fg = newpaper.darkorange },
        SagaBeacon             = { bg = newpaper.lightviolet },
        SagaVirtLine           = { link = "Comment" },
        SagaSpinnerTitle       = { fg = newpaper.purple, style = style.b_bold },
        SagaSpinner            = { fg = newpaper.lightmagenta },
        SagaText               = { fg = newpaper.tex_verb },
        SagaSelect             = { fg = newpaper.orange, bg = newpaper.float_bg },
        SagaSearch             = { link = "Search" },
        SagaFinderFname        = { fg = newpaper.teal, bg = newpaper.float_bg },
        SagaDetail             = { link = "Comment" },
        SagaInCurrent          = { link = "KeyWord" },
        SagaSep                = { fg = newpaper.red },

        -- code action
        ActionPreviewNormal    = { link = "SagaNormal" },
        ActionPreviewBorder    = { fg = newpaper.lightblue, bg = newpaper.float_bg },
        ActionPreviewTitle     = { fg = newpaper.blue, bg = newpaper.float_bg, style = style.b_bold },
        CodeActionText         = { fg = newpaper.olive },
        CodeActionNumber       = { fg = newpaper.numbers },
        CodeActionCursorLine   = { link = "CursorLine" },
        -- hover
        HoverNormal            = { link = "SagaNormal" },
        HoverBorder            = { fg = newpaper.teal, bg = newpaper.float_bg },
        -- rename
        RenameBorder           = { fg = newpaper.green, bg = newpaper.float_bg },
        RenameNormal           = { fg = newpaper.fg, bg = newpaper.float_bg },
        RenameMatch            = { link = "Search" },
        -- diagnostic
        DiagnosticBorder       = { fg = newpaper.border, bg = newpaper.float_bg },
        DiagnosticNormal       = { link = "SagaNormal" },
        DiagnosticText         = {},
        DiagnosticShowNormal   = { link = "SagaNormal" },
        DiagnosticShowBorder   = { link = "@property" },
        DiagnosticERRORReverse = { fg = newpaper.bg, bg = newpaper.error_fg },
        DiagnosticWARNReverse  = { fg = newpaper.bg, bg = newpaper.warn_fg },
        DiagnosticINFOReverse  = { fg = newpaper.bg, bg = newpaper.info_fg },
        DiagnosticHINTReverse  = { fg = newpaper.bg, bg = newpaper.hint_fg },
        -- lightbulb
        SagaLightBulb          = { link = "DiagnosticSignHint" },
        -- Float term
        TerminalBorder         = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
        TerminalNormal         = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
        -- Implement
        SagaImpIcon            = { fg = newpaper.red },
        -- Winbar
        SagaWinbarSep          = { fg = newpaper.red },
        SagaWinbarFileName     = { fg = newpaper.teal },
        SagaWinbarFolderName   = { fg = newpaper.teal, style = style.b_bold },
        SagaWinbarFolder       = { fg = newpaper.teal, style = style.b_bold },

        SagaFolderName         = { link = "SagaWinbarFolderName" },
        SagaFolder             = { link = "SagaWinbarFolder" },
        SagaFileName           = { link = "SagaWinbarFileName" },
    }
end

return M
