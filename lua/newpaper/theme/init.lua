local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local theme          = {}
    theme.colors         = configColors
    theme.style          = configStyle
    local newpaper       = theme.colors
    local style          = theme.style

    theme.loadSyntax     = function()
        local syntax = {
            StorageClass   = { fg = newpaper.class, style = style.k_style },           -- static, register, volatile, etc.
            Structure      = { fg = newpaper.darkpurple, style = style.k_style },      -- struct, union, enum, etc.
            Conditional    = { fg = newpaper.keyword, style = style.k_style },         -- if, then, else, endif, switch, etc.
            Keyword        = { fg = newpaper.keyword, style = style.k_style },         -- for, do, while, etc.
            Statement      = { fg = newpaper.keyword, style = style.k_style },         -- any statement
            Repeat         = { fg = newpaper.keyword, style = style.k_style },         -- any other keyword
            Constant       = { fg = newpaper.darkengreen },                            -- any constant
            Character      = { fg = newpaper.darkengreen, style = style.o_style },     -- any character constant: 'c', '\n'
            Number         = { fg = newpaper.number },                                 -- a number constant: 5
            Boolean        = { fg = newpaper.boolean, style = style.k_style },         -- a boolean constant: TRUE, false
            Float          = { fg = newpaper.magenta },                                -- a floating point constant: 2.3e10
            Tag            = { fg = newpaper.tag, style = style.tag_style },           -- you can use CTRL-] on this
            Function       = { fg = newpaper.lua_navy, style = style.f_style },        -- function names
            Method         = { fg = newpaper.ruby_navy, style = style.f_style },
            Label          = { fg = newpaper.magenta },                                -- case, default, etc.
            Operator       = { fg = newpaper.navy, style = style.o_style },            -- sizeof", "+", "*", etc.
            Exception      = { fg = newpaper.redorange },                              -- try, catch, throw
            PreProc        = { fg = newpaper.navy },                                   -- generic Preprocessor
            Include        = { fg = newpaper.maroon },                                 -- preprocessor #include
            Identifier     = { fg = newpaper.variable, style = style.v_style },        -- any variable name
            Define         = { fg = newpaper.magenta },                                -- preprocessor #define
            Macro          = { fg = newpaper.magenta },                                -- same as Define
            Typedef        = { fg = newpaper.maroon },                                 -- A typedef
            PreCondit      = { fg = newpaper.magenta },                                -- preprocessor #if, #else, #endif, etc.
            Type           = { fg = newpaper.darkengreen },                            -- int, long, char, etc.
            Special        = { fg = newpaper.dark_maroon },                            -- any special symbol
            SpecialChar    = { fg = newpaper.maroon },                                 -- special character in a constant
            String         = { fg = newpaper.string, style = style.s_style },          -- any string
            Delimiter      = { fg = newpaper.persimona, style = style.d_style },       -- character that needs attention like , or .
            SpecialComment = { fg = newpaper.comment, style = style.k_style },         -- special things inside a comment
            Debug          = { fg = newpaper.red },                                    -- debugging statements
            Underlined     = { fg = newpaper.link, style = style.underline },          -- text that stands out, HTML links
            Ignore         = { fg = newpaper.disabled },                               -- left blank, hidden
            Error          = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg }, -- any erroneous construct
            Todo           = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
            Noise          = { link = "Delimiter" },
            Quote          = { link = "String" },
        }
        return syntax
    end

    theme.loadEditor     = function()
        local editor = {
            Comment          = { fg = newpaper.comment, style = style.c_style },
            ColorColumn      = { fg = newpaper.colorcolumn, bg = newpaper.none },                                            --  used for the columns set with 'colorcolumn'
            Conceal          = { fg = newpaper.tex_math },                                                                   -- placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor           = { fg = newpaper.bg, bg = newpaper.cursor },                                                   -- the character under the cursor
            nCursor          = { fg = newpaper.bg, bg = newpaper.teal },                                                     -- Normal mode
            vCursor          = { fg = newpaper.bg, bg = newpaper.purple },                                                   -- Visual mode
            veCursor         = { fg = newpaper.bg, bg = newpaper.darkpurple },                                               -- Visual mode with 'selection' "exclusive" (same as 'v', if not specified)
            oCursor          = { fg = newpaper.bg, bg = newpaper.navy },                                                     -- Operator-pending mode
            iCursor          = { fg = newpaper.bg, bg = newpaper.green },                                                    -- Insert mode
            rCursor          = { fg = newpaper.bg, bg = newpaper.magenta },                                                  -- Replace mode
            cCursor          = { fg = newpaper.bg, bg = newpaper.darkorange },                                               -- Command-line Normal (append) mode
            ciCursor         = { fg = newpaper.bg, bg = newpaper.darkorange },                                               -- Command-line Insert mode
            crCursor         = { fg = newpaper.bg, bg = newpaper.darkorange },                                               -- Command-line Replace mode
            smCursor         = { fg = newpaper.bg, bg = newpaper.yellow },                                                   -- showmatch in Insert mode
            TermCursor       = { style = style.reverse },                                                                    -- active cursor in terminal
            TermCursorNC     = { style = style.reverse },                                                                    -- inactive cursor in terminal
            CursorColumn     = { bg = newpaper.active },                                                                     -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine       = { bg = newpaper.active },                                                                     -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
            CursorIM         = { fg = newpaper.bg, bg = newpaper.cursor },                                                   -- like Cursor, but used when in IME mode
            Directory        = { fg = newpaper.navy, style = style.b_bold },                                                 -- directory names (and other special names in listings)
            DiffAdd          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },                                        -- diff mode: Added line
            DiffChange       = { fg = newpaper.text, bg = newpaper.diffchange_bg },                                          --  diff mode: Changed line
            DiffDelete       = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },                                   -- diff mode: Deleted line
            DiffText         = { fg = newpaper.text, bg = newpaper.difftext_bg },                                            -- diff mode: Changed text within a changed line
            EndOfBuffer      = { fg = newpaper.eob, bg = newpaper.none },                                                    -- filler lines (~) after the end of the buffer.
            ErrorMsg         = { fg = newpaper.errormsg_fg },                                                                -- error messages
            FloatBorder      = { fg = newpaper.border, bg = newpaper.float_bg },
            Folded           = { fg = newpaper.folded_fg, bg = newpaper.folded_bg },                                         -- line used for closed folds
            FoldColumn       = { fg = newpaper.folded_fg, bg = newpaper.linenumber_bg },                                     -- 'foldcolumn'
            IncSearch        = { fg = newpaper.search_fg, bg = newpaper.search_bg },                                         -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Substitute       = { fg = newpaper.search_fg, bg = newpaper.yellow },                                            -- |:substitute| replacement text highlighting
            LineNr           = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg },                                 -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.cursor_nr_bg },                                   -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
            CursorLineSign   = { bg = newpaper.linenumber_bg },
            MatchParen       = { bg = newpaper.aqua, style = style.b_bold },                                                 -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            ModeMsg          = { fg = newpaper.accent, style = style.b_bold },                                               -- 'showmode' message (e.g., "-- INSERT -- ")
            MsgArea          = { fg = newpaper.msgarea_fg, bg = newpaper.msgarea_bg },                                       -- Area for messages and cmdline
            MoreMsg          = { fg = newpaper.accent },                                                                     -- |more-prompt|
            Normal           = { fg = newpaper.normal_fg, bg = newpaper.normal_bg },                                         -- normal text and background color
            NormalSB         = { fg = newpaper.sb_fg, bg = newpaper.sb_bg },
            NormalFloat      = { fg = newpaper.float_fg, bg = newpaper.float_bg },                                           -- normal text and background color for floating windows
            NonText          = { fg = newpaper.disabled },                                                                   -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            Pmenu            = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },                                           -- Popup menu: normal item.
            PmenuSel         = { fg = newpaper.bg, bg = newpaper.pmenu_fg },                                                 -- Popup menu: selected item.
            PmenuSbar        = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },                                           -- Popup menu: scrollbar.
            PmenuThumb       = { fg = newpaper.fg, bg = newpaper.pmenu_fg },                                                 -- Popup menu: Thumb of the scrollbar.
            Question         = { fg = newpaper.darkgreen },                                                                  -- |hit-enter| prompt and yes/no questions
            QuickFixLine     = { fg = newpaper.highlight, bg = newpaper.title, style = style.reverse },                      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            qfLineNr         = { fg = newpaper.highlight, bg = newpaper.title, style = style.reverse },                      -- Line numbers for quickfix lists
            Search           = { fg = newpaper.search_fg, bg = newpaper.search_bg },                                         -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
            SignColumn       = { fg = newpaper.fg, bg = newpaper.linenumber_bg },
            SpecialKey       = { fg = newpaper.disabled },                                                                   -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
            SpellBad         = { bg = newpaper.spellbad, sp = newpaper.red, style = style.error },                           -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            SpellCap         = { bg = newpaper.spellcap, sp = newpaper.tag_navy, style = style.error },                      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
            SpellLocal       = { bg = newpaper.spelllocal, sp = newpaper.regexp_green, style = style.error },                -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
            SpellRare        = { bg = newpaper.spellrare, sp = newpaper.regexp_orange, style = style.error },                -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
            StatusLine       = { fg = newpaper.teal, bg = newpaper.silver },                                                 -- status line of current window
            StatusLineNC     = { fg = newpaper.lightgrey, bg = newpaper.silver },                                            -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            StatusLineTerm   = { fg = newpaper.fg, bg = newpaper.silver },                                                   -- status line of current terminal window
            StatusLineTermNC = { fg = newpaper.lightgrey, bg = newpaper.bg },                                                -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            Tabline          = { fg = newpaper.tabline_inactive_fg, bg = newpaper.tabline_inactive_bg },
            TabLineFill      = { bg = newpaper.tabline_bg },                                                                 -- tab pages line, where there are no labels
            TablineSel       = { fg = newpaper.tabline_active_fg, bg = newpaper.tabline_active_bg, style = style
            .b_bold_i },                                                                                                     -- tab pages line, active tab page label
            Title            = { fg = newpaper.title, style = style.b_bold },                                                -- titles for output from ":set all", ":autocmd" etc.
            ToolbarButton    = { fg = newpaper.fg, style = style.b_bold },
            Visual           = { fg = newpaper.bg, bg = newpaper.selection },                                                -- Visual mode selection
            VisualNOS        = { fg = newpaper.bg, bg = newpaper.selection },                                                -- Visual mode selection when vim is "Not Owning the Selection".
            WarningMsg       = { fg = newpaper.magenta },                                                                    -- warning messages
            Whitespace       = { fg = newpaper.disabled },                                                                   -- "nbsp", "space", "tab" and "trail" in 'listchars'
            ToolbarLine      = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
            NormalMode       = { fg = newpaper.teal, style = style.reverse },                                                -- Normal mode message in the cmdline
            InsertMode       = { fg = newpaper.darkgreen, style = style.reverse },                                           -- Insert mode message in the cmdline
            ReplacelMode     = { fg = newpaper.magenta, style = style.reverse },                                             -- Replace mode message in the cmdline
            VisualMode       = { fg = newpaper.purple, style = style.reverse },                                              -- Visual mode message in the cmdline
            CommandMode      = { fg = newpaper.orange, style = style.reverse },                                              -- Command mode message in the cmdline
            Warnings         = { fg = newpaper.magenta },
            WildMenu         = { fg = newpaper.wildmenu_fg, bg = newpaper.wildmenu_bg, style = style.b_bold },               -- current match in 'wildmenu' completion
            WinSeparator     = { fg = newpaper.win_border, bg = newpaper.none },                                             -- separators between window splits
            VertSplit        = { link = "WinSeparator" },
            WinBar           = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },                                         -- Window bar of current window.
            WinBarNC         = { fg = newpaper.winbar_fg, bg = newpaper.winbar_bg },                                         -- Window bar of not-current
            healthError      = { fg = newpaper.errormsg_fg },
            healthSuccess    = { fg = newpaper.hint_fg },
            healthWarning    = { fg = newpaper.warn_fg },

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
            ["@annotation"]                            = { fg = newpaper.red },                                    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
            ["@attribute"]                             = { fg = newpaper.blue },
            ["@boolean"]                               = { fg = newpaper.boolean, style = style.k_style },         -- For booleans.
            ["@character"]                             = { fg = newpaper.orange },                                 -- For characters.
            ["@character.special"]                     = { fg = newpaper.maroon, nocombine = true },
            ["@comment"]                               = { fg = newpaper.comment, style = style.c_style },         -- For comment blocks.
            ["@comment.documentation"]                 = { fg = newpaper.doc_comment, style = style.doc_style, nocombine = true }, -- comments documenting code
            ["@conceal"]                               = { fg = newpaper.tex_math },                               -- for captures that are only used for concealing.
            ["@conditional"]                           = { fg = newpaper.keyword, style = style.k_style },         -- conditionnals.
            ["@conditional.ternary"]                   = { fg = newpaper.keyword, style = style.d_style },
            ["@constant"]                              = { fg = newpaper.darkgreen, nocombine = true },                              -- For constants
            ["@constant.builtin"]                      = { fg = newpaper.maroon, nocombine = true },               -- For constant that are built in the language: `nil` in Lua.
            ["@constant.macro"]                        = { fg = newpaper.maroon, nocombine = true },               -- For constants that are defined by macros: `NULL` in C.
            ["@constructor"]                           = { fg = newpaper.lua_blue, style = style.br_style },       -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
            ["@debug"]                                 = { fg = newpaper.red },
            ["@define"]                                = { fg = newpaper.magenta },
            ["@error"]                                 = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg }, -- For syntax/parser errors.
            ["@exception"]                             = { fg = newpaper.redorange, style = style.k_style },       -- For exception related keywords.
            ["@field"]                                 = { fg = newpaper.ocean },                                  -- For fields.
            ["@float"]                                 = { fg = newpaper.magenta },                                -- For floats.
            ["@function"]                              = { fg = newpaper.lua_navy, style = style.f_style },        -- For fuction definitions.
            ["@function.builtin"]                      = { fg = newpaper.tex_red, style = style.f_style },         -- For builtin functions: `table.insert` in Lua.
            ["@function.call"]                         = { fg = newpaper.lua_navy, style = style.f_style },        -- For fuction calls.
            ["@function.macro"]                        = { fg = newpaper.magenta, style = style.f_style },         -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
            ["@include"]                               = { fg = newpaper.maroon },                                 -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
            ["@keyword"]                               = { fg = newpaper.keyword, style = style.k_style },         -- For keywords that don't fall in previous categories.
            ["@keyword.coroutine"]                     = { fg = newpaper.tex_keyword, style = style.k_style },     -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python).
            ["@keyword.function"]                      = { fg = newpaper.darkpurple, style = style.k_style },      -- keywords used to define a fuction.
            ["@keyword.operator"]                      = { fg = newpaper.tag_navy, style = style.o_style },        -- define a operators like and, or.
            ["@keyword.return"]                        = { fg = newpaper.tex_keyword, style = style.k_style },     -- define a return.
            ["@label"]                                 = { fg = newpaper.redorange },                              -- For labels: `label:` in C and `:label:` in Lua.
            ["@method"]                                = { fg = newpaper.ruby_navy, style = style.f_style },       -- For method definitions.
            ["@method.call"]                           = { fg = newpaper.navy, style = style.f_style },            -- For method calls definitions.
            ["@namespace"]                             = { fg = newpaper.darkyellow },                             -- For identifiers referring to modules and namespaces.
            ["@namespace.builtin"]                     = { fg = newpaper.tex_magenta },
            ["@none"]                                  = { fg = newpaper.disabled },
            ["@number"]                                = { fg = newpaper.number },                                 -- For all numbers
            ["@operator"]                              = { fg = newpaper.navy, style = style.o_style },            -- For any operator: `+`, but also `->` and `*` in C.
            ["@parameter"]                             = { fg = newpaper.orange },                                 -- For parameters of a function.
            ["@preproc"]                               = { fg = newpaper.navy },
            ["@property"]                              = { fg = newpaper.darkgreen },                              -- Same as `TSField`,accesing for struct members in C.
            ["@punctuation.bracket"]                   = { fg = newpaper.navy, style = style.br_style },           -- For brackets and parens.
            ["@punctuation.delimiter"]                 = { fg = newpaper.persimona, style = style.d_style },       -- For delimiters ie: `.`
            ["@punctuation.special"]                   = { fg = newpaper.lightmagenta },                           -- For special punctutation that does not fall in the catagories before.
            ["@repeat"]                                = { fg = newpaper.keyword, style = style.k_style },         -- keywords related to loops.
            ["@storageclass"]                          = { fg = newpaper.lua_navy, style = style.k_style },
            ["@string"]                                = { fg = newpaper.string, style = style.s_style },          -- For strings.
            ["@string.documentation"]                  = { fg = newpaper.regexp_blue, style = style.s_style },     -- string documenting code (e.g. Python docstrings).
            ["@string.escape"]                         = { fg = newpaper.tex_magenta },                            -- For escape characters within a string.
            ["@string.regex"]                          = { fg = newpaper.regexp_blue },                            -- For regexes.
            ["@string.special"]                        = { fg = newpaper.dark_maroon, style = style.s_style },
            ["@symbol"]                                = { fg = newpaper.darkyellow },                             -- For identifiers referring to symbols or atoms.
            ["@tag"]                                   = { fg = newpaper.tag, style = style.tag_style },           -- HTML tag names.
            ["@tag.attribute"]                         = { fg = newpaper.darkengreen },
            ["@tag.delimiter"]                         = { fg = newpaper.tag_navy, style = style.tb_style },       -- Tag delimiter like `<` `>` `/`
            ["@text"]                                  = { fg = newpaper.fg },                                     -- For strings considered text in a markup language.
            ["@text.diff.add"]                         = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            ["@text.diff.delete"]                      = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            ["@text.danger"]                           = { fg = newpaper.bg, bg = newpaper.warn_fg },
            ["@text.emphasis"]                         = { style = style.italic },                                 -- For text to be represented with emphasis.
            ["@text.environment"]                      = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            ["@text.environment.name"]                 = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
            ["@text.literal"]                          = { fg = newpaper.regexp_blue },                            -- Literal text.
            ["@text.literal.block"]                    = { fg = newpaper.regexp_blue },                            -- literal or verbatim text as a stand-alone block.
            ["@text.math"]                             = { fg = newpaper.tex_math },
            ["@text.note"]                             = { fg = newpaper.bg, bg = newpaper.hint_fg },
            ["@text.reference"]                        = { fg = newpaper.tex_maroon },
            ["@text.strike"]                           = { style = style.strike },                                 -- For strikethrough text.
            ["@text.strong"]                           = { style = style.bold },
            ["@text.title"]                            = { fg = newpaper.title, style = style.b_bold },            -- Text that is part of a title.
            ["@text.underline"]                        = { style = style.underline },                              -- For text to be represented with an underline.
            ["@text.uri"]                              = { fg = newpaper.link, style = style.link },               -- Any URI like a link or email.
            ["@text.warning"]                          = { fg = newpaper.bg, bg = newpaper.info_fg },
            ["@text.todo"]                             = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
            ["@text.quote"]                            = { fg = newpaper.tex_navy },
            ["@type"]                                  = { fg = newpaper.darkengreen },                            -- For types.
            ["@type.builtin"]                          = { fg = newpaper.bluegreen, style = style.k_style },       -- For builtin types.
            ["@type.definition"]                       = { fg = newpaper.maroon },
            ["@type.qualifier"]                        = { fg = newpaper.maroon, style = style.k_style },
            ["@variable"]                              = { fg = newpaper.variable, style = style.v_style },        -- Any variable name that does not have another highlight.
            ["@variable.builtin"]                      = { fg = newpaper.olive, style = style.v_style },           -- Variable names that are defined by the languages, like `this` or `self`.
            ["@variable.global"]                       = { fg = newpaper.green, style = style.k_style },

            ["@text.title.1"]                          = { fg = newpaper.tex_part_title, style = style.k_style },
            ["@text.title.2"]                          = { fg = newpaper.teal, style = style.k_style },
            ["@text.title.3"]                          = { fg = newpaper.blue, style = style.k_style },
            ["@text.title.4"]                          = { fg = newpaper.tex_math, style = style.k_style },
            ["@text.title.5"]                          = { fg = newpaper.tex_lightpurple, style = style.k_style },
            ["@text.title.6"]                          = { fg = newpaper.tex_darkorange, style = style.k_style },
            ["@text.title.1.marker"]                   = { fg = newpaper.tex_part_title },
            ["@text.title.2.marker"]                   = { fg = newpaper.teal },
            ["@text.title.3.marker"]                   = { fg = newpaper.blue },
            ["@text.title.4.marker"]                   = { fg = newpaper.tex_math },
            ["@text.title.5.marker"]                   = { fg = newpaper.tex_lightpurple },
            ["@text.title.6.marker"]                   = { fg = newpaper.tex_darkorange },

            -- Locals
            ["@definition"]                            = { fg = newpaper.fg, style = style.v_style },
            ["@definition.constant"]                   = { fg = newpaper.darkgreen, nocombine = true },
            ["@definition.function"]                   = { fg = newpaper.lua_navy, style = style.f_style },
            ["@definition.method"]                     = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@definition.var"]                        = { fg = newpaper.tex_math, style = style.v_style },
            ["@definition.parameter"]                  = { fg = newpaper.darkorange, style = style.v_style },
            ["@definition.macro"]                      = { fg = newpaper.lightmagenta },
            ["@definition.type"]                       = { fg = newpaper.ruby_navy, style = style.k_style },       -- types or classes
            ["@definition.field"]                      = { fg = newpaper.tex_teal },
            ["@definition.enum"]                       = { fg = newpaper.blue },
            ["@definition.namespace"]                  = { fg = newpaper.blue, style = style.k_style },            -- modules or namespaces
            ["@definition.import"]                     = { fg = newpaper.olive },
            ["@definition.associated"]                 = { fg = newpaper.bluegreen },

            -- TODO: Add more groups
            -- INFO: https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight

            -- LSP semantic tokens
            ["@lsp.type.class"]                        = { link = "@storageclass" },
            ["@lsp.type.comment"]                      = { link = "@comment" },
            ["@lsp.type.decorator"]                    = { link = "@function.builtin" },
            ["@lsp.type.enum"]                         = { link = "@number" },
            ["@lsp.type.enumMember"]                   = { link = "@constant" },
            ["@lsp.type.function"]                     = { link = "@function" },
            ["@lsp.type.interface"]                    = { link = "@keyword.function" },
            ["@lsp.type.macro"]                        = { link = "@function.macro" },
            ["@lsp.type.method"]                       = { link = "@method" },
            ["@lsp.type.namespace"]                    = { link = "@namespace" },
            ["@lsp.type.parameter"]                    = { link = "@parameter" },
            ["@lsp.type.property"]                     = { link = "@field" },
            ["@lsp.type.struct"]                       = { link = "@symbol" },
            ["@lsp.type.type"]                         = { link = "@type" },
            ["@lsp.type.typeParameter"]                = { link = "@definition.parameter" },
            ["@lsp.type.variable"]                     = { link = "@variable" },

            ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
            ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
            ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
            ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
            ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
            ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
            ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
            ["@lsp.typemod.parameter.declaration"]     = { link = "@parameter" },
            ["@lsp.typemod.string.injected"]           = { link = "@string" },
            ["@lsp.typemod.type.defaultLibrary"]       = { link = "@type.builtin" },
            ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@namespace.builtin" },
            ["@lsp.typemod.variable.definition"]       = { link = "@variable.builtin" },
            ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
        }

        return treesitter
    end

    theme.loadLSP        = function()
        local lsp = {
            LspCodeLens                = { fg = newpaper.comment, bg = newpaper.lightsilver },
            LspCodeLensSeparator       = { fg = newpaper.comment, bg = newpaper.lightsilver, style = style.b_bold },
            LspReferenceText           = { fg = newpaper.todo_default, bg = newpaper.highlight },
            LspReferenceRead           = { fg = newpaper.todo_info, bg = newpaper.highlight },
            LspReferenceWrite          = { fg = newpaper.todo_hint, bg = newpaper.highlight },

            DiagnosticError            = { fg = newpaper.error_fg, bg = newpaper.none },
            DiagnosticFloatingError    = { fg = newpaper.error_fg },
            DiagnosticFloatingHint     = { fg = newpaper.hint_fg },
            DiagnosticFloatingInfo     = { fg = newpaper.info_fg },
            DiagnosticFloatingWarn     = { fg = newpaper.warn_fg },
            DiagnosticHint             = { fg = newpaper.hint_fg, bg = newpaper.none },
            DiagnosticInfo             = { fg = newpaper.info_fg, bg = newpaper.none },
            DiagnosticOther            = { fg = newpaper.magenta },
            DiagnosticSignError        = { fg = newpaper.error_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignHint         = { fg = newpaper.hint_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignInfo         = { fg = newpaper.info_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignOther        = { fg = newpaper.magenta },
            DiagnosticSignWarn         = { fg = newpaper.warn_fg, bg = newpaper.linenumber_bg },
            DiagnosticUnderlineError   = { style = style.undercurl, sp = newpaper.error_fg },
            DiagnosticUnderlineHint    = { style = style.undercurl, sp = newpaper.hint_fg },
            DiagnosticUnderlineInfo    = { style = style.undercurl, sp = newpaper.info_fg },
            DiagnosticUnderlineWarn    = { style = style.undercurl, sp = newpaper.warn_fg },
            DiagnosticVirtualTextError = { fg = newpaper.error_fg, bg = newpaper.lsp_error_bg },
            DiagnosticVirtualTextHint  = { fg = newpaper.hint_fg, bg = newpaper.hint_bg },
            DiagnosticVirtualTextInfo  = { fg = newpaper.info_fg, bg = newpaper.info_bg },
            DiagnosticVirtualTextWarn  = { fg = newpaper.warn_fg, bg = newpaper.warn_bg },
            DiagnosticWarn             = { fg = newpaper.warn_fg, bg = newpaper.none },
        }
        return lsp
    end

    theme.loadPlugins    = function()
        local plugins = {
            -- BufferLine -----------------------------------------------------
            BufferLineInfoDiagnosticSelected    = { fg = newpaper.info_fg, style = style.b_bold_i },
            BufferLineHintDiagnosticSelected    = { fg = newpaper.hint_fg, style = style.b_bold_i },
            BufferLineWarningDiagnosticSelected = { fg = newpaper.warn_fg, style = style.b_bold_i },
            BufferLineErrorDiagnosticSelected   = { fg = newpaper.error_fg, style = style.b_bold_i },
            BufferLineInfoSelected              = { fg = newpaper.info_fg, style = style.b_bold_i },
            BufferLineHintSelected              = { fg = newpaper.hint_fg, style = style.b_bold_i },
            BufferLineWarningSelected           = { fg = newpaper.warn_fg, style = style.b_bold_i },
            BufferLineErrorSelected             = { fg = newpaper.error_fg, style = style.b_bold_i },

            -- Dashboard ------------------------------------------------------
            DashboardShortCut                   = { fg = newpaper.red },
            DashboardHeader                     = { fg = newpaper.comment },
            DashboardCenter                     = { fg = newpaper.accent },
            DashboardFooter                     = { fg = newpaper.green, style = style.b_italic },

            -- Diff -----------------------------------------------------------
            diffAdded                           = { fg = newpaper.git_added },
            diffRemoved                         = { fg = newpaper.git_removed },
            diffChanged                         = { fg = newpaper.git_modified },
            diffOldFile                         = { fg = newpaper.text },
            diffNewFile                         = { fg = newpaper.title },
            diffFile                            = { fg = newpaper.grey },
            diffLine                            = { fg = newpaper.blue },
            diffIndexLine                       = { fg = newpaper.purple },

            -- Fern -----------------------------------------------------------
            FernBranchText                      = { fg = newpaper.blue },

            -- Flash ----------------------------------------------------------
            FlashBackdrop                       = { fg = newpaper.comment },
            FlashLabel                          = { fg = newpaper.fg, bg = newpaper.magenta_bg, style = style.b_bold },

            -- GitGutter ------------------------------------------------------
            GitGutterAdd                        = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitGutterChange                     = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitGutterDelete                     = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },

            -- GitSigns -------------------------------------------------------
            GitSignsAdd                         = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsAddNr                       = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsAddLn                       = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
            GitSignsChange                      = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsChangeNr                    = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsChangeLn                    = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
            GitSignsDelete                      = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
            GitSignsDeleteNr                    = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
            GitSignsDeleteLn                    = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },

            -- Glyph palette --------------------------------------------------
            GlyphPalette1                       = { fg = newpaper.red },
            GlyphPalette2                       = { fg = newpaper.green },
            GlyphPalette3                       = { fg = newpaper.darkorange },
            GlyphPalette4                       = { fg = newpaper.blue },
            GlyphPalette6                       = { fg = newpaper.teal },
            GlyphPalette7                       = { fg = newpaper.aqua },
            GlyphPalette9                       = { fg = newpaper.magenta },
            GlyphPaletteDirectory               = { fg = newpaper.navy },

            -- Headlines ------------------------------------------------------
            Headline                            = { bg = newpaper.none, style = style.k_bold },
            CodeBlock                           = { bg = newpaper.codeblock },
            Dash                                = { fg = newpaper.orange, bg = newpaper.none },

            -- Hop ------------------------------------------------------------
            HopNextKey                          = { fg = newpaper.accent, style = style.b_bold },
            HopNextKey1                         = { fg = newpaper.purple, style = style.b_bold },
            HopNextKey2                         = { fg = newpaper.blue },
            HopUnmatched                        = { fg = newpaper.comment },

            -- Illuminate -----------------------------------------------------
            illuminatedWord                     = { bg = newpaper.highlight },
            illuminatedCurWord                  = { bg = newpaper.contrast },

            -- IndentBlankline ------------------------------------------------
            IndentBlanklineContextChar          = { fg = newpaper.contextchar },
            IndentBlanklineContextStart         = { style = style.underline },

            -- LanguageTool ---------------------------------------------------
            LanguageToolCmd                     = { fg = newpaper.comment },
            LanguageToolErrorCount              = { fg = newpaper.orange, bg = newpaper.active, style = style.b_bold },
            LanguageToolLabel                   = { fg = newpaper.darkgreen },
            LanguageToolUrl                     = { fg = newpaper.link, style = style.link },
            LanguageToolGrammarError            = { fg = newpaper.fg, bg = newpaper.spellrare, style = style.error },
            LanguageToolSpellingError           = { fg = newpaper.fg, bg = newpaper.spellbad, style = style.error },

            -- LazyGit --------------------------------------------------------
            LazyGitFloat                        = { fg = newpaper.git_fg, bg = newpaper.term_fl_bg },
            LazyGitBorder                       = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },

            -- Litee ----------------------------------------------------------
            LTBoolean                           = { fg = newpaper.boolean, style = style.k_style },
            LTConstant                          = { fg = newpaper.darkengreen },
            LTConstructor                       = { fg = newpaper.bluegreen },
            LTField                             = { fg = newpaper.ocean },
            LTFunction                          = { fg = newpaper.navy },
            LTMethod                            = { fg = newpaper.bluegreen },
            LTNamespace                         = { fg = newpaper.darkyellow },
            LTNumber                            = { fg = newpaper.red },
            LTOperator                          = { fg = newpaper.teal },
            LTParameter                         = { fg = newpaper.orange },
            LTParameterReference                = { fg = newpaper.olive },
            LTString                            = { fg = newpaper.string, style = style.s_style },
            LTSymbol                            = { fg = newpaper.teal, style = style.underline },
            LTSymbolDetail                      = { fg = newpaper.darkgreen, style = style.b_italic },
            LTSymbolJump                        = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            LTSymbolJumpRefs                    = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
            LTType                              = { fg = newpaper.keyword },
            LTURI                               = { fg = newpaper.link, style = style.link },
            LTIndentGuide                       = { fg = newpaper.comment },
            LTExpandedGuide                     = { fg = newpaper.comment, style = style.b_bold },
            LTCollapsedGuide                    = { fg = newpaper.comment },
            LTSelectFiletree                    = { fg = newpaper.string },
            LTNormalSB                          = { fg = newpaper.fg, bg = newpaper.bg },

            -- Lua-dev --------------------------------------------------------
            RedrawDebugNormal                   = { fg = newpaper.bg, bg = newpaper.fg },
            RedrawDebugClear                    = { fg = newpaper.fg, bg = newpaper.lightorange },
            RedrawDebugComposed                 = { fg = newpaper.fg, bg = newpaper.green },
            RedrawDebugRecompose                = { fg = newpaper.fg, bg = newpaper.red },

            -- Lualine custom color for lualine with bg
            LualineDiagnosticError              = { fg = newpaper.error_fg, bg = newpaper.silver },
            LualineDiagnosticWarn               = { fg = newpaper.warn_fg, bg = newpaper.silver },
            LualineDiagnosticInfo               = { fg = newpaper.info_fg, bg = newpaper.silver },
            LualineDiagnosticHint               = { fg = newpaper.hint_fg, bg = newpaper.silver },

            -- Nvim-Cmp -------------------------------------------------------
            CmpDocumentation                    = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            CmpDocumentationBorder              = { fg = newpaper.border, bg = newpaper.float_bg },
            CmpItemMenu                         = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
            CmpItemKind                         = { fg = newpaper.lightblue },
            CmpItemAbbr                         = { fg = newpaper.pmenu_fg },
            CmpItemAbbrDeprecated               = { fg = newpaper.lightgrey },
            CmpItemAbbrMatch                    = { fg = newpaper.navy, style = style.b_bold },
            CmpItemAbbrMatchFuzzy               = { fg = newpaper.magenta, style = style.b_bold },
            CmpItemKindText                     = { fg = newpaper.string },       -- Text          = ""
            CmpItemKindMethod                   = { fg = newpaper.bluegreen },    -- Method        = ""
            CmpItemKindFunction                 = { fg = newpaper.navy },         -- Function      = ""
            CmpItemKindConstructor              = { fg = newpaper.bluegreen },    -- Constructor   = ""
            CmpItemKindField                    = { fg = newpaper.ocean },        -- Field         = "ﰠ"
            CmpItemKindVariable                 = { fg = newpaper.darkengreen },  -- Variable      = ""
            CmpItemKindClass                    = { fg = newpaper.ruby_magenta }, -- Class         = "ﴯ"
            CmpItemKindInterface                = { fg = newpaper.olive },        -- Interface     = ""
            CmpItemKindModule                   = { fg = newpaper.darkyellow },   -- Module        = ""
            CmpItemKindProperty                 = { fg = newpaper.bluegreen },    -- Property      = "ﰠ"
            CmpItemKindUnit                     = { fg = newpaper.darkpurple },   -- Unit          = "塞"
            CmpItemKindValue                    = { fg = newpaper.naamber },      -- Value         = ""
            CmpItemKindEnum                     = { fg = newpaper.green },        -- Enum          = ""
            CmpItemKindKeyword                  = { fg = newpaper.keyword },      -- Keyword       = ""
            CmpItemKindSnippet                  = { fg = newpaper.darkpurple },   -- Snippet       = ""
            CmpItemKindColor                    = { fg = newpaper.magenta },      -- Color         = ""
            CmpItemKindFile                     = { fg = newpaper.teal },         -- File          = ""
            CmpItemKindReference                = { fg = newpaper.darkyellow },   -- Reference     = ""
            CmpItemKindFolder                   = { fg = newpaper.teal },         -- Folder        = ""
            CmpItemKindEnumMember               = { fg = newpaper.green },        -- EnumMember    = ""
            CmpItemKindConstant                 = { fg = newpaper.darkengreen },  -- Constant      = ""
            CmpItemKindStruct                   = { fg = newpaper.olive },        -- Struct        = "פּ"
            CmpItemKindEvent                    = { fg = newpaper.orange },       -- Event         = ""
            CmpItemKindOperator                 = { fg = newpaper.tag_navy },     -- Operator      = ""
            CmpItemKindTypeParameter            = { fg = newpaper.orange },       -- TypeParameter = " "

            -- Neogit ---------------------------------------------------------
            NeogitBranch                        = { fg = newpaper.blue },
            NeogitRemote                        = { fg = newpaper.purple },
            NeogitHunkHeader                    = { fg = newpaper.fg, bg = newpaper.highlight },
            NeogitHunkHeaderHighlight           = { fg = newpaper.fg, bg = newpaper.contrast },
            NeogitDiffContextHighlight          = { fg = newpaper.text, bg = newpaper.contrast },
            NeogitDiffDeleteHighlight           = { fg = newpaper.git_removed },
            NeogitDiffAddHighlight              = { fg = newpaper.git_added },

            -- Nvim dap -------------------------------------------------------
            DapBreakpoint                       = { fg = newpaper.darkgreen, bg = newpaper.linenumber_bg },
            DapBreakpointCondition              = { fg = newpaper.darkyellow, bg = newpaper.linenumber_bg },
            DapBreakpointRejected               = { fg = newpaper.ocean, bg = newpaper.linenumber_bg },
            DapLogPoint                         = { fg = newpaper.string, bg = newpaper.linenumber_bg },
            DapStopped                          = { fg = newpaper.red, bg = newpaper.linenumber_bg },

            -- Nvim-dap-ui ----------------------------------------------------
            DapUIVariable                       = { fg = newpaper.darkengreen, style = style.v_style },
            DapUIScope                          = { fg = newpaper.teal, style = style.b_bold },
            DapUIType                           = { fg = newpaper.keyword },
            DapUIValue                          = { fg = newpaper.teal },
            DapUIModifiedValue                  = { fg = newpaper.red },
            DapUIDecoration                     = { fg = newpaper.blue },
            DapUIThread                         = { fg = newpaper.ocean },
            DapUIStoppedThread                  = { fg = newpaper.ocean, style = style.b_bold },
            DapUIFrameName                      = { fg = newpaper.navy },
            DapUISource                         = { fg = newpaper.lightblue },
            DapUILineNumber                     = { fg = newpaper.darkorange },
            DapUIFloatBorder                    = { fg = newpaper.border },
            DapUIWatchesEmpty                   = { fg = newpaper.magenta },
            DapUIWatchesValue                   = { fg = newpaper.nephritis },
            DapUIWatchesError                   = { fg = newpaper.error_fg },
            DapUIBreakpointsPath                = { fg = newpaper.lightblue, style = style.b_bold },
            DapUIBreakpointsInfo                = { fg = newpaper.darkyellow },
            DapUIBreakpointsCurrentLine         = { fg = newpaper.orange, style = style.b_bold },
            DapUIBreakpointsLine                = { fg = newpaper.orange },

            -- Nvim-dap-virtual-text ------------------------------------------
            NvimDapVirtualText                  = { fg = newpaper.grey, style = style.c_style },
            NvimDapVirtualTextChanged           = { fg = newpaper.warn_fg, style = style.c_style },
            NvimDapVirtualTextError             = { fg = newpaper.error_fg, style = style.c_style },
            NvimDapVirtualTextInfo              = { fg = newpaper.info_fg, style = style.c_style },

            -- Nvim-notify ----------------------------------------------------
            NotifyERRORBorder                   = { fg = newpaper.error_fg },
            NotifyWARNBorder                    = { fg = newpaper.warn_fg },
            NotifyINFOBorder                    = { fg = newpaper.info_fg },
            NotifyDEBUGBorder                   = { fg = newpaper.text },
            NotifyTRACEBorder                   = { fg = newpaper.purple },
            NotifyERRORIcon                     = { fg = newpaper.error_fg },
            NotifyWARNIcon                      = { fg = newpaper.warn_fg },
            NotifyINFOIcon                      = { fg = newpaper.info_fg },
            NotifyDEBUGIcon                     = { fg = newpaper.text },
            NotifyTRACEIcon                     = { fg = newpaper.purple },
            NotifyERRORTitle                    = { fg = newpaper.error_fg },
            NotifyWARNTitle                     = { fg = newpaper.warn_fg },
            NotifyINFOTitle                     = { fg = newpaper.info_fg },
            NotifyDEBUGTitle                    = { fg = newpaper.text },
            NotifyTRACETitle                    = { fg = newpaper.purple },
            NotifyERRORBody                     = { fg = newpaper.float_fg },
            NotifyWARNBody                      = { fg = newpaper.float_fg },
            NotifyINFOBody                      = { fg = newpaper.float_fg },
            NotifyDEBUGBody                     = { fg = newpaper.float_fg },
            NotifyTRACEBody                     = { fg = newpaper.float_fg },

            -- Packer ---------------------------------------------------------
            packerHash                          = { fg = newpaper.tag },
            packerOutput                        = { fg = newpaper.keyword },
            packerStatus                        = { fg = newpaper.teal },
            packerStatusCommit                  = { fg = newpaper.git_modified },
            packerPackageName                   = { fg = newpaper.teal },
            packerWorking                       = { fg = newpaper.comment },
            packerProgress                      = { fg = newpaper.green, style = style.b_bold },

            -- Rainbow Delimiters ---------------------------------------------
            RainbowDelimiterRed                 = { fg = newpaper.rainbowred },
            RainbowDelimiterYellow              = { fg = newpaper.rainbowyellow },
            RainbowDelimiterBlue                = { fg = newpaper.rainbowblue },
            RainbowDelimiterOrange              = { fg = newpaper.rainboworange },
            RainbowDelimiterGreen               = { fg = newpaper.rainbowgreen },
            RainbowDelimiterViolet              = { fg = newpaper.rainbowviolet },
            RainbowDelimiterCyan                = { fg = newpaper.rainbowcyan },

            -- Sneak ----------------------------------------------------------
            Sneak                               = { fg = newpaper.bg, bg = newpaper.accent },
            SneakScope                          = { bg = newpaper.selection },

            -- Symbols-outline ------------------------------------------------
            FocusedSymbol                       = { fg = newpaper.search_fg, bg = newpaper.search_bg,
                style = style.b_bold },
            SymbolsOutlineConnector             = { fg = newpaper.teal },
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

            -- Todo-comments --------------------------------------------------
            TodoSignWARN                        = { fg = newpaper.todo_warn, bg = newpaper.linenumber_bg },
            TodoSignTODO                        = { fg = newpaper.todo_info, bg = newpaper.linenumber_bg },
            TodoSignPERF                        = { fg = newpaper.todo_default, bg = newpaper.linenumber_bg },
            TodoSignNOTE                        = { fg = newpaper.todo_hint, bg = newpaper.linenumber_bg },
            TodoSignHACK                        = { fg = newpaper.todo_warn, bg = newpaper.linenumber_bg },
            TodoSignFIX                         = { fg = newpaper.todo_error, bg = newpaper.linenumber_bg },
            TodoFgWARN                          = { fg = newpaper.todo_warn },
            TodoFgTODO                          = { fg = newpaper.todo_info },
            TodoFgPERF                          = { fg = newpaper.todo_default },
            TodoFgNOTE                          = { fg = newpaper.todo_hint },
            TodoFgHACK                          = { fg = newpaper.todo_warn },
            TodoFgFIX                           = { fg = newpaper.todo_error },
            TodoBgWARN                          = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
            TodoBgTODO                          = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
            TodoBgPERF                          = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
            TodoBgNOTE                          = { fg = newpaper.bg, bg = newpaper.todo_hint, style = style.b_bold },
            TodoBgHACK                          = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
            TodoBgFIX                           = { fg = newpaper.bg, bg = newpaper.todo_error, style = style.b_bold },

            -- Vista ----------------------------------------------------------
            VistaParenthesis                    = { fg = newpaper.navy, style = style.b_bold },
            VistaScope                          = { fg = newpaper.keyword, style = style.k_style },
            VistaTag                            = { fg = newpaper.navy },
            VistaKind                           = { fg = newpaper.ocean, style = style.k_style },
            VistaScopeKind                      = { fg = newpaper.teal, style = style.underline },
            VistaLineNr                         = { fg = newpaper.cursor_nr_fg },
            VistaColon                          = { fg = newpaper.orange },
            VistaIcon                           = { fg = newpaper.teal },
            VistaArgs                           = { fg = newpaper.darkengreen, style = style.b_italic },
            VistaPublic                         = { fg = newpaper.green, style = style.k_style },
            VistaProtected                      = { fg = newpaper.maroon, style = style.k_style },
            VistaPrivate                        = { fg = newpaper.darkyellow, style = style.k_style },
            VistaFloat                          = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            VistaBracket                        = { fg = newpaper.navy, style = style.b_bold },
            VistaPrefix                         = { fg = newpaper.ocean },
            VistaHeadNr                         = { fg = newpaper.darkgrey },

            -- Vim-matchup ----------------------------------------------------
            MatchWord                           = { bg = newpaper.lightviolet, style = style.b_bold },

            -- WhichKey -------------------------------------------------------
            WhichKey                            = { fg = newpaper.keyword },
            WhichKeyGroup                       = { fg = newpaper.teal, style = style.b_bold },
            WhichKeySeparator                   = { fg = newpaper.darkgreen },
            WhichKeyDesc                        = { fg = newpaper.string },
            WhichKeyFloat                       = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            WhichKeyValue                       = { fg = newpaper.darkgrey },
        }
        return plugins

        -- stylua: ignore end
    end

    return theme
end

return M
