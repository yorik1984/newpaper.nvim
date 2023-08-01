local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local theme    = {}
    theme.colors   = configColors
    theme.style    = configStyle
    local newpaper = theme.colors
    local style    = theme.style

    theme.loadSyntax = function()
        local syntax = {
            Boolean        = { fg = newpaper.boolean, style = style.bool_style },
            Character      = { fg = newpaper.darkengreen, style = style.o_style },
            Conditional    = { fg = newpaper.keyword, style = style.k_style },
            Constant       = { fg = newpaper.darkengreen },
            Debug          = { fg = newpaper.red },
            Define         = { fg = newpaper.magenta },
            Delimiter      = { fg = newpaper.persimona, style = style.d_style },
            Error          = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg },
            Exception      = { fg = newpaper.redorange },
            Float          = { fg = newpaper.magenta },
            Function       = { fg = newpaper.lua_navy, style = style.f_style },
            Identifier     = { fg = newpaper.variable, style = style.v_style },
            Ignore         = { fg = newpaper.disabled },
            Include        = { fg = newpaper.maroon },
            Keyword        = { fg = newpaper.keyword, style = style.k_style },
            Label          = { fg = newpaper.magenta },
            Macro          = { fg = newpaper.magenta },
            Method         = { fg = newpaper.ruby_navy, style = style.f_style },
            Noise          = { link = "Delimiter" },
            Number         = { fg = newpaper.number },
            Operator       = { fg = newpaper.navy, style = style.o_style },
            PreCondit      = { fg = newpaper.magenta },
            PreProc        = { fg = newpaper.navy },
            Quote          = { link = "String" },
            Repeat         = { fg = newpaper.keyword, style = style.k_style },
            Special        = { fg = newpaper.dark_maroon },
            SpecialChar    = { fg = newpaper.maroon },
            SpecialComment = { fg = newpaper.comment, style = style.k_style },
            Statement      = { fg = newpaper.keyword, style = style.k_style },
            StorageClass   = { fg = newpaper.class, style = style.k_style },
            String         = { fg = newpaper.string, style = style.s_style },
            Structure      = { fg = newpaper.darkpurple, style = style.k_style },
            Tag            = { fg = newpaper.tag, style = style.tag_style },
            Todo           = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
            Type           = { fg = newpaper.darkengreen },
            Typedef        = { fg = newpaper.maroon },
            Underlined     = { fg = newpaper.link, style = style.underline },
        }
        return syntax
    end

    theme.loadEditor     = function()
        local editor = {
            Cursor           = { fg = newpaper.bg, bg = newpaper.cursor },
            nCursor          = { fg = newpaper.bg, bg = newpaper.teal },
            vCursor          = { fg = newpaper.bg, bg = newpaper.purple },
            veCursor         = { fg = newpaper.bg, bg = newpaper.darkpurple },
            oCursor          = { fg = newpaper.bg, bg = newpaper.navy },
            iCursor          = { fg = newpaper.bg, bg = newpaper.green },
            rCursor          = { fg = newpaper.bg, bg = newpaper.magenta },
            cCursor          = { fg = newpaper.bg, bg = newpaper.darkorange },
            ciCursor         = { fg = newpaper.bg, bg = newpaper.darkorange },
            crCursor         = { fg = newpaper.bg, bg = newpaper.darkorange },
            smCursor         = { fg = newpaper.bg, bg = newpaper.yellow },
            TermCursor       = { style = style.reverse },
            TermCursorNC     = { style = style.reverse },
            CursorColumn     = { bg = newpaper.active },
            CursorLine       = { bg = newpaper.active },
            CursorIM         = { fg = newpaper.bg, bg = newpaper.cursor },
            CursorLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.cursor_nr_bg },
            CursorLineSign   = { bg = newpaper.linenumber_bg },
            ColorColumn      = { fg = newpaper.colorcolumn, bg = newpaper.none },
            CommandMode      = { fg = newpaper.orange, style = style.reverse },
            Comment          = { fg = newpaper.comment, style = style.c_style },
            Conceal          = { fg = newpaper.tex_math },
            DiffAdd          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            DiffChange       = { fg = newpaper.text, bg = newpaper.diffchange_bg },
            DiffDelete       = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            DiffText         = { fg = newpaper.text, bg = newpaper.difftext_bg },
            Directory        = { fg = newpaper.teal, style = style.b_bold },
            EndOfBuffer      = { fg = newpaper.eob, bg = newpaper.none },
            ErrorMsg         = { fg = newpaper.errormsg_fg },
            FloatBorder      = { fg = newpaper.border, bg = newpaper.float_bg },
            FloatTitle       = { fg = newpaper.border, bg = newpaper.float_bg, style = style.b_bold },
            FoldColumn       = { fg = newpaper.folded_fg, bg = newpaper.linenumber_bg },
            Folded           = { fg = newpaper.folded_fg, bg = newpaper.folded_bg },
            IncSearch        = { fg = newpaper.magenta, bg = newpaper.search_bg, style = style.b_bold },
            InsertMode       = { fg = newpaper.darkgreen, style = style.reverse },
            LineNr           = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg },
            MatchParen       = { bg = newpaper.aqua, style = style.b_bold },
            ModeMsg          = { fg = newpaper.accent, style = style.b_bold },
            MoreMsg          = { fg = newpaper.accent },
            MsgArea          = { fg = newpaper.msgarea_fg, bg = newpaper.msgarea_bg },
            NonText          = { fg = newpaper.disabled },
            Normal           = { fg = newpaper.normal_fg, bg = newpaper.normal_bg },
            NormalFloat      = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            NormalMode       = { fg = newpaper.teal, style = style.reverse },
            NormalSB         = { fg = newpaper.sb_fg, bg = newpaper.sb_bg },
            Pmenu            = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
            PmenuSbar        = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
            PmenuSel         = { bg = newpaper.aqua },
            PmenuThumb       = { bg = newpaper.teal },
            Question         = { fg = newpaper.darkgreen },
            QuickFixLine     = { fg = newpaper.highlight, bg = newpaper.title, style = style.reverse },
            ReplacelMode     = { fg = newpaper.magenta, style = style.reverse },
            Search           = { fg = newpaper.search_fg, bg = newpaper.search_bg },
            SignColumn       = { fg = newpaper.fg, bg = newpaper.linenumber_bg },
            SpecialKey       = { fg = newpaper.disabled },
            SpellBad         = { bg = newpaper.spellbad, sp = newpaper.red, style = style.error },
            SpellCap         = { bg = newpaper.spellcap, sp = newpaper.tag_navy, style = style.error },
            SpellLocal       = { bg = newpaper.spelllocal, sp = newpaper.regexp_green, style = style.error },
            SpellRare        = { bg = newpaper.spellrare, sp = newpaper.regexp_orange, style = style.error },
            StatusLine       = { fg = newpaper.teal, bg = newpaper.silver },
            StatusLineNC     = { fg = newpaper.lightgrey, bg = newpaper.silver },
            StatusLineTerm   = { fg = newpaper.fg, bg = newpaper.silver },
            StatusLineTermNC = { fg = newpaper.lightgrey, bg = newpaper.bg },
            Substitute       = { fg = newpaper.search_fg, bg = newpaper.yellow },
            TabLineFill      = { bg = newpaper.tabline_bg },
            Tabline          = { fg = newpaper.tabline_inactive_fg, bg = newpaper.tabline_inactive_bg },
            TablineSel       = { fg = newpaper.tabline_active_fg, bg = newpaper.tabline_active_bg, style = style.b_bold_i },
            Title            = { fg = newpaper.title, style = style.b_bold },
            ToolbarButton    = { fg = newpaper.fg, style = style.b_bold },
            ToolbarLine      = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
            VertSplit        = { link = "WinSeparator" },
            Visual           = { fg = newpaper.bg, bg = newpaper.selection },
            VisualMode       = { fg = newpaper.purple, style = style.reverse },
            VisualNOS        = { fg = newpaper.bg, bg = newpaper.selection },
            WarningMsg       = { fg = newpaper.magenta },
            Warnings         = { fg = newpaper.magenta },
            Whitespace       = { fg = newpaper.disabled },
            WildMenu         = { fg = newpaper.wildmenu_fg, bg = newpaper.wildmenu_bg, style = style.b_bold },
            WinBar           = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },
            WinBarNC         = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },
            WinSeparator     = { fg = newpaper.win_border, bg = newpaper.none },
            healthError      = { fg = newpaper.errormsg_fg },
            healthSuccess    = { fg = newpaper.hint_fg },
            healthWarning    = { fg = newpaper.warn_fg },
            qfLineNr         = { fg = newpaper.highlight, bg = newpaper.title, style = style.reverse },

            -- Custom newpaper groups
            NormalContrastSB = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
            LineNrSB         = { bg = newpaper.sb_contrast_bg },
            CursorLineSB     = { bg = newpaper.aqua },
            CursorLineSignSB = { bg = newpaper.sb_contrast_bg },
            SignColumnSB     = { bg = newpaper.sb_contrast_bg },
            NormalInverse    = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
            NormalTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            FloatBorderTerm  = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
            NormalTermFloat  = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
            LineNrTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            SignColumnTerm   = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            TermCursorTerm   = { style = style.reverse },
            TermCursorNCTerm = { style = style.reverse },
            CursorLineTerm   = { bg = newpaper.none, ctermbg = newpaper.none },
            PmenuBorder      = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
        }
        return editor
    end

    theme.loadTerminal   = function()
        vim.g.terminal_color_0  = newpaper.black
        vim.g.terminal_color_1  = newpaper.maroon
        vim.g.terminal_color_2  = newpaper.darkgreen
        vim.g.terminal_color_3  = newpaper.darkorange
        vim.g.terminal_color_4  = newpaper.navy
        vim.g.terminal_color_5  = newpaper.purple
        vim.g.terminal_color_6  = newpaper.teal
        vim.g.terminal_color_7  = newpaper.bg
        vim.g.terminal_color_8  = newpaper.darkgrey
        vim.g.terminal_color_9  = newpaper.red
        vim.g.terminal_color_10 = newpaper.green
        vim.g.terminal_color_11 = newpaper.orange
        vim.g.terminal_color_12 = newpaper.lightblue
        vim.g.terminal_color_13 = newpaper.lightmagenta
        vim.g.terminal_color_14 = newpaper.blue
        vim.g.terminal_color_15 = newpaper.fg
    end

    theme.loadTreeSitter = function()
        local treesitter = {
            ["@annotation"]            = { fg = newpaper.red },
            ["@attribute"]             = { fg = newpaper.blue },
            ["@boolean"]               = { fg = newpaper.boolean, style = style.bool_style },
            ["@character"]             = { fg = newpaper.orange },
            ["@character.special"]     = { fg = newpaper.maroon, nocombine = true },
            ["@comment"]               = { fg = newpaper.comment, style = style.c_style },
            ["@comment.documentation"] = { fg = newpaper.doc_comment, style = style.doc_style, nocombine = true },
            ["@conceal"]               = { fg = newpaper.tex_math },
            ["@conditional"]           = { fg = newpaper.keyword, style = style.k_style },
            ["@conditional.ternary"]   = { fg = newpaper.keyword, style = style.d_style },
            ["@constant"]              = { fg = newpaper.darkgreen, nocombine = true },
            ["@constant.builtin"]      = { fg = newpaper.maroon, nocombine = true },
            ["@constant.macro"]        = { fg = newpaper.maroon, nocombine = true },
            ["@constructor"]           = { fg = newpaper.lua_blue, style = style.br_style },
            ["@debug"]                 = { fg = newpaper.red },
            ["@define"]                = { fg = newpaper.magenta },
            ["@error"]                 = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg },
            ["@exception"]             = { fg = newpaper.redorange, style = style.k_style },
            ["@field"]                 = { fg = newpaper.ocean },
            ["@float"]                 = { fg = newpaper.magenta },
            ["@function"]              = { fg = newpaper.lua_navy, style = style.f_style },
            ["@function.builtin"]      = { fg = newpaper.tex_red, style = style.f_style },
            ["@function.call"]         = { fg = newpaper.lua_navy, style = style.f_style },
            ["@function.macro"]        = { fg = newpaper.magenta, style = style.f_style },
            ["@include"]               = { fg = newpaper.maroon },
            ["@keyword"]               = { fg = newpaper.keyword, style = style.k_style },
            ["@keyword.coroutine"]     = { fg = newpaper.tex_keyword, style = style.k_style },
            ["@keyword.function"]      = { fg = newpaper.darkpurple, style = style.k_style },
            ["@keyword.operator"]      = { fg = newpaper.tag_navy, style = style.o_style },
            ["@keyword.return"]        = { fg = newpaper.tex_keyword, style = style.k_style },
            ["@label"]                 = { fg = newpaper.redorange },
            ["@method"]                = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@method.call"]           = { fg = newpaper.navy, style = style.f_style },
            ["@namespace"]             = { fg = newpaper.darkyellow },
            ["@namespace.builtin"]     = { fg = newpaper.tex_magenta },
            ["@none"]                  = { fg = newpaper.disabled },
            ["@number"]                = { fg = newpaper.number },
            ["@operator"]              = { fg = newpaper.navy, style = style.o_style },
            ["@parameter"]             = { fg = newpaper.orange },
            ["@preproc"]               = { fg = newpaper.navy },
            ["@property"]              = { fg = newpaper.darkgreen },
            ["@punctuation.bracket"]   = { fg = newpaper.navy, style = style.br_style },
            ["@punctuation.delimiter"] = { fg = newpaper.persimona, style = style.d_style },
            ["@punctuation.special"]   = { fg = newpaper.lightmagenta },
            ["@repeat"]                = { fg = newpaper.keyword, style = style.k_style },
            ["@storageclass"]          = { fg = newpaper.lua_navy, style = style.k_style },
            ["@string"]                = { fg = newpaper.string, style = style.s_style },
            ["@string.documentation"]  = { fg = newpaper.regexp_blue, style = style.s_style },
            ["@string.escape"]         = { fg = newpaper.tex_magenta },
            ["@string.regex"]          = { fg = newpaper.regexp_blue },
            ["@string.special"]        = { fg = newpaper.dark_maroon, style = style.s_style },
            ["@symbol"]                = { fg = newpaper.darkyellow },
            ["@tag"]                   = { fg = newpaper.tag, style = style.tag_style },
            ["@tag.attribute"]         = { fg = newpaper.darkengreen },
            ["@tag.delimiter"]         = { fg = newpaper.tag_navy, style = style.tb_style },
            ["@text"]                  = { fg = newpaper.fg },
            ["@text.danger"]           = { fg = newpaper.bg, bg = newpaper.todo_error, style = style.b_bold },
            ["@text.diff.add"]         = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            ["@text.diff.delete"]      = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            ["@text.emphasis"]         = { style = style.italic },
            ["@text.environment"]      = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            ["@text.environment.name"] = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
            ["@text.literal"]          = { fg = newpaper.regexp_blue },
            ["@text.literal.block"]    = { fg = newpaper.regexp_blue },
            ["@text.math"]             = { fg = newpaper.tex_math },
            ["@text.note"]             = { fg = newpaper.bg, bg = newpaper.todo_hint, style = style.b_bold },
            ["@text.quote"]            = { fg = newpaper.tex_navy },
            ["@text.reference"]        = { fg = newpaper.tex_maroon },
            ["@text.strike"]           = { style = style.strike },
            ["@text.strong"]           = { style = style.bold },
            ["@text.title"]            = { fg = newpaper.title, style = style.b_bold },
            ["@text.todo"]             = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
            ["@text.underline"]        = { style = style.underline },
            ["@text.uri"]              = { fg = newpaper.link, style = style.link },
            ["@text.warning"]          = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
            ["@type"]                  = { fg = newpaper.darkengreen },
            ["@type.builtin"]          = { fg = newpaper.bluegreen, style = style.k_style },
            ["@type.definition"]       = { fg = newpaper.maroon },
            ["@type.qualifier"]        = { fg = newpaper.maroon, style = style.k_style },
            ["@variable"]              = { fg = newpaper.variable, style = style.v_style },
            ["@variable.builtin"]      = { fg = newpaper.olive, style = style.v_style },
            ["@variable.global"]       = { fg = newpaper.green, style = style.k_style },

            ["@text.title.1"]          = { fg = newpaper.tex_part_title, style = style.k_style },
            ["@text.title.2"]          = { fg = newpaper.teal, style = style.k_style },
            ["@text.title.3"]          = { fg = newpaper.blue, style = style.k_style },
            ["@text.title.4"]          = { fg = newpaper.tex_math, style = style.k_style },
            ["@text.title.5"]          = { fg = newpaper.tex_lightpurple, style = style.k_style },
            ["@text.title.6"]          = { fg = newpaper.tex_darkorange, style = style.k_style },
            ["@text.title.1.marker"]   = { fg = newpaper.tex_part_title },
            ["@text.title.2.marker"]   = { fg = newpaper.teal },
            ["@text.title.3.marker"]   = { fg = newpaper.blue },
            ["@text.title.4.marker"]   = { fg = newpaper.tex_math },
            ["@text.title.5.marker"]   = { fg = newpaper.tex_lightpurple },
            ["@text.title.6.marker"]   = { fg = newpaper.tex_darkorange },

            -- Locals
            ["@definition"]            = { fg = newpaper.fg, style = style.v_style },
            ["@definition.constant"]   = { fg = newpaper.darkgreen, nocombine = true },
            ["@definition.function"]   = { fg = newpaper.lua_navy, style = style.f_style },
            ["@definition.method"]     = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@definition.var"]        = { fg = newpaper.tex_math, style = style.v_style },
            ["@definition.parameter"]  = { fg = newpaper.darkorange, style = style.v_style },
            ["@definition.macro"]      = { fg = newpaper.lightmagenta },
            ["@definition.type"]       = { fg = newpaper.ruby_navy, style = style.k_style },
            ["@definition.field"]      = { fg = newpaper.tex_teal },
            ["@definition.enum"]       = { fg = newpaper.blue },
            ["@definition.namespace"]  = { fg = newpaper.blue, style = style.k_style },
            ["@definition.import"]     = { fg = newpaper.olive },
            ["@definition.associated"] = { fg = newpaper.bluegreen },

            -- TODO: Add more groups
            -- INFO: https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight

            -- LSP semantic tokens
            ["@lsp.type.class"]         = { link = "@storageclass" },
            ["@lsp.type.comment"]       = { default = true },
            ["@lsp.type.decorator"]     = { link = "@function.builtin" },
            ["@lsp.type.enum"]          = { link = "@number" },
            ["@lsp.type.enumMember"]    = { link = "@constant" },
            ["@lsp.type.function"]      = { link = "@function" },
            ["@lsp.type.interface"]     = { link = "@keyword.function" },
            ["@lsp.type.macro"]         = { link = "@function.macro" },
            ["@lsp.type.method"]        = { link = "@method" },
            ["@lsp.type.namespace"]     = { link = "@namespace" },
            ["@lsp.type.parameter"]     = { link = "@parameter" },
            ["@lsp.type.property"]      = { link = "@field" },
            ["@lsp.type.struct"]        = { link = "@symbol" },
            ["@lsp.type.type"]          = { link = "@type" },
            ["@lsp.type.typeParameter"] = { link = "@definition.parameter" },

            ["@lsp.typemod.class.default_library"]      = { link = "@type.builtin" },
            ["@lsp.typemod.enum.default_library"]       = { link = "@type.builtin" },
            ["@lsp.typemod.enumMember.default_library"] = { link = "@constant.builtin" },
            ["@lsp.typemod.function.default_library"]   = { link = "@function.builtin" },
            ["@lsp.typemod.macro.default_library"]      = { link = "@function.builtin" },
            ["@lsp.typemod.method.default_library"]     = { link = "@function.builtin" },
            ["@lsp.typemod.namespace.declaration"]      = { link = "@definition.namespace" },
            ["@lsp.typemod.operator.injected"]          = { link = "@operator" },
            ["@lsp.typemod.parameter.declaration"]      = { link = "@parameter" },
            ["@lsp.typemod.string.injected"]            = { link = "@string" },
            ["@lsp.typemod.type.default_library"]       = { link = "@type.builtin" },
            ["@lsp.typemod.variable.default_library"]   = { link = "@constant.builtin" },
            ["@lsp.typemod.variable.definition"]        = { link = "@variable.builtin" },
            ["@lsp.typemod.variable.global"]            = { link = "@namespace.builtin" },
            ["@lsp.typemod.variable.injected"]          = { link = "@variable" },

            -- Treesitter plugins
            TreesitterContextLineNumber = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg, style = style.b_bold },
            TreesitterContextBottom     = { style = style.underline, sp = newpaper.violet },
        }

        return treesitter
    end

    theme.loadPlugins = function()
        local plugins = {
            -- Diff -----------------------------------------------------------
            diffAdded                   = { fg = newpaper.git_added },
            diffRemoved                 = { fg = newpaper.git_removed },
            diffChanged                 = { fg = newpaper.git_modified },
            diffOldFile                 = { fg = newpaper.text },
            diffNewFile                 = { fg = newpaper.title },
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

            -- GitSigns -------------------------------------------------------
            GitSignsAdd                 = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsAddNr               = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsAddLn               = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsChange              = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsChangeNr            = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsChangeLn            = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsDelete              = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
            GitSignsDeleteNr            = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
            GitSignsDeleteLn            = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },

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

            -- Hop ------------------------------------------------------------
            HopNextKey                  = { fg = newpaper.accent, style = style.b_bold },
            HopNextKey1                 = { fg = newpaper.purple, style = style.b_bold },
            HopNextKey2                 = { fg = newpaper.blue },
            HopUnmatched                = { fg = newpaper.comment },

            -- Illuminate -----------------------------------------------------
            illuminatedWord             = { bg = newpaper.highlight },
            illuminatedCurWord          = { bg = newpaper.contrast },

            -- IndentBlankline ------------------------------------------------
            IndentBlanklineContextChar  = { fg = newpaper.contextchar },
            IndentBlanklineContextStart = { style = style.underline },

            -- LanguageTool ---------------------------------------------------
            LanguageToolCmd             = { fg = newpaper.comment },
            LanguageToolErrorCount      = { fg = newpaper.orange, bg = newpaper.active, style = style.b_bold },
            LanguageToolLabel           = { fg = newpaper.darkgreen },
            LanguageToolUrl             = { fg = newpaper.link, style = style.link },
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

            -- Lualine custom color for lualine with bg
            LualineDiagnosticError      = { fg = newpaper.error_fg, bg = newpaper.silver },
            LualineDiagnosticWarn       = { fg = newpaper.warn_fg, bg = newpaper.silver },
            LualineDiagnosticInfo       = { fg = newpaper.info_fg, bg = newpaper.silver },
            LualineDiagnosticHint       = { fg = newpaper.hint_fg, bg = newpaper.silver },

            -- Nvim dap -------------------------------------------------------
            DapBreakpoint               = { fg = newpaper.darkgreen, bg = newpaper.linenumber_bg },
            DapBreakpointCondition      = { fg = newpaper.darkyellow, bg = newpaper.linenumber_bg },
            DapBreakpointRejected       = { fg = newpaper.ocean, bg = newpaper.linenumber_bg },
            DapLogPoint                 = { fg = newpaper.string, bg = newpaper.linenumber_bg },
            DapStopped                  = { fg = newpaper.red, bg = newpaper.linenumber_bg },

            -- Nvim-dap-ui ----------------------------------------------------
            DapUIVariable               = { fg = newpaper.darkengreen, style = style.v_style },
            DapUIScope                  = { fg = newpaper.teal, style = style.b_bold },
            DapUIType                   = { fg = newpaper.keyword },
            DapUIValue                  = { fg = newpaper.teal },
            DapUIModifiedValue          = { fg = newpaper.red },
            DapUIDecoration             = { fg = newpaper.blue },
            DapUIThread                 = { fg = newpaper.ocean },
            DapUIStoppedThread          = { fg = newpaper.ocean, style = style.b_bold },
            DapUIFrameName              = { fg = newpaper.navy },
            DapUISource                 = { fg = newpaper.lightblue },
            DapUILineNumber             = { fg = newpaper.darkorange },
            DapUIFloatBorder            = { fg = newpaper.border },
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

            -- Vim-matchup ----------------------------------------------------
            MatchWord                   = { bg = newpaper.lightviolet, style = style.b_bold },

            -- WhichKey -------------------------------------------------------
            WhichKey                    = { fg = newpaper.keyword },
            WhichKeyGroup               = { fg = newpaper.teal, style = style.b_bold },
            WhichKeySeparator           = { fg = newpaper.darkgreen },
            WhichKeyDesc                = { fg = newpaper.string },
            WhichKeyFloat               = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            WhichKeyValue               = { fg = newpaper.darkgrey },
        }
        return plugins

        -- stylua: ignore end
    end

    return theme
end

return M
