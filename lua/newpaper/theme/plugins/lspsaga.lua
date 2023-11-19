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
            SagaTitle            = { fg = newpaper.purple, bg = newpaper.float_bg, style = style.b_bold },
            SagaBorder           = { fg = newpaper.borders, bg = newpaper.float_bg, default = false },
            SagaNormal           = { fg = newpaper.float_fg, bg = newpaper.float_bg, default = false },
            SagaToggle           = { fg = newpaper.grey },
            SagaCount            = { fg = newpaper.darkorange },
            SagaBeacon           = { bg = newpaper.lightviolet },
            SagaVirtLine         = { link = "Comment" },
            SagaSpinnerTitle     = { fg = newpaper.purple, style = style.b_bold },
            SagaSpinner          = { fg = newpaper.lightmagenta },
            SagaText             = { fg = newpaper.tex_verb },
            SagaSelect           = { fg = newpaper.orange, bg = newpaper.float_bg },
            SagaSearch           = { link = "Search" },
            SagaFinderFname      = { fg = newpaper.teal, bg = newpaper.float_bg },
            SagaDetail           = { link = "Comment" },
            SagaInCurrent        = { link = "KeyWord" },

            -- code action
            ActionFix            = { fg = newpaper.olive },
            ActionPreviewNormal  = { link = "SagaNormal" },
            ActionPreviewBorder  = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            ActionPreviewTitle   = { fg = newpaper.blue, bg = newpaper.float_bg, style = style.b_bold },
            CodeActionText       = { fg = newpaper.olive },
            CodeActionNumber     = { fg = newpaper.numbers },
            -- hover
            HoverNormal          = { link = "SagaNormal" },
            HoverBorder          = { fg = newpaper.teal, bg = newpaper.float_bg },
            -- rename
            RenameBorder         = { fg = newpaper.green, bg = newpaper.float_bg },
            RenameNormal         = { fg = newpaper.fg, bg = newpaper.float_bg },
            RenameMatch          = { link = "Search" },
            -- diagnostic
            DiagnosticBorder     = { fg = newpaper.border, bg = newpaper.float_bg },
            DiagnosticNormal     = { link = "SagaNormal" },
            DiagnosticText       = {},
            DiagnosticShowNormal = { link = "SagaNormal" },
            DiagnosticShowBorder = { link = "@property" },
            -- lightbulb
            SagaLightBulb        = { link = "DiagnosticSignHint" },
            -- Float term
            TerminalBorder       = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
            TerminalNormal       = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
            -- Implement
            SagaImpIcon          = { fg = newpaper.red },
            --Winbar
            SagaSep              = { fg = newpaper.red, bg = newpaper.winbar_bg },
            SagaFileName         = { fg = newpaper.teal, bg = newpaper.winbar_bg },
            SagaFolderName       = { fg = newpaper.teal, bg = newpaper.winbar_bg, style = style.b_bold },
            SagaWinbarFileName   = { link = "SagaFileName" },
            SagaWinbarFolderName = { link = "SagaFolderName" },
            SagaWinbarFolder     = { fg = newpaper.teal, bg = newpaper.winbar_bg },

        }
        return plugins
    end

    -- stylua: ignore end

    return lspsagaSyn
end

return M
