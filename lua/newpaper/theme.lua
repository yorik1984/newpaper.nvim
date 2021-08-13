local newpaper = require("newpaper.colors")

local theme = {}

theme.loadSyntax = function ()
    -- Syntax highlight groups

	local syntax = {
		Type           = { fg = newpaper.darkgreen }, -- int, long, char, etc.
		StorageClass   = { fg = newpaper.teal, style = 'bold' }, -- static, register, volatile, etc.
		Structure      = { fg = newpaper.puple }, -- struct, union, enum, etc.
		Constant       = { fg = newpaper.darkgreen }, -- any constant
		Character      = { fg = newpaper.darkgreen, style = 'bold' }, -- any character constant: 'c', '\n'
		Number         = { fg = newpaper.red }, -- a number constant: 5
		Boolean        = { fg = newpaper.darkgreen, style = 'bold' }, -- a boolean constant: TRUE, false
		Float          = { fg = newpaper.orange }, -- a floating point constant: 2.3e10
		Statement      = { fg = newpaper.keywords, style = 'bold' }, -- any statement
		Label          = { fg = newpaper.keywords }, -- case, default, etc.
		Operator       = { fg = newpaper.navy, style = 'bold' }, -- sizeof", "+", "*", etc.
		Exception      = { fg = newpaper.maroon }, -- try, catch, throw
		PreProc        = { fg = newpaper.keywords }, -- generic Preprocessor
		Include        = { fg = newpaper.magenta }, -- preprocessor #maroonlude
		Define         = { fg = newpaper.magenta }, -- preprocessor #define
		Macro          = { fg = newpaper.magenta }, -- same as Define
		Typedef        = { fg = newpaper.maroon }, -- A typedef
		PreCondit      = { fg = newpaper.magenta }, -- preprocessor #if, #else, #endif, etc.
		Special        = { fg = newpaper.magenta }, -- any special symbol
		SpecialChar    = { fg = newpaper.maroon }, -- special character in a constant
		Delimiter      = { fg = newpaper.orange }, -- character that needs attention like , or .
		SpecialComment = { fg = newpaper.comments, style = 'bold' }, -- special things inside a comment
		Debug          = { fg = newpaper.red }, -- debugging statements
		Underlined     = { fg = newpaper.link, style = 'underline' }, -- text that stands out, HTML links
		Ignore         = { fg = newpaper.disabled }, -- left blank, hidden
		Error          = { fg = newpaper.error_fg, bg = newpaper.error_bg, style = 'bold,underline' }, -- any erroneous construct

		htmlLink = { fg = newpaper.link, style   = 'underline' },
		htmlH1   = { fg = newpaper.blue, style   = 'bold' },
		htmlH2   = { fg = newpaper.maroon, style    = 'bold' },
		htmlH3   = { fg = newpaper.darkgreen, style  = 'bold' },
		htmlH4   = { fg = newpaper.darkyellow, style = 'bold' },
		htmlH5   = { fg = newpaper.purple, style = 'bold' },

        -- Markdown
		markdownH1 = { fg = newpaper.darkgreen, style = 'bold' },
		markdownH2 = { fg = newpaper.blue, style = 'bold' },
		markdownH3 = { fg = newpaper.purple, style = 'bold' },
		markdownH4 = { fg = newpaper.orange, style = 'bold' },
		markdownH5 = { fg = newpaper.darkyellow, style = 'bold' },
		markdownH6 = { fg = newpaper.olive, style = 'bold' },
		markdownH1Delimiter= { fg = newpaper.darkgreen },
		markdownH2Delimiter= { fg = newpaper.blue },
		markdownH3Delimiter= { fg = newpaper.purple },
		markdownH4Delimiter= { fg = newpaper.orange },
		markdownH5Delimiter= { fg = newpaper.darkyellow },
		markdownH6Delimiter= { fg = newpaper.olive },

	}

	-- Options:

	-- Italic comments
	if vim.g.newpaper_italic_comments then
		syntax.Comment = { fg = newpaper.comments, style = 'italic' } -- italic comments
	else
		syntax.Comment = {fg = newpaper.comments} -- normal comments
	end

	-- Italic Keywords and tags
	if vim.g.newpaper_italic_keywords then
		syntax.Conditional = { fg = newpaper.keywords, style = 'italic' } -- italic if, then, else, endif, switch, etc.
		syntax.Keyword     = { fg = newpaper.keywords, style = 'italic' } -- italic for, do, while, etc.
		syntax.Repeat      = { fg = newpaper.keywords, style = 'italic' } -- italic any other keyword
	elseif vim.g.newpaper_bold_keywords then
	-- Bold Keywords
		syntax.Conditional = { fg = newpaper.keywords, style = 'bold' } -- bold if, then, else, endif, switch, etc.
		syntax.Keyword     = { fg = newpaper.keywords, style = 'bold' } -- bold for, do, while, etc.
		syntax.Repeat      = { fg = newpaper.keywords, style = 'bold' } -- bold any other keyword
	else
		syntax.Conditional = { fg = newpaper.keywords } -- normal if, then, else, endif, switch, etc.
		syntax.Keyword     = { fg = newpaper.keywords } -- normal for, do, while, etc.
		syntax.Repeat      = { fg = newpaper.keywords } -- normal any other keyword
	end

	-- Bold Tags
	if vim.g.newpaper_bold_tags then
		syntax.Tag = { fg = newpaper.tags, style = 'bold' } -- you can use CTRL-] on this
	else
		syntax.Tag = { fg = newpaper.tags } -- you can use CTRL-] on this
	end

	-- Italic Function names
	if vim.g.newpaper_italic_functions then
		syntax.Function = { fg = newpaper.navy, style = 'italic' } -- italic funtion names
	else
		syntax.Function = { fg = newpaper.navy } -- normal function names
	end

	if vim.g.newpaper_italic_variables then
		syntax.Identifier = { fg = newpaper.variable, style = 'italic' } -- any variable name
	else
		syntax.Identifier = { fg = newpaper.variable } -- any variable name
	end

    if vim.g.newpaper_italic_strings then
        syntax.String = { fg = newpaper.string, style= 'italic' } -- any string
    else
        syntax.String = { fg = newpaper.string } -- any string
    end

	return syntax

end

theme.loadEditor = function ()
    -- Editor highlight gnavys

	local editor = {
		NormalFloat      = { fg = newpaper.float_fg, bg = newpaper.float_bg }, -- normal text and background color for floating windows
        FloatBorder      = { fg = newpaper.border, bg = newpaper.float_bg },
		ColorColumn      = { bg = newpaper.highlight }, --  used for the columns set with 'colorcolumn'
		Conceal          = { fg = newpaper.gray }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor           = { fg = newpaper.bg, bg = newpaper.cursor }, -- the character under the cursor
		CursorIM         = { fg = newpaper.bg, bg = newpaper.cursor }, -- like Cursor, but used when in IME mode
		Directory        = { fg = newpaper.navy }, -- directory names (and other special names in listings)
		DiffAdd          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg }, -- diff mode: Added line
		DiffChange       = { fg = newpaper.text, bg = newpaper.diffchange_bg }, --  diff mode: Changed line
		DiffDelete       = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg }, -- diff mode: Deleted line
		DiffText         = { fg = newpaper.text, bg = newpaper.difftext_bg }, -- diff mode: Changed text within a changed line
		ErrorMsg         = { fg = newpaper.error_fg, bg = newpaper.error_bg }, -- error messages
		Folded           = { fg = newpaper.folded_fg, bg = newpaper.folded_bg }, -- line used for closed folds
		FoldColumn       = { fg = newpaper.folded_fg, bg = newpaper.linenumber_bg }, -- 'foldcolumn'
		IncSearch        = { fg = newpaper.wildmenu_bg, bg = newpaper.title, style = 'reverse' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr           = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg },-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr     = { fg = newpaper.cursor_nr_fg, bg = newpaper.cursor_nr_bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen       = { bg = newpaper.aqua, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg          = { fg = newpaper.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg          = { fg = newpaper.accent }, -- |more-prompt|
		NonText          = { fg = newpaper.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu            = { fg = newpaper.text, bg = newpaper.contrast }, -- Popup menu: normal item.
		PmenuSel         = { fg = newpaper.bg, bg = newpaper.text }, -- Popup menu: selected item.
		PmenuSbar        = { fg = newpaper.text, bg = newpaper.contrast }, -- Popup menu: scrollbar.
		PmenuThumb       = { fg = newpaper.fg, bg = newpaper.text }, -- Popup menu: Thumb of the scrollbar.
		Question         = { fg = newpaper.darkgreen }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine     = { fg = newpaper.highlight, bg = newpaper.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr         = { fg = newpaper.highlight, bg = newpaper.title, style = 'reverse' }, -- Line numbers for quickfix lists
		Search           = { fg = newpaper.wildmenu_bg, bg = newpaper.title, style = 'reverse' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey       = { fg = newpaper.disabled }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad         = { bg = newpaper.spellbad, style = 'undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap         = { bg = newpaper.spellcap, style = 'undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal       = { bg = newpaper.spelllocal, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare        = { bg = newpaper.spellrare, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine       = { fg = newpaper.accent, bg = newpaper.active }, -- status line of current window
		StatusLineNC     = { fg = newpaper.fg, bg = newpaper.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm   = { fg = newpaper.fg, bg = newpaper.active }, -- status line of current terminal window
		StatusLineTermNC = { fg = newpaper.text, bg = newpaper.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill      = { fg = newpaper.tabline_bg }, -- tab pages line, where there are no labels
		TablineSel       = { fg = newpaper.tabline_active_fg, bg = newpaper.tabline_active_bg }, -- tab pages line, active tab page label
		Tabline          = { fg = newpaper.tabline_inactive_fg, bg = newpaper.tabline_inactive_bg  },
		Title            = { fg = newpaper.title, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
		Visual           = { fg = newpaper.bg, bg = newpaper.selection }, -- Visual mode selection
		VisualNOS        = { fg = newpaper.bg, bg = newpaper.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg       = { fg = newpaper.magenta }, -- warning messages
		Whitespace       = { fg = newpaper.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu         = { fg = newpaper.wildmenu_fg, bg = newpaper.wildmenu_bg, style = 'bold' }, -- current match in 'wildmenu' completion
		CursorColumn     = { bg = newpaper.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine       = { bg = newpaper.active }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		ToolbarLine      = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg },
		ToolbarButton    = { fg = newpaper.fg, style = 'bold' },
		NormalMode       = { fg = newpaper.teal, style = 'reverse' }, -- Normal mode message in the cmdline
		InsertMode       = { fg = newpaper.darkgreen, style = 'reverse' }, -- Insert mode message in the cmdline
		ReplacelMode     = { fg = newpaper.magenta, style = 'reverse' }, -- Replace mode message in the cmdline
		VisualMode       = { fg = newpaper.purple, style = 'reverse' }, -- Visual mode message in the cmdline
		CommandMode      = { fg = newpaper.orange, style = 'reverse' }, -- Command mode message in the cmdline
		Warnings         = { fg = newpaper.magenta },

        healthError   = { fg = newpaper.error_fg, bg = newpaper.error_bg },
        healthSuccess = { fg = newpaper.darkgreen },
        healthWarning = { fg = newpaper.magenta },

		-- Dashboard
		DashboardShortCut = { fg = newpaper.red },
		DashboardHeader   = { fg = newpaper.comments },
		DashboardCenter   = { fg = newpaper.accent },
		DashboardFooter   = { fg = newpaper.green, style = 'italic' },

	}

    -- Options:

    --Set transparent background
	if vim.g.newpaper_disable_background then
		editor.Normal       = { fg = newpaper.fg, bg = newpaper.none } -- normal text and background color
		editor.SignColumn   = { fg = newpaper.fg, bg = newpaper.none }
		editor.SignColumnSB = { fg = newpaper.sidebar_fg, bg = newpaper.none }
	else
		editor.Normal       = { fg = newpaper.fg, bg = newpaper.bg } -- normal text and background color
		editor.SignColumn   = { fg = newpaper.fg, bg = newpaper.linenumber_bg }
		editor.SignColumnSB = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg }
	end

	-- Remove window split borders
	if vim.g.newpaper_borders then
		editor.VertSplit = { fg = newpaper.border } -- the column separating vertically split windows
	else
		editor.VertSplit = { fg = newpaper.bg } -- the column separating vertically split windows
	end

	--Set End of Buffer lines (~)
	if vim.g.newpaper_hide_eob then
		editor.EndOfBuffer = { fg = newpaper.bg } -- ~ lines at the end of a buffer
	else
		editor.EndOfBuffer = { fg = newpaper.disabled } -- ~ lines at the end of a buffer
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
	vim.g.terminal_color_8  = newpaper.gray
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
		TSAnnotation         = { fg = newpaper.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSBoolean            = { fg = newpaper.darkgreen, style ='bold' }, -- For booleans.
		TSCharacter          = { fg = newpaper.orange }, -- For characters.
		TSConstructor        = { fg = newpaper.purple }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant           = { fg = newpaper.darkgreen }, -- For constants
		TSConstBuiltin       = { fg = newpaper.maroon }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro         = { fg = newpaper.maroon }, -- For constants that are defined by macros: `NULL` in C.
        TSNote               = { fg = newpaper.hint_fg },
        TSWarning            = { fg = newpaper.info_fg },
        TSDanger             = { fg = newpaper.warn_fg },
		TSError              = { bg = newpaper.error_bg }, -- For syntax/parser errors.
		TSException          = { fg = newpaper.maroon }, -- For exception related keywords.
		TSField              = { fg = newpaper.teal }, -- For fields.
		TSFloat              = { fg = newpaper.red }, -- For floats.
		TSFuncMacro          = { fg = newpaper.magenta }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude            = { fg = newpaper.maroon }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel              = { fg = newpaper.darkgreen }, -- For labels: `label:` in C and `:label:` in Lua.
		TSNamespace          = { fg = newpaper.darkyellow }, -- For identifiers referring to modules and namespaces.
		TSNumber             = { fg = newpaper.red }, -- For all numbers
		TSOperator           = { fg = newpaper.navy, style = 'bold' }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter          = { fg = newpaper.orange }, -- For parameters of a function.
		TSParameterReference = { fg = newpaper.orange }, -- For references to parameters of a function.
		TSProperty           = { fg = newpaper.darkgreen }, -- Same as `TSField`,accesing for struct members in C.
		TSPunctDelimiter     = { fg = newpaper.orange }, -- For delimiters ie: `.`
		TSPunctBracket       = { fg = newpaper.navy }, -- For brackets and parens.
		TSPunctSpecial       = { fg = newpaper.blue }, -- For special punctutation that does not fall in the catagories before.
		TSStringRegex        = { fg = newpaper.olive }, -- For regexes.
		TSStringEscape       = { fg = newpaper.darkgreen, style = 'bold' }, -- For escape characters within a string.
		TSSymbol             = { fg = newpaper.darkyellow }, -- For identifiers referring to symbols or atoms.
		TSType               = { fg = newpaper.darkgreen }, -- For types.
		TSTypeBuiltin        = { fg = newpaper.magenta }, -- For builtin types.
		TSTagDelimiter       = { fg = newpaper.navy, style = 'bold' }, -- Tag delimiter like `<` `>` `/`
		TSText               = { fg = newpaper.fg }, -- For strings considered text in a markup language.
		TSTextReference      = { fg = newpaper.yellow }, -- FIXME
		TSEmphasis           = { fg = newpaper.fg }, -- For text to be represented with emphasis.
		TSUnderline          = { fg = newpaper.fg, style = 'underline' }, -- For text to be represented with an underline.
		TSStrike             = { fg = newpaper.fg, style = 'italic'}, -- For strikethrough text.
		TSTitle              = { fg = newpaper.title, style = 'bold' }, -- Text that is part of a title.
		TSLiteral            = { fg = newpaper.fg, style = 'bold' }, -- Literal text.
		TSURI                = { fg = newpaper.link, style = 'underline' } -- Any URI like a link or email.
    }

	-- Options:

	-- TreeSitter Italic comments
	if vim.g.newpaper_italic_comments then
	    treesitter.TSComment = { fg = newpaper.comments , style = 'italic' } -- For comment blocks.
	else
	    treesitter.TSComment = { fg = newpaper.comments } -- For comment blocks.
	end

	-- TreeSitter Italic strings
	if vim.g.newpaper_italic_strings then
	    treesitter.TSString = { fg = newpaper.string, style = 'italic' } -- For strings.
	else
	    treesitter.TSString = { fg = newpaper.string } -- For strings.
	end

	-- TreeSitter Italic keywords
	if vim.g.newpaper_italic_keywords then
	    treesitter.TSConditional     = { fg = newpaper.keywords, style = 'italic' } -- For keywords related to conditionnals.
	    treesitter.TSKeyword         = { fg = newpaper.keywords, style = 'italic' } -- For keywords that don't fall in previous categories.
	    treesitter.TSRepeat          = { fg = newpaper.keywords, style = 'italic' } -- For keywords related to loops.
	    treesitter.TSKeywordFunction = { fg = newpaper.keywords, style = 'italic' } -- For keywords used to define a fuction.
		treesitter.TSTag             = { fg = newpaper.tags,     style = 'italic' } -- Tags like html tag names.
	elseif vim.g.newpaper_bold_keywords then
	-- TreeSitter bold keywords
	    treesitter.TSConditional     = { fg = newpaper.keywords, style = 'bold' } -- For keywords related to conditionnals.
	    treesitter.TSKeyword         = { fg = newpaper.keywords, style = 'bold' } -- For keywords that don't fall in previous categories.
	    treesitter.TSRepeat          = { fg = newpaper.keywords, style = 'bold' } -- For keywords related to loops.
	    treesitter.TSKeywordFunction = { fg = newpaper.keywords, style = 'bold' } -- For keywords used to define a fuction.
		treesitter.TSTag             = { fg = newpaper.tags,     style = 'bold' } -- Tags like html tag names.
	else
	    treesitter.TSConditional     = { fg = newpaper.keywords } -- For keywords related to conditionnals.
	    treesitter.TSKeyword         = { fg = newpaper.keywords } -- For keywords that don't fall in previous categories.
	    treesitter.TSRepeat          = { fg = newpaper.keywords } -- For keywords related to loops.
	    treesitter.TSKeywordFunction = { fg = newpaper.keywords } -- For keywords used to define a fuction.
		treesitter.TSTag             = { fg = newpaper.tags } -- Tags like html tag names.
	end

	-- TreeSitter Bold Tags
	if vim.g.newpaper_bold_tags then
		treesitter.TSTag = { fg = newpaper.tags, style = 'bold' } -- Tags like html tag names.
	else
		treesitter.TSTag = { fg = newpaper.tags } -- Tags like html tag names.
	end


	-- TreeSitter Italic functions
	if vim.g.newpaper_italic_functions then
	    treesitter.TSFunction    = { fg = newpaper.navy, style = 'italic' } -- For fuction (calls and definitions).
	    treesitter.TSMethod      = { fg = newpaper.navy, style = 'italic' } -- For method calls and definitions.
	    treesitter.TSFuncBuiltin = { fg = newpaper.navy, style = 'italic' } -- For builtin functions: `table.insert` in Lua.
	else
	    treesitter.TSFunction    = { fg = newpaper.navy } -- For fuction (calls and definitions).
	    treesitter.TSMethod      = { fg = newpaper.navy } -- For method calls and definitions.
	    treesitter.TSFuncBuiltin = { fg = newpaper.navy } -- For builtin functions: `table.insert` in Lua.
	end

	-- TreeSitter Italic variables
	if vim.g.newpaper_italic_variables then
	    treesitter.TSVariable        = { fg = newpaper.variable, style = 'italic' } -- Any variable name that does not have another highlight.
	    treesitter.TSVariableBuiltin = { fg = newpaper.olive, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
	else
	    treesitter.TSVariable        = { fg = newpaper.variable } -- Any variable name that does not have another highlight.
	    treesitter.TSVariableBuiltin = { fg = newpaper.olive } -- Variable names that are defined by the languages, like `this` or `self`.
	end

	return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError           = { fg = newpaper.error_fg }, -- "Error" diagnostic virtual text
		LspDiagnosticsSignError              = { fg = newpaper.error_fg }, -- "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError          = { fg = newpaper.error_fg }, -- "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError       = { fg = newpaper.error_fg }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError         = { style = 'undercurl', sp = newpaper.error_fg }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning         = { fg = newpaper.warn_fg }, -- "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning            = { fg = newpaper.warn_fg }, -- "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning        = { fg = newpaper.warn_fg }, -- "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning     = { fg = newpaper.warn_fg }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning       = { style = 'undercurl', sp = newpaper.warn_fg }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation     = { fg = newpaper.info_fg }, -- "Information" diagnostic virtual text
		LspDiagnosticsSignInformation        = { fg = newpaper.info_fg }, -- "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation    = { fg = newpaper.info_fg }, -- "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = newpaper.info_fg }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation   = { style = 'undercurl', sp = newpaper.info_fg }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint            = { fg = newpaper.hint_fg  }, -- "Hint" diagnostic virtual text
		LspDiagnosticsSignHint               = { fg = newpaper.hint_fg  }, -- "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint           = { fg = newpaper.hint_fg  }, -- "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint        = { fg = newpaper.hint_fg  }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint          = { style = 'undercurl', sp = newpaper.hint_fg }, -- used to underline  s "    Hint" diagnostics.
		LspReferenceText                     = { fg = newpaper.accent, bg = newpaper.highlight }, -- used for highlighting "text" references
		LspReferenceRead                     = { fg = newpaper.accent, bg = newpaper.highlight }, -- used for highlighting "read" references
		LspReferenceWrite                    = { fg = newpaper.accent, bg = newpaper.highlight }, -- used for highlighting "write" references
	}

	return lsp

end

theme.loadPlugins = function()
    -- Plugins highlight groups

	local plugins = {

		-- LspTrouble
		LspTroubleText                = { fg = newpaper.text },
		LspTroubleCount               = { fg = newpaper.purple, bg = newpaper.active },
		LspTroubleNormal              = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg },

		-- Nvim-Compe
		CompeDocumentation            = { fg = newpaper.text, bg = newpaper.contrast },
        CompeDocumentationBorder      = { fg = newpaper.border },

		-- Diff
		diffAdded                     = { fg = newpaper.git_added },
		diffRemoved                   = { fg = newpaper.git_removed },
		diffChanged                   = { fg = newpaper.git_modified },
		diffOldFile                   = { fg = newpaper.text },
		diffNewFile                   = { fg = newpaper.title },
		diffFile                      = { fg = newpaper.gray },
		diffLine                      = { fg = newpaper.blue },
		diffIndexLine                 = { fg = newpaper.purple },

		-- Neogit
		NeogitBranch                  = { fg = newpaper.blue },
		NeogitRemote                  = { fg = newpaper.purple },
		NeogitHunkHeader              = { fg = newpaper.fg,   bg = newpaper.highlight },
		NeogitHunkHeaderHighlight     = { fg = newpaper.fg,   bg = newpaper.contrast },
		NeogitDiffContextHighlight    = { fg = newpaper.text, bg = newpaper.contrast },
		NeogitDiffDeleteHighlight     = { fg = newpaper.git_removed },
		NeogitDiffAddHighlight        = { fg = newpaper.git_added },

		-- GitGutter
		GitGutterAdd                  = { fg = newpaper.git_added,    bg = newpaper.git_bg }, -- diff mode: Added line |diff.txt|
		GitGutterChange               = { fg = newpaper.git_modified, bg = newpaper.git_bg  }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete               = { fg = newpaper.git_removed,  bg = newpaper.git_bg }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd                   = { fg = newpaper.git_added,    bg = newpaper.git_bg }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr                 = { fg = newpaper.git_added,    bg = newpaper.git_bg }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn                 = { fg = newpaper.git_added,    bg = newpaper.git_bg }, -- diff mode: Added line |diff.txt|
		GitSignsChange                = { fg = newpaper.git_modified, bg = newpaper.git_bg }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr              = { fg = newpaper.git_modified, bg = newpaper.git_bg }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn              = { fg = newpaper.git_modified, bg = newpaper.git_bg }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete                = { fg = newpaper.git_removed,  bg = newpaper.git_bg }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr              = { fg = newpaper.git_removed,  bg = newpaper.git_bg }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn              = { fg = newpaper.git_removed,  bg = newpaper.git_bg }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
        TelescopeMultiSelection       = { fg = newpaper.selection },
		TelescopeNormal               = { fg = newpaper.fg, bg = newpaper.bg },
		TelescopePromptBorder         = { fg = newpaper.blue },
        TelescopePromptPrefix         = { fg = newpaper.blue },
		TelescopeResultsBorder        = { fg = newpaper.purple },
		TelescopePreviewBorder        = { fg = newpaper.green },
		TelescopeSelectionCaret       = { fg = newpaper.purple },
		TelescopeSelection            = { fg = newpaper.purple, bg = newpaper.active },
		TelescopeMatching             = { fg = newpaper.magenta, style = 'bold' },

		-- NvimTree
		NvimTreeRootFolder            = { fg = newpaper.title, style = 'italic' },
		NvimTreeFolderName            = { fg = newpaper.text },
		NvimTreeFolderIcon            = { fg = newpaper.accent },
		NvimTreeEmptyFolderName       = { fg = newpaper.disabled },
		NvimTreeOpenedFolderName      = { fg = newpaper.accent, style = 'italic' },
		NvimTreeIndentMarker          = { fg = newpaper.disabled },
		NvimTreeGitDirty              = { fg = newpaper.git_modified },
		NvimTreeGitNew                = { fg = newpaper.git_added },
		NvimTreeGitStaged             = { fg = newpaper.comments },
		NvimTreeGitDeleted            = { fg = newpaper.git_removed },
		NvimTreeOpenedFile            = { fg = newpaper.accent },
		NvimTreeImageFile             = { fg = newpaper.yellow },
		NvimTreeMarkdownFile          = { fg = newpaper.magenta },
		NvimTreeExecFile              = { fg = newpaper.darkgreen },
		NvimTreeSpecialFile           = { fg = newpaper.purple , style = 'underline' },
		LspDiagnosticsError           = { fg = newpaper.error_fg },
		LspDiagnosticsWarning         = { fg = newpaper.warn_fg },
		LspDiagnosticsInformation     = { fg = newpaper.info_fg },
		LspDiagnosticsHint            = { fg = newpaper.hint_fg },


		-- WhichKey
		WhichKey                      = { fg = newpaper.purple, style = 'bold'},
		WhichKeyGroup                 = { fg = newpaper.text },
		WhichKeyDesc                  = { fg = newpaper.teal, style = 'italic' },
		WhichKeySeperator             = { fg = newpaper.fg },
		WhichKeyFloating              = { fg = newpaper.float_fg, bg = newpaper.float_bg },
		WhichKeyFloat                 = { fg = newpaper.float_fg, bg = newpaper.float_bg },

		-- LspSaga
		LspFloatWinNormal             = { fg = newpaper.text },
		LspFloatWinBorder             = { fg = newpaper.border },
		LspSagaBorderTitle            = { fg = newpaper.orange },
		-- TargetWord                 same as Error
		ReferencesCount               = { fg = newpaper.navy },
		DefinitionCount               = { fg = newpaper.teal },
        TargetFileName                = { fg = newpaper.comments, style = 'underline'},
		ReferencesIcon                = { fg = newpaper.navy },
		DefinitionIcon                = { fg = newpaper.teal },
		ProviderTruncateLine          = { fg = newpaper.navy },
        SagaShadow                    = { fg = newpaper.gray },
		LspSagaFinderSelection        = { fg = newpaper.darkgreen },
		-- DiagnosticError            same as Error
		DiagnosticWarning             = { fg = newpaper.warn_fg },
		DiagnosticTruncateLine        = { fg = newpaper.info_fg },
		DiagnosticInformation         = { fg = newpaper.info_fg },
		DiagnosticHint                = { fg = newpaper.hint_fg },
		LspSagaDiagnosticBorder       = { fg = newpaper.border },
		LspSagaDiagnosticHeader       = { fg = newpaper.border },
		LspSagaDiagnosticTruncateLine = { fg = newpaper.border },
        LspDiagnosticsFloatingError   = { fg = newpaper.error_fg},
        LspDiagnosticsFloatingWarn    = { fg = newpaper.warn_fg },
        LspDiagnosticsFloatingInfor   = { fg = newpaper.info_fg },
        LspDiagnosticsFloatingHint    = { fg = newpaper.hint_fg },
		LspLinesDiagBorder            = { fg = newpaper.border },
		LspSagaShTruncateLine         = { fg = newpaper.teal },
		LspSagaDocTruncateLine        = { fg = newpaper.olive },
		LineDiagTruncateLine          = { fg = newpaper.purple },
		LspSagaHoverBorder            = { fg = newpaper.teal },
		LspSagaRenameBorder           = { fg = newpaper.green },
        LspSagaRenamePromptPrefix     = { fg = newpaper.olive },
		LspSagaDefPreviewBorder       = { fg = newpaper.aqua },
		LspSagaCodeActionTitle        = { fg = newpaper.orange, style = 'bold' },
		LspSagaCodeActionContent      = { fg = newpaper.olive, style = 'bold' },
		LspSagaCodeActionBorder       = { fg = newpaper.aqua },
		LspSagaCodeActionTruncateLine = { fg = newpaper.aqua },
		LspSagaSignatureHelpBorder    = { fg = newpaper.olive },
        LspSagaLspFinderBorder        = { fg = newpaper.blue },
		LspSagaAutoPreview            = { bg = newpaper.yellow },
		DefinitionPreviewTitle        = { fg = newpaper.darkgreen },

		-- BufferLine
		BufferLineIndicatorSelected   = { fg = newpaper.olive },
		BufferLineFill                = { bg = newpaper.bg },

		-- Sneak
		Sneak                         = { fg = newpaper.bg, bg = newpaper.accent },
		SneakScope                    = { bg = newpaper.selection },

		-- Indent Blankline
		IndentBlanklineChar           = { fg = newpaper.highlight },

		-- Nvim dap
		DapBreakpoint                 = { fg = newpaper.red },
		DapStopped                    = { fg = newpaper.darkgreen },

		-- Illuminate
		illuminatedWord               = { bg = newpaper.highlight },
		illuminatedCurWord            = { bg = newpaper.contrast },

		-- Hop
		HopNextKey                    = { fg = newpaper.accent, style = 'bold' },
		HopNextKey1                   = { fg = newpaper.purple, style = 'bold' },
		HopNextKey2                   = { fg = newpaper.blue },
		HopUnmatched                  = { fg = newpaper.comments },

		-- Fern
		FernBranchText                = { fg = newpaper.blue },

	}

    -- Options:

    -- Disable nvim-tree background
	if vim.g.newpaper_disable_background then
		plugins.NvimTreeNormal = { fg = newpaper.comments, bg = newpaper.none }
	else
		plugins.NvimTreeNormal = { fg = newpaper.sidebar_fg, bg = newpaper.sidebar_bg }
	end

    -- Use TreeSitter IndentBlanklineContextChar
    if not vim.g.indent_blankline_use_treesitter then
		plugins.IndentBlanklineContextChar = { fg = newpaper.comments }
    end

	return plugins

end

return theme
