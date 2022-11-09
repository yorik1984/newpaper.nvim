local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local lspsagaSyn  = {}
    lspsagaSyn.colors = configColors
    lspsagaSyn.style  = configStyle
    local newpaper    = lspsagaSyn.colors
    local style       = lspsagaSyn.style

    lspsagaSyn.loadPlugins = function()
        local plugins = {

            -- code action
            LspSagaCodeActionTitle        = { fg = newpaper.green, style = style.b_bold },
            LspSagaCodeActionBorder       = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            LspSagaCodeActionTrunCateLine = { link = "LspSagaCodeActionBorder" },
            LspSagaCodeActionContent      = { fg = newpaper.olive },

            -- finder
            LspSagaLspFinderBorder        = { fg = newpaper.blue, bg = newpaper.float_bg },
            LspSagaAutoPreview            = { fg = newpaper.orange, bg = newpaper.float_bg},
            LspSagaFinderSelection        = { fg = newpaper.darkgreen, style = style.b_bold },
            TargetFileName                = { fg = newpaper.comment, style = style.underline },
            FinderParam                   = { fg = newpaper.blueviolet, bg = newpaper.darkgrey, style = style.b_bold },
            FinderVirtText                = { fg = newpaper.red },
            DefinitionsIcon               = { fg = newpaper.tag_navy },
            Definitions                   = { fg = newpaper.purple, style = style.b_bold },
            DefinitionCount               = { fg = newpaper.orange },
            ReferencesIcon                = { fg = newpaper.tag_navy },
            References                    = { fg = newpaper.darkpurple, style = style.b_bold },
            ReferencesCount               = { fg = newpaper.orange },
            ImplementsIcon                = { fg = newpaper.olive },
            Implements                    = { fg = newpaper.blueviolet, style = style.b_bold },
            ImplementsCount               = { link = "Title" },

            --finder spinner
            FinderSpinnerBorder           = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            FinderSpinnerTitle            = { fg = newpaper.magenta, style = style.b_bold },
            FinderSpinner                 = { fg = newpaper.magenta },
            FinderPreviewSearch           = { link = "Search" },

            -- definition
            DefinitionBorder              = { fg = newpaper.regexp_blue, bg = newpaper.float_bg },
            DefinitionArrow               = { fg = newpaper.maroon },
            DefinitionSearch              = { link = "Search" },
            DefinitionFile                = { fg = newpaper.navy, bg = newpaper.float_bg },

            -- hover
            LspSagaHoverBorder            = { fg = newpaper.teal, bg = newpaper.float_bg },
            LspSagaHoverTrunCateLine      = { link = "LspSagaHoverBorder" },

            -- rename
            LspSagaRenameBorder           = { fg = newpaper.green, bg = newpaper.float_bg },
            LspSagaRenameMatch            = { link = "Search" },

            -- diagnostic
            LspSagaDiagnosticSource       = { fg = newpaper.tex_verb },
            LspSagaDiagnosticError        = { fg = newpaper.error_fg, bg = newpaper.float_bg},
            LspSagaDiagnosticWarn         = { fg = newpaper.warn_fg,  bg = newpaper.float_bg },
            LspSagaDiagnosticInfo         = { fg = newpaper.info_fg,  bg = newpaper.float_bg },
            LspSagaDiagnosticHint         = { fg = newpaper.hint_fg,  bg = newpaper.float_bg },
            LspSagaErrorTrunCateLine      = { fg = newpaper.error_fg, bg = newpaper.float_bg},
            LspSagaWarnTrunCateLine       = { fg = newpaper.warn_fg,  bg = newpaper.float_bg },
            LspSagaInfoTrunCateLine       = { fg = newpaper.info_fg,  bg = newpaper.float_bg },
            LspSagaHintTrunCateLine       = { fg = newpaper.hint_fg,  bg = newpaper.float_bg },
            LspSagaDiagnosticBorder       = { fg = newpaper.border,   bg = newpaper.float_bg },
            LspSagaDiagnosticHeader       = { fg = newpaper.keyword },
            DiagnosticQuickFix            = { fg = newpaper.green,    style = style.b_bold },
            DiagnosticMap                 = { fg = newpaper.keyword },
            DiagnosticLineCol             = { fg = newpaper.grey },
            LspSagaDiagnosticTruncateLine = { fg = newpaper.border, bg = newpaper.float_bg },
            ColInLineDiagnostic           = { link = "Comment" },

            -- signture help
            LspSagaSignatureHelpBorder    = { fg = newpaper.olive, bg = newpaper.float_bg },
            LspSagaShTrunCateLine         = { link = "LspSagaSignatureHelpBorder" },

            -- lightbulb
            LspSagaLightBulb              = { fg = newpaper.hint_fg },

            -- shadow
            SagaShadow                    = { fg = newpaper.grey },

            -- float
            LspSagaBorderTitle            = { fg = newpaper.orange, bg = newpaper.float_bg },

            -- Outline
            LSOutlinePreviewBorder        = { fg = newpaper.ocean, bg = newpaper.float_bg  },
            OutlineIndentEvn              = { fg = newpaper.regexp_magenta },
            OutlineIndentOdd              = { fg = newpaper.regexp_orange },
            OutlineFoldPrefix             = { fg = newpaper.maroon },
            OutlineDetail                 = { fg = newpaper.comment },

            -- all floatwindow of lspsaga
            LspFloatWinNormal             = { fg = newpaper.text, bg = newpaper.float_bg },
        }
        return plugins
    end

    -- stylua: ignore end

    return lspsagaSyn
end

return M
