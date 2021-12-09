local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local theme    = {}
    theme.config   = config
    theme.colors   = require("newpaper.colors").setup(config)
    theme.style    = require("newpaper.style").setup_style(config)
    local newpaper = theme.colors
    local style    = theme.style

    -- LuaFormatter off
    theme.loadSyntax = function ()

        -- Syntax highlight groups

        local syntax = {
            StorageClass   = { fg = newpaper.ocean, style = style.k_style }, -- static, register, volatile, etc.
            Structure      = { fg = newpaper.darkpurple, style = style.k_style }, -- struct, union, enum, etc.
            Conditional    = { fg = newpaper.keyword, style = style.k_style }, -- if, then, else, endif, switch, etc.
            Keyword        = { fg = newpaper.keyword, style = style.k_style }, -- for, do, while, etc.
            Statement      = { fg = newpaper.keyword, style = style.k_style }, -- any statement
            Repeat         = { fg = newpaper.keyword, style = style.k_style }, -- any other keyword
            Constant       = { fg = newpaper.darkgreen }, -- any constant
            Character      = { fg = newpaper.darkgreen, style = style.o_style }, -- any character constant: 'c', '\n'
            Number         = { fg = newpaper.red }, -- a number constant: 5
            Boolean        = { fg = newpaper.boolean, style = style.k_style }, -- a boolean constant: TRUE, false
            Float          = { fg = newpaper.magenta }, -- a floating point constant: 2.3e10
            Tag            = { fg = newpaper.tag, style = style.tag_style }, -- you can use CTRL-] on this
            Function       = { fg = newpaper.navy, style = style.f_style }, -- function names
            Method         = { fg = newpaper.navy, style = style.f_style },
            Label          = { fg = newpaper.magenta }, -- case, default, etc.
            Operator       = { fg = newpaper.navy, style = style.o_style }, -- sizeof", "+", "*", etc.
            Exception      = { fg = newpaper.maroon }, -- try, catch, throw
            PreProc        = { fg = newpaper.navy}, -- generic Preprocessor
            Include        = { fg = newpaper.maroon }, -- preprocessor #include
            Identifier     = { fg = newpaper.variable, style = style.v_style }, -- any variable name
            Define         = { fg = newpaper.magenta }, -- preprocessor #define
            Macro          = { fg = newpaper.magenta }, -- same as Define
            Typedef        = { fg = newpaper.maroon }, -- A typedef
            PreCondit      = { fg = newpaper.magenta }, -- preprocessor #if, #else, #endif, etc.
            Type           = { fg = newpaper.darkgreen }, -- int, long, char, etc.
            Special        = { fg = newpaper.magenta }, -- any special symbol
            SpecialChar    = { fg = newpaper.maroon }, -- special character in a constant
            String         = { fg = newpaper.string, style = style.s_style }, -- any string
            Delimiter      = { fg = newpaper.orange }, -- character that needs attention like , or .
            SpecialComment = { fg = newpaper.comment, style = style.k_style }, -- special things inside a comment
            Debug          = { fg = newpaper.red }, -- debugging statements
            Underlined     = { fg = newpaper.link, style = 'underline' }, -- text that stands out, HTML links
            Ignore         = { fg = newpaper.disabled }, -- left blank, hidden
            Error          = { fg = newpaper.error_fg, bg = newpaper.error_bg, style = style.b_bold_u }, -- any erroneous construct
            Todo           = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold},

            -- Help
            helpCommand        = { fg = newpaper.teal },
            helpExample        = { fg = newpaper.string, style = style.s_style },
            helpHyperTextEntry = { fg = newpaper.keyword, style = style.s_style },
            helpURL            = { fg = newpaper.string, style = style.s_style ..',underline' }

        }

        return syntax

    end
    theme.loadEditor = function ()

        -- Editor highlights

        local editor = {
            Comment          = { fg = newpaper.comment, style = style.c_style },
            ColorColumn      = { bg = newpaper.highlight }, --  used for the columns set with 'colorcolumn'
            Conceal          = { fg = newpaper.tex_math }, -- placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor           = { fg = newpaper.bg, bg = newpaper.cursor }, -- the character under the cursor
            nCursor          = { fg = newpaper.bg, bg = newpaper.teal }, -- Normal mode
            vCursor          = { fg = newpaper.bg, bg = newpaper.purple }, -- Visual mode
            veCursor         = { fg = newpaper.bg, bg = newpaper.darkpurple }, -- Visual mode with 'selection' "exclusive" (same as 'v', if not specified)
            oCursor          = { fg = newpaper.bg, bg = newpaper.navy }, -- Operator-pending mode
            iCursor          = { fg = newpaper.bg, bg = newpaper.darkgreen }, -- Insert mode
            rCursor          = { fg = newpaper.bg, bg = newpaper.magenta }, -- Replace mode
            cCursor          = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Normal (append) mode
            ciCursor         = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Insert mode
            crCursor         = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Replace mode
            smCursor         = { fg = newpaper.bg, bg = newpaper.yellow }, -- showmatch in Insert mode
            TermCursor       = { fg = newpaper.bg, bg = newpaper.cursor }, -- active cursor in terminal
            TermCursorNC     = { fg = newpaper.bg, bg = newpaper.lightgrey }, -- inactive cursor in terminal
            CursorColumn     = { bg = newpaper.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine       = { bg = newpaper.active }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
            CursorIM         = { fg = newpaper.bg, bg = newpaper.cursor }, -- like Cursor, but used when in IME mode
            Directory        = { fg = newpaper.navy }, -- directory names (and other special names in listings)
            DiffAdd          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg }, -- diff mode: Added line
            DiffChange       = { fg = newpaper.text, bg = newpaper.diffchange_bg }, --  diff mode: Changed line
            DiffDelete       = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg }, -- diff mode: Deleted line
            DiffText         = { fg = newpaper.text, bg = newpaper.difftext_bg }, -- diff mode: Changed text within a changed line
            ErrorMsg         = { fg = newpaper.error_fg, bg = newpaper.error_bg }, -- error messages
            FloatBorder      = { fg = newpaper.border, bg = newpaper.float_bg },
            Folded           = { fg = newpaper.folded_fg, bg = newpaper.folded_bg }, -- line used for closed folds
            FoldColumn       = { fg = newpaper.folded_fg, bg = newpaper.linenumber_bg }, -- 'foldcolumn'
            IncSearch        = { fg = newpaper.search_fg, bg = newpaper.search_bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Substitute       = { fg = newpaper.search_fg, bg = newpaper.yellow }, -- |:substitute| replacement text highlighting
            LineNr           = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg },-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.cursor_nr_bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
            MatchParen       = { bg = newpaper.aqua, style = style.b_bold }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            ModeMsg          = { fg = newpaper.accent, style = style.b_bold }, -- 'showmode' message (e.g., "-- INSERT -- ")
            MsgArea          = { fg = newpaper.msgarea_fg, bg = newpaper.msgarea_bg }, -- Area for messages and cmdline
            MoreMsg          = { fg = newpaper.accent }, -- |more-prompt|
            Normal           = { fg = newpaper.fg, bg = newpaper.bg }, -- normal text and background color
            NormalSB         = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg},
            NormalFloat      = { fg = newpaper.float_fg, bg = newpaper.float_bg }, -- normal text and background color for floating windows
            NonText          = { fg = newpaper.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            Pmenu            = { fg = newpaper.text, bg = newpaper.contrast }, -- Popup menu: normal item.
            PmenuSel         = { fg = newpaper.bg, bg = newpaper.text }, -- Popup menu: selected item.
            PmenuSbar        = { fg = newpaper.text, bg = newpaper.contrast }, -- Popup menu: scrollbar.
            PmenuThumb       = { fg = newpaper.fg, bg = newpaper.text }, -- Popup menu: Thumb of the scrollbar.
            Question         = { fg = newpaper.darkgreen }, -- |hit-enter| prompt and yes/no questions
            QuickFixLine     = { fg = newpaper.highlight, bg = newpaper.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            qfLineNr         = { fg = newpaper.highlight, bg = newpaper.title, style = 'reverse' }, -- Line numbers for quickfix lists
            Search           = { fg = newpaper.search_fg, bg = newpaper.search_bg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
            SignColumn       = { fg = newpaper.fg, bg = newpaper.linenumber_bg },
            SignColumnSB     = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg },
            SpecialKey       = { fg = newpaper.disabled }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
            SpellBad         = { bg = newpaper.spellbad, style = 'undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            SpellCap         = { bg = newpaper.spellcap, style = 'undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
            SpellLocal       = { bg = newpaper.spelllocal, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
            SpellRare        = { bg = newpaper.spellrare, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
            StatusLine       = { fg = newpaper.teal, bg = newpaper.silver }, -- status line of current window
            StatusLineNC     = { fg = newpaper.lightgrey, bg = newpaper.silver }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            StatusLineTerm   = { fg = newpaper.fg, bg = newpaper.silver }, -- status line of current terminal window
            StatusLineTermNC = { fg = newpaper.lightgrey, bg = newpaper.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            Tabline          = { fg = newpaper.tabline_inactive_fg, bg = newpaper.tabline_inactive_bg },
            TabLineFill      = { bg = newpaper.tabline_bg }, -- tab pages line, where there are no labels
            TablineSel       = { fg = newpaper.tabline_active_fg, bg = newpaper.tabline_active_bg, style = style.b_bold_i }, -- tab pages line, active tab page label
            Title            = { fg = newpaper.keyword, style = style.b_bold }, -- titles for output from ":set all", ":autocmd" etc.
            ToolbarButton    = { fg = newpaper.fg, style = style.b_bold },
            Visual           = { fg = newpaper.bg, bg = newpaper.selection }, -- Visual mode selection
            VisualNOS        = { fg = newpaper.bg, bg = newpaper.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
            WarningMsg       = { fg = newpaper.magenta }, -- warning messages
            Whitespace       = { fg = newpaper.disabled }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
            ToolbarLine      = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg },
            NormalMode       = { fg = newpaper.teal, style = 'reverse' }, -- Normal mode message in the cmdline
            InsertMode       = { fg = newpaper.darkgreen, style = 'reverse' }, -- Insert mode message in the cmdline
            ReplacelMode     = { fg = newpaper.magenta, style = 'reverse' }, -- Replace mode message in the cmdline
            VisualMode       = { fg = newpaper.purple, style = 'reverse' }, -- Visual mode message in the cmdline
            CommandMode      = { fg = newpaper.orange, style = 'reverse' }, -- Command mode message in the cmdline
            Warnings         = { fg = newpaper.magenta },
            WildMenu         = { fg = newpaper.wildmenu_fg, bg = newpaper.wildmenu_bg, style = style.b_bold }, -- current match in 'wildmenu' completion
            healthError      = { fg = newpaper.error_fg, bg = newpaper.error_bg },
            healthSuccess    = { fg = newpaper.darkgreen },
            healthWarning    = { fg = newpaper.magenta }

        }

        -- Options:

        -- Remove window split borders
        if config.borders then
            editor.VertSplit = { fg = newpaper.border } -- the column separating vertically split windows
        else
            editor.VertSplit = { fg = newpaper.bg } -- the column separating vertically split windows
        end

        -- Set End of Buffer lines (~)
        if config.hide_eob then
            editor.EndOfBuffer = { fg = newpaper.bg }
        else
            editor.EndOfBuffer = { fg = newpaper.disabled }
        end

        return editor

    end

    theme.loadTerminal = function ()

        vim.g.terminal_color_0  = newpaper.black
        vim.g.terminal_color_1  = newpaper.maroon
        vim.g.terminal_color_2  = newpaper.darkgreen
        vim.g.terminal_color_3  = newpaper.olive
        vim.g.terminal_color_4  = newpaper.navy
        vim.g.terminal_color_5  = newpaper.purple
        vim.g.terminal_color_6  = newpaper.teal
        vim.g.terminal_color_7  = newpaper.silver
        vim.g.terminal_color_8  = newpaper.grey
        vim.g.terminal_color_9  = newpaper.red
        vim.g.terminal_color_10 = newpaper.green
        vim.g.terminal_color_11 = newpaper.yellow
        vim.g.terminal_color_12 = newpaper.blue
        vim.g.terminal_color_13 = newpaper.magenta
        vim.g.terminal_color_14 = newpaper.aqua
        vim.g.terminal_color_15 = newpaper.white

    end

    theme.loadTreeSitter = function ()

        -- TreeSitter highlight groups

        local treesitter = {
            TSAnnotation           = { fg = newpaper.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
            TSConditional          = { fg = newpaper.keyword, style = style.k_style }, -- conditionnals.
            TSKeyword              = { fg = newpaper.keyword, style = style.k_style }, -- For keywords that don't fall in previous categories.
            TSRepeat               = { fg = newpaper.keyword, style = style.k_style }, -- keywords related to loops.
            TSKeywordFunction      = { fg = newpaper.darkpurple, style = style.k_style }, -- keywords used to define a fuction.
            TSKeywordReturn        = { fg = newpaper.keyword, style = style.k_style }, -- define a return.
            TSFunction             = { fg = newpaper.navy, style = style.f_style }, -- For fuction (calls and definitions).
            TSMethod               = { fg = newpaper.bluegreen, style = style.f_style }, -- For method calls and definitions.
            TSFuncBuiltin          = { fg = newpaper.navy, style = style.f_style }, -- For builtin functions: `table.insert` in Lua.
            TSKeywordOperator      = { fg = newpaper.navy, style = style.o_style }, -- define a operators like and, or.
            TSTag                  = { fg = newpaper.tag, style = style.tag_style }, -- HTML tag names.
            TSBoolean              = { fg = newpaper.boolean, style = style.k_style }, -- For booleans.
            TSCharacter            = { fg = newpaper.orange }, -- For characters.
            TSComment              = { fg = newpaper.comment, style = style.c_style }, -- For comment blocks.
            TSConstructor          = { fg = newpaper.bluegreen }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
            TSConstant             = { fg = newpaper.darkgreen }, -- For constants
            TSConstBuiltin         = { fg = newpaper.maroon }, -- For constant that are built in the language: `nil` in Lua.
            TSConstMacro           = { fg = newpaper.maroon }, -- For constants that are defined by macros: `NULL` in C.
            TSNote                 = { fg = newpaper.bg, bg = newpaper.hint_fg },
            TSWarning              = { fg = newpaper.bg, bg = newpaper.info_fg },
            TSDanger               = { fg = newpaper.bg, bg = newpaper.warn_fg },
            TSError                = { fg = newpaper.error_fg, bg = newpaper.error_bg }, -- For syntax/parser errors.
            TSException            = { fg = newpaper.maroon }, -- For exception related keywords.
            TSField                = { fg = newpaper.ocean }, -- For fields.
            TSFloat                = { fg = newpaper.magenta }, -- For floats.
            TSFuncMacro            = { fg = newpaper.magenta }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
            TSInclude              = { fg = newpaper.maroon }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
            TSLabel                = { fg = newpaper.darkgreen }, -- For labels: `label:` in C and `:label:` in Lua.
            TSNamespace            = { fg = newpaper.darkyellow }, -- For identifiers referring to modules and namespaces.
            TSNumber               = { fg = newpaper.red }, -- For all numbers
            TSOperator             = { fg = newpaper.navy, style = style.o_style }, -- For any operator: `+`, but also `->` and `*` in C.
            TSParameter            = { fg = newpaper.orange }, -- For parameters of a function.
            TSParameterReference   = { fg = newpaper.orange }, -- For references to parameters of a function.
            TSProperty             = { fg = newpaper.darkgreen }, -- Same as `TSField`,accesing for struct members in C.
            TSPunctDelimiter       = { fg = newpaper.orange }, -- For delimiters ie: `.`
            TSPunctBracket         = { fg = newpaper.navy }, -- For brackets and parens.
            TSPunctSpecial         = { fg = newpaper.magenta }, -- For special punctutation that does not fall in the catagories before.
            TSStringRegex          = { fg = newpaper.regexp_blue }, -- For regexes.
            TSStringEscape         = { fg = newpaper.maroon }, -- For escape characters within a string.
            TSSymbol               = { fg = newpaper.darkyellow }, -- For identifiers referring to symbols or atoms.
            TSType                 = { fg = newpaper.darkgreen }, -- For types.
            TSTypeBuiltin          = { fg = newpaper.magenta }, -- For builtin types.
            TSVariable             = { fg = newpaper.variable, style = style.v_style }, -- Any variable name that does not have another highlight.
            TSVariableBuiltin      = { fg = newpaper.olive, style = style.v_style },-- Variable names that are defined by the languages, like `this` or `self`.
            TSTagDelimiter         = { fg = newpaper.navy, style = style.o_style }, -- Tag delimiter like `<` `>` `/`
            TSText                 = { fg = newpaper.fg }, -- For strings considered text in a markup language.
            TSTextReference        = { fg = newpaper.orange }, -- FIXME
            TSEmphasis             = { fg = newpaper.fg, style = 'italic' }, -- For text to be represented with emphasis.
            TSUnderline            = { fg = newpaper.fg, style = 'underline' }, -- For text to be represented with an underline.
            TSStrike               = { fg = newpaper.fg, style = style.b_italic}, -- For strikethrough text.
            TSString               = { fg = newpaper.string, style = style.s_style }, -- For strings.
            TSTitle                = { fg = newpaper.title, style = style.b_bold }, -- Text that is part of a title.
            TSLiteral              = { fg = newpaper.fg, style = style.o_style }, -- Literal text.
            TSURI                  = { fg = newpaper.link, style = 'underline' } -- Any URI like a link or email.

        }

        return treesitter

    end

    theme.loadLSP = function ()

        -- Lsp highlight groups

        local lsp = {
            LspDiagnosticsDefaultError           = { fg = newpaper.error_fg }, -- "Error" diagnostic virtual text
            LspDiagnosticsSignError              = { fg = newpaper.error_fg, bg = newpaper.linenumber_bg }, -- "Error" diagnostic signs in sign column
            LspDiagnosticsFloatingError          = { fg = newpaper.error_fg }, -- "Error" diagnostic messages in the diagnostics float
            LspDiagnosticsUnderlineError         = { style = 'undercurl', sp = newpaper.error_fg }, -- used to underline "Error" diagnostics.
            LspDiagnosticsDefaultWarning         = { fg = newpaper.warn_fg }, -- "Warning" diagnostic signs in sign column
            LspDiagnosticsSignWarning            = { fg = newpaper.warn_fg, bg = newpaper.linenumber_bg }, -- "Warning" diagnostic signs in sign column
            LspDiagnosticsFloatingWarning        = { fg = newpaper.warn_fg }, -- "Warning" diagnostic messages in the diagnostics float
            LspDiagnosticsUnderlineWarning       = { style = 'undercurl', sp = newpaper.warn_fg }, -- used to underline "Warning" diagnostics.
            LspDiagnosticsDefaultInformation     = { fg = newpaper.info_fg }, -- "Information" diagnostic virtual text
            LspDiagnosticsSignInformation        = { fg = newpaper.info_fg, bg = newpaper.linenumber_bg }, -- "Information" diagnostic signs in sign column
            LspDiagnosticsFloatingInformation    = { fg = newpaper.info_fg }, -- "Information" diagnostic messages in the diagnostics float
            LspDiagnosticsUnderlineInformation   = { style = 'undercurl', sp = newpaper.info_fg }, -- used to underline "Information" diagnostics.
            LspDiagnosticsDefaultHint            = { fg = newpaper.hint_fg }, -- "Hint" diagnostic virtual text
            LspDiagnosticsSignHint               = { fg = newpaper.hint_fg, bg = newpaper.linenumber_bg }, -- "Hint" diagnostic signs in sign column
            LspDiagnosticsFloatingHint           = { fg = newpaper.hint_fg }, -- "Hint" diagnostic messages in the diagnostics float
            LspDiagnosticsUnderlineHint          = { style = 'undercurl', sp = newpaper.hint_fg }, -- used to underline  s "    Hint" diagnostics.
            LspCodeLens                          = { fg = newpaper.comment, bg = newpaper.lightsilver },
            LspReferenceText                     = { fg = newpaper.accent,  bg = newpaper.highlight }, -- used for highlighting "text" references
            LspReferenceRead                     = { fg = newpaper.accent,  bg = newpaper.highlight }, -- used for highlighting "read" references
            LspReferenceWrite                    = { fg = newpaper.accent,  bg = newpaper.highlight }, -- used for highlighting "write" references

            DiagnosticUnderlineError             = { link = "LspDiagnosticsUnderlineError" },
            DiagnosticFloatingError              = { link = "LspDiagnosticsFloatingError" },
            DiagnosticSignError                  = { link = "LspDiagnosticsSignError" },
            DiagnosticUnderlineWarn              = { link = "LspDiagnosticsUnderlineWarning" },
            DiagnosticFloatingWarn               = { link = "LspDiagnosticsFloatingWarning" },
            DiagnosticSignWarn                   = { link = "LspDiagnosticsSignWarning" },
            DiagnosticUnderlineInfo              = { link = "LspDiagnosticsUnderlineInformation" },
            DiagnosticFloatingInfo               = { link = "LspDiagnosticsFloatingInformation" },
            DiagnosticSignInfo                   = { link = "LspDiagnosticsSignInformation" },
            DiagnosticUnderlineHint              = { link = "LspDiagnosticsUnderlineHint" },
            DiagnosticFloatingHint               = { link = "LspDiagnosticsFloatingHint" },
            DiagnosticSignHint                   = { link = "LspDiagnosticsSignHint" },
            DiagnosticSignOther                  = { fg = newpaper.magenta },

            DiagnosticError                      = { link = "LspDiagnosticsDefaultError" },
            DiagnosticWarn                       = { link = "LspDiagnosticsDefaultWarning" },
            DiagnosticInfo                       = { link = "LspDiagnosticsDefaultInformation" },
            DiagnosticHint                       = { link = "LspDiagnosticsDefaultHint" },
            DiagnosticOther                      = { fg = newpaper.magenta }

        }

        if config.lsp_virtual_text_bg then
            lsp.LspDiagnosticsVirtualTextError       = { fg = newpaper.error_fg, bg = newpaper.lsp_error_bg }
            lsp.LspDiagnosticsVirtualTextWarning     = { fg = newpaper.warn_fg, bg = newpaper.warn_bg }
            lsp.LspDiagnosticsVirtualTextInformation = { fg = newpaper.info_fg, bg = newpaper.info_bg }
            lsp.LspDiagnosticsVirtualTextHint        = { fg = newpaper.hint_fg, bg = newpaper.hint_bg }
        else
            lsp.LspDiagnosticsVirtualTextError       = { fg = newpaper.error_fg }
            lsp.LspDiagnosticsVirtualTextWarning     = { fg = newpaper.warn_fg }
            lsp.LspDiagnosticsVirtualTextInformation = { fg = newpaper.info_fg }
            lsp.LspDiagnosticsVirtualTextHint        = { fg = newpaper.hint_fg }
        end
            lsp.DiagnosticVirtualTextError           = { link = "LspDiagnosticsVirtualTextError" }
            lsp.DiagnosticVirtualTextWarn            = { link = "LspDiagnosticsVirtualTextWarning" }
            lsp.DiagnosticVirtualTextInfo            = { link = "LspDiagnosticsVirtualTextInformation" }
            lsp.DiagnosticVirtualTextHint            = { link = "LspDiagnosticsVirtualTextHint" }

        return lsp

    end

    theme.loadPlugins = function()

        -- Plugins highlight groups

       local plugins = {

            -- BufferLine -----------------------------------------------------
            BufferLineInfoDiagnosticSelected    = { fg = newpaper.info_fg,  style = style.b_bold_i },
            BufferLineHintDiagnosticSelected    = { fg = newpaper.hint_fg,  style = style.b_bold_i },
            BufferLineWarningDiagnosticSelected = { fg = newpaper.warn_fg,  style = style.b_bold_i },
            BufferLineErrorDiagnosticSelected   = { fg = newpaper.error_fg, style = style.b_bold_i },
            BufferLineInfoSelected              = { fg = newpaper.info_fg,  style = style.b_bold_i },
            BufferLineHintSelected              = { fg = newpaper.hint_fg,  style = style.b_bold_i },
            BufferLineWarningSelected           = { fg = newpaper.warn_fg,  style = style.b_bold_i },
            BufferLineErrorSelected             = { fg = newpaper.error_fg, style = style.b_bold_i },

            -- Calltree -------------------------------------------------------
            CTBoolean                     = { fg = newpaper.boolean, style = style.k_style },
            CTConstant                    = { fg = newpaper.darkgreen },
            CTConstructor                 = { fg = newpaper.bluegreen },
            CTField                       = { fg = newpaper.ocean },
            CTFunction                    = { fg = newpaper.navy },
            CTMethod                      = { fg = newpaper.bluegreen },
            CTNamespace                   = { fg = newpaper.darkyellow },
            CTNumber                      = { fg = newpaper.red },
            CTOperator                    = { fg = newpaper.teal },
            CTParameter                   = { fg = newpaper.orange },
            CTParameterReference          = { fg = newpaper.olive },
            CTString                      = { fg = newpaper.string, style = style.s_style },
            CTSymbol                      = { fg = newpaper.teal, style = 'underline' },
            CTSymbolDetail                = { fg = newpaper.darkgreen, style = style.b_italic },
            CTSymbolJump                  = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            CTSymbolJumpRefs              = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
            CTType                        = { fg = newpaper.keyword },
            CTURI                         = { fg = newpaper.link, style = 'underline' },

            -- Dashboard ------------------------------------------------------
            DashboardShortCut             = { fg = newpaper.red },
            DashboardHeader               = { fg = newpaper.comment },
            DashboardCenter               = { fg = newpaper.accent },
            DashboardFooter               = { fg = newpaper.green, style = style.b_italic },

            -- Diff -----------------------------------------------------------
            diffAdded                     = { fg = newpaper.git_added },
            diffRemoved                   = { fg = newpaper.git_removed },
            diffChanged                   = { fg = newpaper.git_modified },
            diffOldFile                   = { fg = newpaper.text },
            diffNewFile                   = { fg = newpaper.title },
            diffFile                      = { fg = newpaper.grey },
            diffLine                      = { fg = newpaper.blue },
            diffIndexLine                 = { fg = newpaper.purple },

            -- Fern -----------------------------------------------------------
            FernBranchText                = { fg = newpaper.blue },

            -- GitGutter ------------------------------------------------------
            GitGutterAdd                  = { fg = newpaper.git_added,    bg = newpaper.git_bg },
            GitGutterChange               = { fg = newpaper.git_modified, bg = newpaper.git_bg },
            GitGutterDelete               = { fg = newpaper.git_removed,  bg = newpaper.git_bg },

            -- GitSigns -------------------------------------------------------
            GitSignsAdd                   = { fg = newpaper.git_added,    bg = newpaper.git_bg },
            GitSignsAddNr                 = { fg = newpaper.git_added,    bg = newpaper.git_bg },
            GitSignsAddLn                 = { fg = newpaper.git_added,    bg = newpaper.git_bg },
            GitSignsChange                = { fg = newpaper.git_modified, bg = newpaper.git_bg },
            GitSignsChangeNr              = { fg = newpaper.git_modified, bg = newpaper.git_bg },
            GitSignsChangeLn              = { fg = newpaper.git_modified, bg = newpaper.git_bg },
            GitSignsDelete                = { fg = newpaper.git_removed,  bg = newpaper.git_bg },
            GitSignsDeleteNr              = { fg = newpaper.git_removed,  bg = newpaper.git_bg },
            GitSignsDeleteLn              = { fg = newpaper.git_removed,  bg = newpaper.git_bg },

            -- Glyph palette --------------------------------------------------
            GlyphPalette1                 = { fg = newpaper.red },
            GlyphPalette2                 = { fg = newpaper.green },
            GlyphPalette3                 = { fg = newpaper.darkorange },
            GlyphPalette4                 = { fg = newpaper.blue },
            GlyphPalette6                 = { fg = newpaper.teal },
            GlyphPalette7                 = { fg = newpaper.aqua },
            GlyphPalette9                 = { fg = newpaper.magenta },
            GlyphPaletteDirectory         = { fg = newpaper.navy },

            -- Hop ------------------------------------------------------------
            HopNextKey                    = { fg = newpaper.accent, style = style.b_bold },
            HopNextKey1                   = { fg = newpaper.purple, style = style.b_bold },
            HopNextKey2                   = { fg = newpaper.blue },
            HopUnmatched                  = { fg = newpaper.comment },

            -- Illuminate -----------------------------------------------------
            illuminatedWord               = { bg = newpaper.highlight },
            illuminatedCurWord            = { bg = newpaper.contrast },

            -- LanguageTool ---------------------------------------------------
            LanguageToolCmd               = { fg = newpaper.comment },
            LanguageToolErrorCount        = { fg = newpaper.orange, bg = newpaper.active, style = style.b_bold },
            LanguageToolLabel             = { fg = newpaper.darkgreen },
            LanguageToolUrl               = { fg = newpaper.link, style = 'underline' },
            LanguageToolGrammarError      = { fg = newpaper.fg, bg = newpaper.spellrare, style = 'undercurl' },
            LanguageToolSpellingError     = { fg = newpaper.fg, bg = newpaper.spellbad,  style = 'undercurl' },

            -- LspSaga --------------------------------------------------------
            LspFloatWinBorder             = { fg = newpaper.border, bg = newpaper.float_bg },
            LspSagaBorderTitle            = { fg = newpaper.orange, bg = newpaper.float_bg },
            DiagnosticInformation         = { fg = newpaper.info_fg },
            -- DiagnosticHint
            ProviderTruncateLine          = { fg = newpaper.navy },
            SagaShadow                    = { fg = newpaper.grey },
            LspSagaFinderSelection        = { fg = newpaper.darkgreen, style = style.b_bold },
            DiagnosticTruncateLine        = { fg = newpaper.info_fg,   style = style.b_bold },
            LspSagaDiagnosticBorder       = { fg = newpaper.border, bg = newpaper.float_bg },
            LspSagaDiagnosticHeader       = { fg = newpaper.warn_fg, style = style.b_bold },
            LspSagaDiagnosticTruncateLine = { fg = newpaper.border, bg = newpaper.float_bg },
            LspDiagnosticsFloatingWarn    = { fg = newpaper.warn_fg },
            LspDiagnosticsFloatingInfor   = { fg = newpaper.info_fg },
            LspSagaShTruncateLine         = { fg = newpaper.teal },
            LspSagaDocTruncateLine        = { fg = newpaper.olive },
            LspSagaCodeActionTitle        = { fg = newpaper.orange, style = style.b_bold },
            LspSagaCodeActionTruncateLine = { fg = newpaper.lightblue },
            LspSagaCodeActionContent      = { fg = newpaper.olive, style = style.b_bold },
            LspSagaRenamePromptPrefix     = { fg = newpaper.olive },
            LspSagaRenameBorder           = { fg = newpaper.green,     bg = newpaper.float_bg },
            LspSagaHoverBorder            = { fg = newpaper.teal,      bg = newpaper.float_bg },
            LspSagaSignatureHelpBorder    = { fg = newpaper.olive,     bg = newpaper.float_bg },
            LspSagaLspFinderBorder        = { fg = newpaper.blue,      bg = newpaper.float_bg },
            LspSagaCodeActionBorder       = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            LspSagaAutoPreview            = { bg = newpaper.orange },
            LspSagaDefPreviewBorder       = { fg = newpaper.lightblue, bg = newpaper.float_bg },
            LspFloatWinNormal             = { fg = newpaper.text,      bg = newpaper.float_bg },
            -- TargetWord                 Error
            ReferencesCount               = { fg = newpaper.navy },
            DefinitionCount               = { fg = newpaper.teal },
            TargetFileName                = { fg = newpaper.comment, style = 'underline' },
            DefinitionIcon                = { fg = newpaper.teal },
            ReferencesIcon                = { fg = newpaper.navy },
            -- DiagnosticError            Error
            DiagnosticWarning             = { fg = newpaper.warn_fg },
            DefinitionPreviewTitle        = { fg = newpaper.darkgreen },
            LspSagaLightBulb              = { fg = newpaper.hint_fg },
            LspLinesDiagBorder            = { fg = newpaper.border, bg = newpaper.float_bg },

            -- Lua-dev --------------------------------------------------------
            RedrawDebugNormal             = { fg = newpaper.bg, bg = newpaper.fg },
            RedrawDebugClear              = { fg = newpaper.fg, bg = newpaper.lightorange },
            RedrawDebugComposed           = { fg = newpaper.fg, bg = newpaper.green },
            RedrawDebugRecompose          = { fg = newpaper.fg, bg = newpaper.red },

            -- Nvim-Cmp -------------------------------------------------------
            CmpDocumentation              = { fg = newpaper.text,   bg = newpaper.float_bg },
            CmpDocumentationBorder        = { fg = newpaper.border, bg = newpaper.float_bg },
            CmpItemAbbr                   = { fg = newpaper.darkgrey },
            CmpItemAbbrDeprecated         = { fg = newpaper.lightgrey },
            CmpItemAbbrMatch              = { fg = newpaper.navy, style = style.b_bold },
            CmpItemAbbrMatchFuzzy         = { fg = newpaper.magenta, style = style.b_bold },
            CmpItemMenu                   = { fg = newpaper.darkgrey },
            CmpItemKindDefault            = { fg = newpaper.lightblue },
            -- CmpItemKindText               = 1                            -- Text          = "",
            CmpItemKindMethod             = { fg = newpaper.bluegreen },    -- Method        = "",
            CmpItemKindFunction           = { fg = newpaper.navy },         -- Function      = "",
            CmpItemKindConstructor        = { fg = newpaper.bluegreen },    -- Constructor   = "",
            CmpItemKindField              = { fg = newpaper.ocean },        -- Field         = "ﰠ",
            CmpItemKindVariable           = { fg = newpaper.darkgreen },    -- Variable      = "",
            CmpItemKindClass              = { fg = newpaper.ruby_magenta }, -- Class         = "ﴯ",
            CmpItemKindInterface          = { fg = newpaper.olive },        -- Interface     = "",
            CmpItemKindModule             = { fg = newpaper.darkyellow },   -- Module        = "",
            CmpItemKindProperty           = { fg = newpaper.bluegreen },    -- Property      = "ﰠ",
            CmpItemKindUnit               = { fg = newpaper.darkpurple },   -- Unit          = "塞",
            CmpItemKindValue              = { fg = newpaper.red },          -- Value         = "",
            CmpItemKindEnum               = { fg = newpaper.green },        -- Enum          = "",
            CmpItemKindKeyword            = { fg = newpaper.keyword },      -- Keyword       = "",
            CmpItemKindSnippet            = { fg = newpaper.darkpurple },   -- Snippet       = "",
            CmpItemKindColor              = { fg = newpaper.magenta },      -- Color         = "",
            CmpItemKindFile               = { fg = newpaper.teal },         -- File          = "",
            CmpItemKindReference          = { fg = newpaper.darkyellow },   -- Reference     = "",
            CmpItemKindFolder             = { fg = newpaper.teal },         -- Folder        = "",
            CmpItemKindEnumMember         = { fg = newpaper.green },        -- EnumMember    = "",
            CmpItemKindConstant           = { fg = newpaper.darkgreen },    -- Constant      = "",
            CmpItemKindStruct             = { fg = newpaper.olive },        -- Struct        = "פּ",
            CmpItemKindEvent              = { fg = newpaper.orange },       -- Event         = "",
            CmpItemKindOperator           = { fg = newpaper.navy },         -- Operator      = "",
            CmpItemKindTypeParameter      = { fg = newpaper.orange },       -- TypeParameter = " "

            -- Nvim-Compe -----------------------------------------------------
            CompeDocumentation            = { fg = newpaper.text,   bg = newpaper.float_bg },
            CompeDocumentationBorder      = { fg = newpaper.border, bg = newpaper.float_bg },

            -- Neogit ---------------------------------------------------------
            NeogitBranch                  = { fg = newpaper.blue },
            NeogitRemote                  = { fg = newpaper.purple },
            NeogitHunkHeader              = { fg = newpaper.fg,   bg = newpaper.highlight },
            NeogitHunkHeaderHighlight     = { fg = newpaper.fg,   bg = newpaper.contrast },
            NeogitDiffContextHighlight    = { fg = newpaper.text, bg = newpaper.contrast },
            NeogitDiffDeleteHighlight     = { fg = newpaper.git_removed },
            NeogitDiffAddHighlight        = { fg = newpaper.git_added },

            -- Nvim dap -------------------------------------------------------
            DapBreakpoint                 = { fg = newpaper.darkgreen,  bg = newpaper.linenumber_bg },
            DapBreakpointCondition        = { fg = newpaper.darkyellow, bg = newpaper.linenumber_bg },
            DapBreakpointRejected         = { fg = newpaper.ocean,      bg = newpaper.linenumber_bg },
            DapLogPoint                   = { fg = newpaper.string,     bg = newpaper.linenumber_bg },
            DapStopped                    = { fg = newpaper.red,        bg = newpaper.linenumber_bg },

            -- Nvim-dap-ui ----------------------------------------------------
            DapUIVariable                 = { fg = newpaper.darkgreen },
            DapUIScope                    = { fg = newpaper.teal, style = style.b_bold },
            DapUIType                     = { fg = newpaper.keyword },
            DapUIValue                    = { fg = newpaper.teal },
            DapUIModifiedValue            = { fg = newpaper.red },
            DapUIDecoration               = { fg = newpaper.blue },
            DapUIThread                   = { fg = newpaper.ocean },
            DapUIStoppedThread            = { fg = newpaper.ocean, style = style.b_bold },
            DapUIFrameName                = { fg = newpaper.navy },
            DapUISource                   = { fg = newpaper.lightblue },
            DapUILineNumber               = { fg = newpaper.darkorange },
            DapUIFloatBorder              = { fg = newpaper.border },
            DapUIWatchesEmpty             = { fg = newpaper.magenta },
            DapUIWatchesValue             = { fg = newpaper.nephritis },
            DapUIWatchesError             = { fg = newpaper.error_fg },
            DapUIBreakpointsPath          = { fg = newpaper.lightblue, style = style.b_bold },
            DapUIBreakpointsInfo          = { fg = newpaper.darkyellow },
            DapUIBreakpointsCurrentLine   = { fg = newpaper.orange, style = style.b_bold },
            DapUIBreakpointsLine          = { fg = newpaper.orange },

            -- Nvim-dap-virtual-text ------------------------------------------
            NvimDapVirtualText            = { fg = newpaper.grey,     style = style.c_style },
            NvimDapVirtualTextChanged     = { fg = newpaper.warn_fg,  style = style.c_style },
            NvimDapVirtualTextError       = { fg = newpaper.error_fg, style = style.c_style },
            NvimDapVirtualTextInfo        = { fg = newpaper.info_fg,  style = style.c_style },

            -- Nvim-lsp-installer ---------------------------------------------
            LspInstallerServerExpanded    = { fg = newpaper.fg,        style = style.b_italic },
            LspInstallerHighlighted       = { fg = newpaper.blue },
            LspInstallerVaderSaber        = { fg = newpaper.redorange, style = style.b_bold },
            LspInstallerHeading           = { fg = newpaper.keyword,   style = style.b_bold },
            LspInstallerOrange            = { fg = newpaper.orange },
            LspInstallerHeader            = { fg = newpaper.orange,    style = style.b_bold },
            LspInstallerMuted             = { fg = newpaper.comment },
            LspInstallerLabel             = { fg = newpaper.fg,        style = style.b_bold },
            LspInstallerGreen             = { fg = newpaper.darkgreen },
            LspInstallerError             = { fg = newpaper.error_fg },
            LspInstallerLink              = { fg = newpaper.link,      style = 'underline' },

            -- Nvim-notify
            NotifyERRORBorder             = { fg = newpaper.error_fg },
            NotifyWARNBorder              = { fg = newpaper.warn_fg },
            NotifyINFOBorder              = { fg = newpaper.info_fg },
            NotifyDEBUGBorder             = { fg = newpaper.text },
            NotifyTRACEBorder             = { fg = newpaper.purple },
            NotifyERRORIcon               = { fg = newpaper.error_fg },
            NotifyWARNIcon                = { fg = newpaper.warn_fg },
            NotifyINFOIcon                = { fg = newpaper.info_fg },
            NotifyDEBUGIcon               = { fg = newpaper.text },
            NotifyTRACEIcon               = { fg = newpaper.purple },
            NotifyERRORTitle              = { fg = newpaper.error_fg },
            NotifyWARNTitle               = { fg = newpaper.warn_fg },
            NotifyINFOTitle               = { fg = newpaper.info_fg },
            NotifyDEBUGTitle              = { fg = newpaper.text },
            NotifyTRACETitle              = { fg = newpaper.purple },
            NotifyERRORBody               = { fg = newpaper.float_fg },
            NotifyWARNBody                = { fg = newpaper.float_fg },
            NotifyINFOBody                = { fg = newpaper.float_fg },
            NotifyDEBUGBody               = { fg = newpaper.float_fg },
            NotifyTRACEBody               = { fg = newpaper.float_fg },

            -- NvimTree -------------------------------------------------------
            NvimTreeSymlink               = { fg = newpaper.accent, style = 'italic,underline' },
            NvimTreeFolderName            = { fg = newpaper.teal },
            NvimTreeFolderIcon            = { fg = newpaper.teal },
            NvimTreeOpenedFolderName      = { fg = newpaper.accent, style = style.b_bold },
            NvimTreeRootFolder            = { fg = newpaper.title,  style = style.b_bold },
            NvimTreeEmptyFolderName       = { fg = newpaper.disabled },
            NvimTreeIndentMarker          = { fg = newpaper.disabled },
            NvimTreeGitDirty              = { fg = newpaper.git_modified },
            NvimTreeGitNew                = { fg = newpaper.git_added },
            NvimTreeGitStaged             = { fg = newpaper.comment },
            NvimTreeGitDeleted            = { fg = newpaper.git_removed },
            NvimTreeGitMerge              = { fg = newpaper.git_removed },
            NvimTreeGitRenamed            = { fg = newpaper.git_modified },
            NvimTreeLicenseIcon           = { fg = newpaper.navy },
            NvimTreeGitignoreIcon         = { fg = newpaper.grey },
            NvimTreeOpenedFile            = { fg = newpaper.accent },
            NvimTreeImageFile             = { fg = newpaper.orange },
            NvimTreeMarkdownFile          = { fg = newpaper.magenta },
            NvimTreeExecFile              = { fg = newpaper.text },
            NvimTreeSpecialFile           = { fg = newpaper.purple, style = 'underline' },
            LspDiagnosticsError           = { fg = newpaper.error_fg },
            LspDiagnosticsWarning         = { fg = newpaper.warn_fg },
            LspDiagnosticsInformation     = { fg = newpaper.info_fg },
            LspDiagnosticsHint            = { fg = newpaper.hint_fg },

            -- Packer ---------------------------------------------------------
            packerHash                    = { fg = newpaper.tag },
            packerOutput                  = { fg = newpaper.keyword },
            packerStatus                  = { fg = newpaper.teal },
            packerStatusCommit            = { fg = newpaper.git_modified },
            packerPackageName             = { fg = newpaper.teal },
            packerWorking                 = { fg = newpaper.comment },
            packerProgress                = { fg = newpaper.green, style = style.b_bold },

            -- Sneak ----------------------------------------------------------
            Sneak                         = { fg = newpaper.bg, bg = newpaper.accent },
            SneakScope                    = { bg = newpaper.selection },

            -- Symbols-outline ------------------------------------------------
            FocusedSymbol                 = { fg = newpaper.search_fg, bg = newpaper.search_bg, style = style.b_bold },
            SymbolsOutlineConnector       = { fg = newpaper.teal },
            -- symbols = {
            --     File          = { icon = "",    hl = "TSURI" },
            --     Module        = { icon = "",    hl = "TSNamespace" },
            --     Namespace     = { icon = "",    hl = "TSNamespace" },
            --     Package       = { icon = "",    hl = "TSNamespace" },
            --     Class         = { icon = "𝓒",    hl = "TSType" },
            --     Method        = { icon = "ƒ",    hl = "TSMethod" },
            --     Property      = { icon = "",    hl = "TSMethod" },
            --     Field         = { icon = "",    hl = "TSField" },
            --     Constructor   = { icon = "",    hl = "TSConstructor" },
            --     Enum          = { icon = "ℰ",    hl = "TSType" },
            --     Interface     = { icon = "ﰮ",    hl = "TSType" },
            --     Function      = { icon = "",    hl = "TSFunction" },
            --     Variable      = { icon = "",    hl = "TSConstant" },
            --     Constant      = { icon = "",    hl = "TSConstant" },
            --     String        = { icon = "𝓐",    hl = "TSString" },
            --     Number        = { icon = "#",    hl = "TSNumber" },
            --     Boolean       = { icon = "⊨",    hl = "TSBoolean" },
            --     Array         = { icon = "",    hl = "TSConstant" },
            --     Object        = { icon = "⦿",    hl = "TSType" },
            --     Key           = { icon = "🔐",   hl = "TSType" },
            --     Null          = { icon = "NULL", hl = "TSType" },
            --     EnumMember    = { icon = "",    hl = "TSField" },
            --     Struct        = { icon = "𝓢",    hl = "TSType" },
            --     Event         = { icon = "🗲",    hl = "TSType" },
            --     Operator      = { icon = "+",    hl = "TSOperator" },
            --     TypeParameter = { icon = "𝙏",    hl = "TSParameter"}
            -- },

            -- Telescope ------------------------------------------------------
            -- Sets the highlight for selected items within the picker
            TelescopeSelection              = { fg = newpaper.telescope_fg, bg = newpaper.aqua },
            TelescopeSelectionCaret         = { fg = newpaper.purple, style = style.b_bold },
            TelescopeMultiSelection         = { fg = newpaper.orange },

            -- Normal in the floating windows created by telescope
            TelescopeNormal                 = { fg = newpaper.telescope_fg, bg = newpaper.telescope_bg },
            -- TelescopePreviewNormal          TelescopeNormal
            -- TelescopePromptNormal           TelescopeNormal
            -- TelescopeResultsNormal          TelescopeNormal

            -- Border highlight groups. Use TelescopeBorder to override the default. Otherwise set them specifically
            -- TelescopeBorder               TelescopeNormal
            TelescopePromptBorder           = { fg = newpaper.blue,       bg = newpaper.telescope_bg },
            TelescopeResultsBorder          = { fg = newpaper.purple, bg = newpaper.telescope_bg },
            TelescopePreviewBorder          = { fg = newpaper.green,      bg = newpaper.telescope_bg },

            -- Title highlight groups. Use TelescopeTitle to override the default. Otherwise set them specifically
            -- TelescopeTitle        TelescopeBorder
            TelescopePromptTitle            = { fg = newpaper.teal,      bg = newpaper.telescope_bg, style = style.b_bold },
            TelescopeResultsTitle           = { fg = newpaper.purple,    bg = newpaper.telescope_bg, style = style.b_bold },
            TelescopePreviewTitle           = { fg = newpaper.darkgreen, bg = newpaper.telescope_bg, style = style.b_bold },
            TelescopePromptCounter          = { fg = newpaper.teal },

            -- Used for highlighting characters that you match.
            TelescopeMatching               = { fg = newpaper.magenta, style = style.b_bold },

            -- Used for the prompt prefix
            TelescopePromptPrefix           = { fg = newpaper.teal },

            -- Used for highlighting the matched line inside Previewer
            -- TelescopePreviewLine            Visual
            -- TelescopePreviewMatch           Search
            TelescopePreviewPipe            = { fg = newpaper.nephritis },
            TelescopePreviewCharDev         = { fg = newpaper.magenta },
            -- TelescopePreviewDirectory       Directory
            TelescopePreviewBlock           = { fg = newpaper.red },
            TelescopePreviewLink            = { fg = newpaper.link, style = 'underline' },
            TelescopePreviewSocket          = { fg = newpaper.darkyellow },
            -- TelescopePreviewNormal          Normal
            TelescopePreviewRead            = { fg = newpaper.darkgreen },
            TelescopePreviewWrite           = { fg = newpaper.maroon },
            TelescopePreviewExecute         = { fg = newpaper.keyword },
            TelescopePreviewHyphen          = { fg = newpaper.blue },
            TelescopePreviewSticky          = { fg = newpaper.orange },
            TelescopePreviewSize            = { fg = newpaper.teal },
            TelescopePreviewUser            = { fg = newpaper.ocean },
            TelescopePreviewGroup           = { fg = newpaper.green },
            TelescopePreviewDate            = { fg = newpaper.string },
            TelescopePreviewMessage         = { fg = newpaper.string },
            TelescopePreviewMessageFillchar = { fg = newpaper.string, style = style.b_bold },

            -- Used for Picker specific Results highlighting
            TelescopeResultsClass           = { fg = newpaper.keyword },
            TelescopeResultsConstant        = { fg = newpaper.darkgreen },
            TelescopeResultsField           = { fg = newpaper.ocean },
            TelescopeResultsFunction        = { fg = newpaper.navy },
            TelescopeResultsMethod          = { fg = newpaper.navy },
            TelescopeResultsOperator        = { fg = newpaper.darkyellow },
            TelescopeResultsStruct          = { fg = newpaper.keyword },
            TelescopeResultsVariable        = { fg = newpaper.darkgreen },
            TelescopeResultsLineNr          = { fg = newpaper.linenumber_fg },
            TelescopeResultsIdentifier      = { fg = newpaper.teal },
            TelescopeResultsNumber          = { fg = newpaper.red },
            TelescopeResultsComment         = { fg = newpaper.comment, style = style.c_style },
            TelescopeResultsSpecialComment  = { fg = newpaper.comment },

            -- Used for git status Results highlighting
            TelescopeResultsDiffChange      = { fg = newpaper.git_modified },
            TelescopeResultsDiffAdd         = { fg = newpaper.git_added },
            TelescopeResultsDiffDelete      = { fg = newpaper.git_removed },
            -- TelescopeResultsDiffUntracked   NonText

            -- Todo-comments --------------------------------------------------
            TodoSignWARN                  = { fg = newpaper.todo_warn,    bg = newpaper.linenumber_bg },
            TodoSignTODO                  = { fg = newpaper.todo_info,    bg = newpaper.linenumber_bg },
            TodoSignPERF                  = { fg = newpaper.todo_default, bg = newpaper.linenumber_bg },
            TodoSignNOTE                  = { fg = newpaper.todo_hint,    bg = newpaper.linenumber_bg },
            TodoSignHACK                  = { fg = newpaper.todo_warn,    bg = newpaper.linenumber_bg },
            TodoSignFIX                   = { fg = newpaper.todo_error,   bg = newpaper.linenumber_bg },
            TodoFgWARN                    = { fg = newpaper.todo_warn },
            TodoFgTODO                    = { fg = newpaper.todo_info },
            TodoFgPERF                    = { fg = newpaper.todo_default },
            TodoFgNOTE                    = { fg = newpaper.todo_hint },
            TodoFgHACK                    = { fg = newpaper.todo_warn },
            TodoFgFIX                     = { fg = newpaper.todo_error },
            TodoBgWARN                    = { fg = newpaper.bg, bg = newpaper.todo_warn,    style = style.b_bold },
            TodoBgTODO                    = { fg = newpaper.bg, bg = newpaper.todo_info,    style = style.b_bold },
            TodoBgPERF                    = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
            TodoBgNOTE                    = { fg = newpaper.bg, bg = newpaper.todo_hint,    style = style.b_bold },
            TodoBgHACK                    = { fg = newpaper.bg, bg = newpaper.todo_warn,    style = style.b_bold },
            TodoBgFIX                     = { fg = newpaper.bg, bg = newpaper.todo_error,   style = style.b_bold },

            -- Trouble --------------------------------------------------------
            TroubleCount                  = { fg = newpaper.orange, bg = newpaper.sidebar_bg, style = style.b_bold },
            TroubleNormal                 = { fg = newpaper.sidebar_fg, bg = newpaper.bg },
            TroubleText                   = { fg = newpaper.sidebar_fg },
            TroubleSource                 = { bg = newpaper.sidebar_bg },
            TroubleCode                   = { bg = newpaper.sidebar_bg },
            TroubleLocation               = { fg = newpaper.teal, bg = newpaper.sidebar_bg},
            TroubleTextInformation        = { fg = newpaper.info_fg },
            TroubleTextError              = { fg = newpaper.error_fg },
            TroubleTextWarning            = { fg = newpaper.warn_fg },
            TroubleTextHint               = { fg = newpaper.hint_fg },

            -- Vista ----------------------------------------------------------
            VistaParenthesis = { fg = newpaper.navy, style = style.b_bold },
            VistaScope       = { fg = newpaper.keyword, style = style.k_style },
            VistaTag         = { fg = newpaper.navy },
            VistaKind        = { fg = newpaper.ocean, style = style.k_style },
            VistaScopeKind   = { fg = newpaper.teal, style = 'underline' },
            VistaLineNr      = { fg = newpaper.cursor_nr_fg },
            VistaColon       = { fg = newpaper.orange },
            VistaIcon        = { fg = newpaper.teal },
            VistaArgs        = { fg = newpaper.darkgreen, style = style.b_italic },
            VistaPublic      = { fg = newpaper.green, style = style.k_style },
            VistaProtected   = { fg = newpaper.maroon, style = style.k_style },
            VistaPrivate     = { fg = newpaper.darkyellow, style = style.k_style },
            VistaFloat       = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            VistaBracket     = { fg = newpaper.navy, style = style.b_bold },
            VistaPrefix      = { fg = newpaper.ocean },
            VistaHeadNr      = { fg = newpaper.darkgrey },

            -- WhichKey -------------------------------------------------------
            WhichKey                      = { fg = newpaper.keyword },
            WhichKeyGroup                 = { fg = newpaper.teal, style = style.b_bold },
            WhichKeySeparator             = { fg = newpaper.darkgreen },
            WhichKeyDesc                  = { fg = newpaper.teal },
            WhichKeyFloat                 = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            WhichKeyValue                 = { fg = newpaper.darkgrey },

            -- Devicon --------------------------------------------------------
            DevIconRb                     = { fg = newpaper.ruby_red },
            DevIconErb                    = { fg = newpaper.ruby_red },
            DevIconRs                     = { fg = newpaper.rust_green },
            DevIconPy                     = { fg = newpaper.python_blue },
            DevIconPyc                    = { fg = newpaper.python_blue },
            DevIconPyd                    = { fg = newpaper.python_blue },
            DevIconPyo                    = { fg = newpaper.python_blue },
        }

        -- Options:

        if config.disable_background then
            plugins.NvimTreeNormal = { fg = newpaper.comment, bg = newpaper.none }
        else
            plugins.NvimTreeNormal = { fg = newpaper.sidebar_fg, bg = newpaper.bg }
        end

        if config.contrast_sidebar then
            plugins.NvimTreeNormal = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg }
        else
            plugins.NvimTreeNormal = { fg = newpaper.fg, bg = newpaper.bg }
        end

        -- IndentBlankline
        if vim.g.indent_blankline_use_treesitter then
        -- Use TreeSitter IndentBlankline
            plugins.IndentBlanklineContextChar  = { fg = newpaper.keyword }
            plugins.IndentBlanklineContextStart = { style = 'underline' }
        else
            plugins.IndentBlanklineContextChar  = { fg = newpaper.grey }
            plugins.IndentBlanklineContextStart = { style = 'underline' }
        end

        return plugins

        -- LuaFormatter on

    end

    return theme

end

return M
