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
            -- general
            TitleString           = { fg = newpaper.fg },
            TitleIcon             = { fg = newpaper.red },
            SagaBorder            = { fg = newpaper.border, bg = newpaper.float_bg, default = false },
            SagaNormal            = { fg = newpaper.float_fg, bg = newpaper.float_bg, default = false },
            SagaExpand            = { fg = newpaper.red },
            SagaCollapse          = { fg = newpaper.red },
            SagaBeacon            = { bg = newpaper.lightviolet },
            -- code action
            ActionPreviewNormal   = { link = "SagaNormal" },
            ActionPreviewBorder   = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            ActionPreviewTitle    = { fg = newpaper.green, style = style.b_bold },
            CodeActionNormal      = { link = "SagaNormal" },
            CodeActionBorder      = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            CodeActionText        = { fg = newpaper.olive },
            CodeActionNumber      = { fg = newpaper.green },
            -- finder
            FinderSelection       = { fg = newpaper.darkgreen, style = style.b_bold },
            FinderFileName        = { fg = newpaper.navy },
            FinderCount           = { fg = newpaper.orange },
            FinderIcon            = { fg = newpaper.tag_navy },
            FinderType            = { fg = newpaper.purple },
            --finder spinner
            FinderSpinnerTitle    = { fg = newpaper.purple, style = style.b_bold },
            FinderSpinner         = { fg = newpaper.lightmagenta },
            FinderPreviewSearch   = { link = "Search" },
            FinderVirtText        = { fg = newpaper.red },
            FinderNormal          = { link = "SagaNormal" },
            FinderBorder          = { fg = newpaper.blue, bg = newpaper.float_bg },
            FinderPreviewBorder   = { fg = newpaper.orange, bg = newpaper.float_bg},
            -- definition
            DefinitionBorder      = { fg = newpaper.regexp_blue, bg = newpaper.float_bg },
            DefinitionNormal      = { link = "SagaNormal" },
            DefinitionSearch      = { link = "Search" },
            -- hover
            HoverNormal           = { link = "SagaNormal" },
            HoverBorder           = { fg = newpaper.teal, bg = newpaper.float_bg },
            -- rename
            RenameBorder          = { fg = newpaper.green, bg = newpaper.float_bg },
            RenameNormal          = { fg = newpaper.fg, bg = newpaper.float_bg },
            RenameMatch           = { link = "Search" },
            -- diagnostic
            DiagnosticBorder      = { fg = newpaper.border, bg = newpaper.float_bg },
            DiagnosticSource      = { fg = newpaper.tex_verb },
            DiagnosticNormal      = { link = "SagaNormal" },
            DiagnosticErrorBorder = { fg = newpaper.error_fg, bg = newpaper.float_bg },
            DiagnosticWarnBorder  = { fg = newpaper.warn_fg,  bg = newpaper.float_bg },
            DiagnosticHintBorder  = { fg = newpaper.hint_fg,  bg = newpaper.float_bg },
            DiagnosticInfoBorder  = { fg = newpaper.info_fg,  bg = newpaper.float_bg },
            DiagnosticPos         = { fg = newpaper.darkorange },
            DiagnosticWord        = { link = "SagaNormal" },
            -- Call Hierachry
            OutlinePreviewBorder  = { link = "SagaBorder" },
            OutlinePreviewNormal  = { fg = newpaper.darkgrey, bg = newpaper.float_bg },
            -- Float term
            TerminalBorder        = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
            TerminalNormal        = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },

            -- LspSagaWinbar
            LspSagaWinbarFile       = { fg = newpaper.teal, bg = newpaper.winbar_bg },
            LspSagaWinbarWord       = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },
            LspSagaWinbarFolderName = { fg = newpaper.navy, bg = newpaper.winbar_bg },
            LspSagaWinbarSep        = { fg = newpaper.red, bg = newpaper.winbar_bg },
        }
        return plugins
    end

    -- stylua: ignore end

    return lspsagaSyn
end

return M
