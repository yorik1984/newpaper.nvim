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
            Boolean        = { fg = newpaper.booleans, style = style.bool_style },
            Character      = { fg = newpaper.orange, style = style.o_style },
            Conditional    = { fg = newpaper.keywords, style = style.k_style },
            Constant       = { fg = newpaper.darkgreen },
            Debug          = { fg = newpaper.red },
            Define         = { fg = newpaper.magenta },
            Delimiter      = { fg = newpaper.persimona, style = style.d_style },
            Error          = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg },
            Exception      = { fg = newpaper.redorange },
            Float          = { fg = newpaper.magenta },
            Function       = { fg = newpaper.lua_navy, style = style.f_style },
            Identifier     = { fg = newpaper.variables, style = style.v_style },
            Ignore         = { fg = newpaper.disabled },
            Include        = { fg = newpaper.maroon },
            Keyword        = { fg = newpaper.keywords, style = style.k_style },
            Label          = { fg = newpaper.magenta },
            Macro          = { fg = newpaper.magenta },
            Method         = { fg = newpaper.ruby_navy, style = style.f_style },
            Noise          = { link = "Delimiter" },
            Number         = { fg = newpaper.numbers },
            Operator       = { fg = newpaper.navy, style = style.o_style },
            PreCondit      = { fg = newpaper.magenta, style = style.k_style },
            PreProc        = { fg = newpaper.navy },
            Quote          = { link = "String" },
            Repeat         = { fg = newpaper.keywords, style = style.k_style },
            Special        = { fg = newpaper.dark_maroon },
            SpecialChar    = { fg = newpaper.maroon },
            SpecialComment = { fg = newpaper.comments, style = style.k_style },
            Statement      = { fg = newpaper.keywords, style = style.k_style },
            StorageClass   = { fg = newpaper.lua_navy, style = style.k_style },
            String         = { fg = newpaper.strings, style = style.s_style },
            Structure      = { fg = newpaper.darkpurple, style = style.k_style },
            Tag            = { fg = newpaper.tags, style = style.tags_style },
            Todo           = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
            Type           = { fg = newpaper.darkengreen },
            Typedef        = { fg = newpaper.maroon },
            Underlined     = { fg = newpaper.links, style = style.underline },

            Added          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            Changed        = { fg = newpaper.texts, bg = newpaper.diffchange_bg },
            Removed        = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
        }
        return syntax
    end

    theme.loadEditor     = function()
        local editor = {
            Cursor           = { fg = newpaper.bg, bg = newpaper.cursor },
            CurSearch        = { fg = newpaper.search_fg, bg = newpaper.search_bg, style = style.b_bold },
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
            CursorLineFold   = { fg = newpaper.folded_fg, bg = newpaper.cursor_nr_bg },
            CursorLineSign   = { bg = newpaper.linenumber_bg },
            ColorColumn      = { fg = newpaper.none, bg = newpaper.colorcol },
            CommandMode      = { fg = newpaper.orange, style = style.reverse },
            Comment          = { fg = newpaper.comments, style = style.c_style },
            Conceal          = { fg = newpaper.tex_math },
            DiffAdd          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            DiffChange       = { fg = newpaper.texts, bg = newpaper.diffchange_bg },
            DiffDelete       = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            DiffText         = { fg = newpaper.texts, bg = newpaper.difftext_bg },
            Directory        = { fg = newpaper.teal, style = style.b_bold },
            EndOfBuffer      = { fg = newpaper.eob, bg = newpaper.none },
            ErrorMsg         = { fg = newpaper.errormsg_fg },
            FloatBorder      = { fg = newpaper.borders, bg = newpaper.float_bg },
            FloatTitle       = { fg = newpaper.borders, bg = newpaper.float_bg, style = style.b_bold },
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
            PmenuSel         = { bg = newpaper.pmenu_sel },
            PmenuThumb       = { bg = newpaper.teal },
            Question         = { fg = newpaper.darkgreen },
            QuickFixLine     = { fg = newpaper.silver, bg = newpaper.titles, style = style.reverse },
            ReplacelMode     = { fg = newpaper.magenta, style = style.reverse },
            Search           = { fg = newpaper.search_fg, bg = newpaper.search_bg },
            SignColumn       = { bg = newpaper.linenumber_bg },
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
            Title            = { fg = newpaper.titles, style = style.b_bold },
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
            qfLineNr         = { fg = newpaper.silver, bg = newpaper.titles, style = style.reverse },

            -- Custom newpaper groups
            NormalContrastSB = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
            NormalInverse    = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
            LineNrSB         = { fg = newpaper.linenumber_fg, bg = newpaper.sb_contrast_bg },
            CursorLineSB     = { fg = newpaper.cursor_nr_fg, bg = newpaper.aqua },
            CursorLineSignSB = { bg = newpaper.sb_contrast_bg },
            FoldColumnSB     = { fg = newpaper.folded_fg, bg = newpaper.sb_contrast_bg },
            SignColumnSB     = { fg = newpaper.sb_contrast_fg, bg = newpaper.sb_contrast_bg },
            FloatSign        = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            FloatLineNr      = { fg = newpaper.linenumber_fg, bg = newpaper.float_bg },
            FloatCLineSign   = { bg = newpaper.float_bg },
            FloatCLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.float_bg },
            FloatFoldColumn  = { fg = newpaper.folded_fg, bg = newpaper.float_bg },
            FloatBorderTerm  = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
            NormalTermFloat  = { fg = newpaper.term_fl_fg, bg = newpaper.term_fl_bg },
            NormalTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            LineNrTerm       = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            SignColumnTerm   = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            FoldColumnTerm   = { fg = newpaper.term_fg, bg = newpaper.term_bg },
            TermCursorTerm   = { style = style.reverse },
            TermCursorNCTerm = { style = style.reverse },
            CursorLineTerm   = { bg = newpaper.none, ctermbg = newpaper.none },
            PmenuBorder      = { fg = newpaper.teal, bg = newpaper.pmenu_bg },
        }
        return editor
    end

    theme.loadTreeSitter = function()
        local treesitter = {

            ["@variable"]              = { fg = newpaper.variables, style = style.v_style },
            ["@variable.builtin"]      = { fg = newpaper.ruby_maroon, style = style.v_style, nocombine = true },
            ["@variable.parameter"]    = { fg = newpaper.orange },
            ["@variable.member"]       = { fg = newpaper.bluegreen },
            ["@variable.global"]       = { fg = newpaper.neovim_green, style = style.k_style },

            ["@constant"]              = { fg = newpaper.darkgreen, nocombine = true },
            ["@constant.builtin"]      = { fg = newpaper.maroon },
            ["@constant.macro"]        = { fg = newpaper.tex_maroon, nocombine = true },

            ["@module"]                = { fg = newpaper.darkyellow },
            ["@module.builtin"]        = { fg = newpaper.tex_magenta },
            ["@label"]                 = { fg = newpaper.redorange },

            ["@string"]                = { fg = newpaper.strings, style = style.s_style },
            ["@string.documentation"]  = { fg = newpaper.regexp_blue, style = style.s_style },
            ["@string.regexp"]         = { fg = newpaper.regexp_blue },
            ["@string.escape"]         = { fg = newpaper.tex_magenta, nocombine = true},
            ["@string.special"]        = { fg = newpaper.dark_maroon, style = style.s_style },
            ["@string.special.symbol"] = { fg = newpaper.darkyellow },
            ["@string.special.url"]    = { fg = newpaper.strings, style = style.links, nocombine = true },
            ["@string.special.path"]   = { fg = newpaper.teal, style = style.links, nocombine = true },

            ["@character"]             = { fg = newpaper.orange, nocombine = true},
            ["@character.special"]     = { fg = newpaper.maroon, nocombine = true },

            ["@boolean"]               = { fg = newpaper.booleans, style = style.bool_style },
            ["@number"]                = { fg = newpaper.numbers },
            ["@number.float"]          = { fg = newpaper.magenta },

            ["@type"]                  = { fg = newpaper.darkengreen },
            ["@type.builtin"]          = { fg = newpaper.olive },
            ["@type.definition"]       = { fg = newpaper.maroon },

            ["@attribute"]             = { fg = newpaper.blue },
            ["@attribute.builtin"]     = { fg = newpaper.python_blue },
            ["@property"]              = { fg = newpaper.darkgreen },

            ["@function"]              = { fg = newpaper.lua_navy, style = style.f_style },
            ["@function.builtin"]      = { fg = newpaper.tex_red, style = style.f_style },
            ["@function.call"]         = { fg = newpaper.tag_navy, style = style.f_style },
            ["@function.macro"]        = { fg = newpaper.magenta, style = style.f_style },

            ["@function.method"]       = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@function.method.call"]  = { fg = newpaper.navy, style = style.f_style },

            ["@constructor"]           = { fg = newpaper.tex_lightpurple },
            ["@operator"]              = { fg = newpaper.navy, style = style.o_style },
            ["@operator.math"]         = { fg = newpaper.tex_olive, style = style.o_style, nocombine = true},

            ["@keyword"]               = { fg = newpaper.keywords,    style = style.k_style },
            ["@keyword.coroutine"]     = { fg = newpaper.tex_keyword, style = style.k_style },
            ["@keyword.function"]      = { fg = newpaper.darkpurple,  style = style.k_style },
            ["@keyword.operator"]      = { fg = newpaper.lua_navy,    style = style.k_style },
            ["@keyword.import"]        = { fg = newpaper.redorange,   nocombine = true },
            ["@keyword.type"]          = { fg = newpaper.ruby_purple, style = style.k_style },
            ["@keyword.modifier"]      = { fg = newpaper.ruby_maroon, style = style.k_style },
            ["@keyword.repeat"]        = { fg = newpaper.keywords,    style = style.k_style },
            ["@keyword.return"]        = { fg = newpaper.tex_keyword, style = style.k_style },
            ["@keyword.exception"]     = { fg = newpaper.redorange,   style = style.k_style },
            ["@keyword.debug"]         = { fg = newpaper.red,         style = style.k_style },

            ["@keyword.conditional"]         = { fg = newpaper.keywords, style = style.k_style },
            ["@keyword.conditional.ternary"] = { fg = newpaper.keywords, style = style.k_style },

            ["@keyword.directive"]           = { fg = newpaper.navy,    style = style.k_style },
            ["@keyword.directive.define"]    = { fg = newpaper.magenta, style = style.k_style },

            ["@punctuation.delimiter"] = { fg = newpaper.persimona, style = style.d_style },
            ["@punctuation.bracket"]   = { fg = newpaper.ruby_navy, style = style.br_style },
            ["@punctuation.special"]   = { fg = newpaper.lightmagenta },

            ["@comment"]               = { fg = newpaper.comments, style = style.c_style },
            ["@comment.documentation"] = { fg = newpaper.doc_comments, style = style.doc_style, nocombine = true },

            ["@comment.error"]         = { fg = newpaper.bg, bg = newpaper.todo_error, style = style.b_bold },
            ["@comment.warning"]       = { fg = newpaper.bg, bg = newpaper.todo_warn,  style = style.b_bold },
            ["@comment.todo"]          = { fg = newpaper.bg, bg = newpaper.todo_info,  style = style.b_bold },
            ["@comment.note"]          = { fg = newpaper.bg, bg = newpaper.todo_hint,  style = style.b_bold },

            ["@markup.strong"]         = { style = style.bold },
            ["@markup.italic"]         = { style = style.italic },
            ["@markup.strikethrough"]  = { style = style.strike },
            ["@markup.underline"]      = { style = style.underline },

            ["@markup.heading"]          = { fg = newpaper.titles, style = style.b_bold },
            ["@markup.heading.1"]        = { fg = newpaper.tex_part_title, style = style.k_style },
            ["@markup.heading.2"]        = { fg = newpaper.teal, style = style.k_style },
            ["@markup.heading.3"]        = { fg = newpaper.blue, style = style.k_style },
            ["@markup.heading.4"]        = { fg = newpaper.tex_math, style = style.k_style },
            ["@markup.heading.5"]        = { fg = newpaper.tex_lightpurple, style = style.k_style },
            ["@markup.heading.6"]        = { fg = newpaper.tex_darkorange, style = style.k_style },
            ["@markup.heading.1.marker"] = { fg = newpaper.tex_part_title },
            ["@markup.heading.2.marker"] = { fg = newpaper.teal },
            ["@markup.heading.3.marker"] = { fg = newpaper.blue },
            ["@markup.heading.4.marker"] = { fg = newpaper.tex_math },
            ["@markup.heading.5.marker"] = { fg = newpaper.tex_lightpurple },
            ["@markup.heading.6.marker"] = { fg = newpaper.tex_darkorange },

            ["@markup.quote"]          = { fg = newpaper.tex_navy, style = style.italic },
            ["@markup.quote.marker"]   = { fg = newpaper.tex_navy, style = style.o_style },
            ["@markup.math"]           = { fg = newpaper.tex_math, nocombine = true},

            ["@markup.link"]           = { fg = newpaper.tex_lightviolet },
            ["@markup.link.url"]       = { fg = newpaper.links, style = style.links },
            ["@markup.link.label"]     = { fg = newpaper.tex_maroon },

            ["@markup.raw"]            = { fg = newpaper.regexp_blue, nocombine = true },
            ["@markup.raw.block"]      = { fg = newpaper.regexp_blue, nocombine = true },
            ["@markup.raw.delimiter"]  = { fg = newpaper.magenta, style = style.o_style },

            ["@markup.list"]           = { fg = newpaper.keywords,  style = style.o_bold },
            ["@markup.list.checked"]   = { fg = newpaper.todo_hint, style = style.b_bold },
            ["@markup.list.unchecked"] = { fg = newpaper.comments },

            ["@diff.plus"]             = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            ["@diff.minus"]            = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            ["@diff.delta"]            = { fg = newpaper.texts, bg = newpaper.diffchange_bg },

            ["@tag"]                   = { fg = newpaper.keywords, style = style.tags_style },
            ["@tag.builtin"]           = { fg = newpaper.ruby_maroon },
            ["@tag.attribute"]         = { fg = newpaper.darkengreen },
            ["@tag.delimiter"]         = { fg = newpaper.tags, style = style.tb_style },

            ["@none"]                  = { fg = newpaper.disabled },
            ["@conceal"]               = { fg = newpaper.tex_math },

            -- Locals
            ["@local.definition"]            = { fg = newpaper.fg, style = style.v_style },
            ["@local.definition.constant"]   = { fg = newpaper.darkgreen, nocombine = true },
            ["@local.definition.function"]   = { fg = newpaper.lua_navy, style = style.f_style },
            ["@local.definition.method"]     = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@local.definition.var"]        = { fg = newpaper.tex_math, style = style.v_style },
            ["@local.definition.parameter"]  = { fg = newpaper.darkorange, style = style.v_style },
            ["@local.definition.macro"]      = { fg = newpaper.lightmagenta },
            ["@local.definition.type"]       = { fg = newpaper.ruby_navy, style = style.k_style },
            ["@local.definition.field"]      = { fg = newpaper.tex_teal },
            ["@local.definition.enum"]       = { fg = newpaper.blue },
            ["@local.definition.namespace"]  = { fg = newpaper.blue, style = style.k_style },
            ["@local.definition.import"]     = { fg = newpaper.olive },
            ["@local.definition.associated"] = { fg = newpaper.bluegreen },

            -- TODO: Add more groups
            -- INFO: https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight

            -- LSP semantic tokens
            ["@lsp.type.boolean"]             = { link = "@boolean" },
            ["@lsp.type.builtinType"]         = { link = "@type.builtin" },
            ["@lsp.type.class"]               = { link = "@storageclass" },
            ["@lsp.type.comment"]             = { default = true },
            ["@lsp.type.decorator"]           = { link = "@function.builtin" },
            ["@lsp.type.enum"]                = { link = "@label" },
            ["@lsp.type.enumMember"]          = { link = "@constant" },
            ["@lsp.type.escapeSequence"]      = { link = "@string.escape" },
            ["@lsp.type.event"]               = { link = "@type" },
            ["@lsp.type.formatSpecifier"]     = { link = "@punctuation" },
            ["@lsp.type.function"]            = { link = "@function" },
            ["@lsp.type.interface"]           = { link = "@keyword.function" },
            ["@lsp.type.keyword"]             = { link = "@keyword" },
            ["@lsp.type.macro"]               = { link = "@function.macro" },
            ["@lsp.type.method"]              = { link = "@function.method" },
            ["@lsp.type.modifier"]            = { link = "@type" },
            ["@lsp.type.namespace"]           = { link = "@module" },
            ["@lsp.type.number"]              = { link = "@number" },
            ["@lsp.type.operator"]            = { link = "@operator" },
            ["@lsp.type.parameter"]           = { link = "@variable.parameter" },
            ["@lsp.type.property"]            = { link = "@variable.member" },
            ["@lsp.type.regexp"]              = { link = "@string.regexp" },
            ["@lsp.type.selfKeyword"]         = { link = "@variable.builtin" },
            ["@lsp.type.string"]              = { link = "@string" },
            ["@lsp.type.struct"]              = { link = "@string.special.symbol" },
            ["@lsp.type.type"]                = { link = "@type" },
            ["@lsp.type.typeAlias"]           = { link = "@type" },
            ["@lsp.type.typeParameter"]       = { link = "@local.definition.parameter" },
            ["@lsp.type.variable"]            = { link = "@variable" },
            ["@lsp.type.unresolvedReference"] = { link = "Error" },

            ["@lsp.mod.defaultLibrary"]                 = { link = "@variable.builtin" },

            ["@lsp.typemod.class.declaration"]          = { link = "@storageclass" },
            ["@lsp.typemod.class.defaultLibrary"]       = { link = "@type.builtin" },
            ["@lsp.typemod.class.default_library"]      = { link = "@type.builtin" },
            ["@lsp.typemod.enum.defaultLibrary"]        = { link = "@type.builtin" },
            ["@lsp.typemod.enum.default_library"]       = { link = "@type.builtin" },
            ["@lsp.typemod.enumMember.defaultLibrary"]  = { link = "@constant.builtin" },
            ["@lsp.typemod.enumMember.default_library"] = { link = "@constant.builtin" },
            ["@lsp.typemod.function.defaultLibrary"]    = { link = "@function.builtin" },
            ["@lsp.typemod.function.default_library"]   = { link = "@function.builtin" },
            ["@lsp.typemod.keyword.async"]              = { link = "@keyword.coroutine" },
            ["@lsp.typemod.macro.defaultLibrary"]       = { link = "@function.builtin" },
            ["@lsp.typemod.macro.default_library"]      = { link = "@function.builtin" },
            ["@lsp.typemod.method.defaultLibrary"]      = { link = "@function.builtin" },
            ["@lsp.typemod.method.default_library"]     = { link = "@function.builtin" },
            ["@lsp.typemod.namespace.declaration"]      = { link = "@local.definition.namespace" },
            ["@lsp.typemod.operator.injected"]          = { link = "@operator" },
            ["@lsp.typemod.parameter.declaration"]      = { link = "@variable.parameter" },
            ["@lsp.typemod.string.injected"]            = { link = "@string" },
            ["@lsp.typemod.type.defaultLibrary"]        = { link = "@type.builtin" },
            ["@lsp.typemod.type.default_library"]       = { link = "@type.builtin" },
            ["@lsp.typemod.variable.defaultLibrary"]    = { link = "@constant.builtin" },
            ["@lsp.typemod.variable.default_library"]   = { link = "@constant.builtin" },
            ["@lsp.typemod.variable.definition"]        = { link = "@variable.builtin" },
            ["@lsp.typemod.variable.global"]            = { link = "@module.builtin" },
            ["@lsp.typemod.variable.injected"]          = { link = "@variable" },
        }

        return treesitter
    end

    theme.loadPlugins = function()
        local plugins = {

            -- Treesitter plugins
            TreesitterContextLineNumber = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg, style = style.b_bold },
            TreesitterContextBottom     = { style = style.underline, sp = newpaper.violet },

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
            IblScope  = { fg = newpaper.contextchar },

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

            -- Vim-matchup ----------------------------------------------------
            MatchWord                   = { bg = newpaper.lightviolet, style = style.b_bold },

            -- Virt-column ----------------------------------------------------
            VirtColumn                   = { fg = newpaper.colorcol, bg = newpaper.none, nocombine = true },

            -- WhichKey -------------------------------------------------------
            WhichKey                    = { fg = newpaper.keywords },
            WhichKeyGroup               = { fg = newpaper.teal, style = style.b_bold },
            WhichKeySeparator           = { fg = newpaper.darkgreen },
            WhichKeyDesc                = { fg = newpaper.strings },
            WhichKeyFloat               = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            WhichKeyValue               = { fg = newpaper.darkgrey },
        }
        return plugins

        -- stylua: ignore end
    end

    return theme
end

return M
