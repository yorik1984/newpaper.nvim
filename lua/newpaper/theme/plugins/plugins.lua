local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {

        -- Treesitter plugins
        TreesitterContextLineNumber = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg, style = style.b_bold },
        TreesitterContextBottom     = { style = style.underline, sp = newpaper.contextchar },

        -- Diff -----------------------------------------------------------
        diffAdded                   = { fg = newpaper.git_added },
        diffRemoved                 = { fg = newpaper.git_removed },
        diffChanged                 = { fg = newpaper.git_modified },
        diffOldFile                 = { fg = newpaper.texts },
        diffNewFile                 = { fg = newpaper.titles },
        diffFile                    = { fg = newpaper.grey },
        diffLine                    = { fg = newpaper.blue },
        diffIndexLine               = { fg = newpaper.purple },

        -- Fern -----------------------------------------------------------
        FernBranchText              = { fg = newpaper.blue },

        -- Flash ----------------------------------------------------------
        FlashBackdrop               = { fg = newpaper.comment },
        FlashLabel                  = { fg = newpaper.fg, bg = newpaper.magenta_bg, style = style.b_bold },

        -- GitGutter ------------------------------------------------------
        GitGutterAdd                = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        GitGutterChange             = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        GitGutterDelete             = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },

        -- Glyph palette --------------------------------------------------
        GlyphPalette1               = { fg = newpaper.red },
        GlyphPalette2               = { fg = newpaper.green },
        GlyphPalette3               = { fg = newpaper.darkorange },
        GlyphPalette4               = { fg = newpaper.blue },
        GlyphPalette6               = { fg = newpaper.teal },
        GlyphPalette7               = { fg = newpaper.aqua },
        GlyphPalette9               = { fg = newpaper.magenta },
        GlyphPaletteDirectory       = { fg = newpaper.navy },

        -- Headlines ------------------------------------------------------
        Headline                    = { bg = newpaper.none, style = style.k_bold },
        CodeBlock                   = { bg = newpaper.codeblock },
        Dash                        = { fg = newpaper.orange, bg = newpaper.none },

        -- Highlight-undo --------------------------------------------------
        HighlightUndo               = { bg = newpaper.diffchange_bg },
        HighlightRedo               = { bg = newpaper.diffadd_bg },

        -- Hop ------------------------------------------------------------
        HopNextKey                  = { fg = newpaper.accent, style = style.b_bold },
        HopNextKey1                 = { fg = newpaper.purple, style = style.b_bold },
        HopNextKey2                 = { fg = newpaper.blue },
        HopUnmatched                = { fg = newpaper.comment },

        -- Illuminate -----------------------------------------------------
        illuminatedWord             = { bg = newpaper.silver },
        illuminatedCurWord          = { bg = newpaper.contrast },

        -- IndentBlankline ------------------------------------------------
        IblScope                    = { fg = newpaper.contextchar },

        -- LanguageTool ---------------------------------------------------
        LanguageToolCmd             = { fg = newpaper.comment },
        LanguageToolErrorCount      = { fg = newpaper.orange, bg = newpaper.active, style = style.b_bold },
        LanguageToolLabel           = { fg = newpaper.darkgreen },
        LanguageToolUrl             = { fg = newpaper.links, style = style.links },
        LanguageToolGrammarError    = { fg = newpaper.fg, bg = newpaper.spellrare, style = style.error },
        LanguageToolSpellingError   = { fg = newpaper.fg, bg = newpaper.spellbad, style = style.error },

        -- LazyGit --------------------------------------------------------
        LazyGitFloat                = { fg = newpaper.git_fg, bg = newpaper.term_fl_bg },
        LazyGitBorder               = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },

        -- Lua-dev --------------------------------------------------------
        RedrawDebugNormal           = { fg = newpaper.bg, bg = newpaper.fg },
        RedrawDebugClear            = { fg = newpaper.fg, bg = newpaper.lightorange },
        RedrawDebugComposed         = { fg = newpaper.fg, bg = newpaper.green },
        RedrawDebugRecompose        = { fg = newpaper.fg, bg = newpaper.red },

        -- Lualine custom colors
        LuaLineDiffAdd              = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        LuaLineDiffChang            = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        LuaLineDiffDelete           = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
        LualineDiagnosticError      = { fg = newpaper.error_fg, bg = newpaper.silver },
        LualineDiagnosticWarn       = { fg = newpaper.warn_fg, bg = newpaper.silver },
        LualineDiagnosticInfo       = { fg = newpaper.info_fg, bg = newpaper.silver },
        LualineDiagnosticHint       = { fg = newpaper.hint_fg, bg = newpaper.silver },

        -- Nvim dap -------------------------------------------------------
        DapBreakpoint               = { fg = newpaper.darkgreen, bg = newpaper.linenumber_bg },
        DapBreakpointCondition      = { fg = newpaper.darkyellow, bg = newpaper.linenumber_bg },
        DapBreakpointRejected       = { fg = newpaper.ocean, bg = newpaper.linenumber_bg },
        DapLogPoint                 = { fg = newpaper.strings, bg = newpaper.linenumber_bg },
        DapStopped                  = { fg = newpaper.red, bg = newpaper.linenumber_bg },

        -- Nvim-dap-ui ----------------------------------------------------
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

        -- Nvim-dap-virtual-text ------------------------------------------
        NvimDapVirtualText          = { fg = newpaper.grey, style = style.c_style },
        NvimDapVirtualTextChanged   = { fg = newpaper.warn_fg, style = style.c_style },
        NvimDapVirtualTextError     = { fg = newpaper.error_fg, style = style.c_style },
        NvimDapVirtualTextInfo      = { fg = newpaper.info_fg, style = style.c_style },

        -- Sneak ----------------------------------------------------------
        Sneak                       = { fg = newpaper.bg, bg = newpaper.accent },
        SneakScope                  = { bg = newpaper.selection },

        -- Trim -----------------------------------------------------------
        ExtraWhitespace             = { fg = newpaper.disabled, bg = newpaper.pink },

        -- Vim-matchup ----------------------------------------------------
        MatchWord                   = { bg = newpaper.lightviolet, style = style.b_bold },

        -- Virt-column ----------------------------------------------------
        VirtColumn                  = { fg = newpaper.colorcol, bg = newpaper.none, nocombine = true },

        -- WhichKey -------------------------------------------------------
        WhichKey                    = { fg = newpaper.keywords },
        WhichKeyGroup               = { fg = newpaper.teal, style = style.b_bold },
        WhichKeySeparator           = { fg = newpaper.darkgreen },
        WhichKeyDesc                = { fg = newpaper.strings },
        WhichKeyFloat               = { fg = newpaper.float_fg, bg = newpaper.float_bg },
        WhichKeyValue               = { fg = newpaper.darkgrey },
    }
end

return M
