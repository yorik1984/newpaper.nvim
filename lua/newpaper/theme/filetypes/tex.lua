local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local tex      = {}
    tex.colors     = configColors
    tex.style      = configStyle
    local newpaper = tex.colors
    local style    = tex.style

    tex.loadSyntax = function()
        local syntax = {
            -- Basic tex groups
            -- NOTE:some basic groups init in Vimtex part. See below

            -- texInputCurlies   texDelimiter
            -- texMathMatcher    texMath
            texAccent         = { fg = newpaper.tex_math },
            texBadMath        = { bg = newpaper.tex_math_error, sp = newpaper.tex_part_title, style = style.error },
            texBeginEnd       = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texBeginEndName   = { fg = newpaper.tex_darkorange },
            texCite           = { fg = newpaper.tex_lightviolet },
            texCmdArgs        = { fg = newpaper.tex_navy },
            texCmdName        = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texCursor         = { fg = newpaper.bg, bg = newpaper.tex_aqua },
            texDef            = { fg = newpaper.tex_blue },
            texDefCmd         = { fg = newpaper.tex_magenta },
            texDefName        = { fg = newpaper.tex_blue },
            texDelimiter      = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
            texDocType        = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            texDocTypeArgs    = { fg = newpaper.tex_navy },
            texGreek          = { fg = newpaper.tex_math },
            texInput          = { fg = newpaper.tex_blue },
            texInputFile      = { fg = newpaper.tex_navy },
            texInputFileOpt   = { fg = newpaper.tex_orange },
            texMath           = { fg = newpaper.tex_math },
            texMathDelimBad   = { bg = newpaper.tex_math_delim_error, sp = newpaper.tex_lightpurple, style = style.error },
            texMathDelimKey   = { fg = newpaper.tex_pink },
            texMathDelimSet1  = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
            texMathDelimSet2  = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
            texMathZoneV      = { fg = newpaper.tex_math, style = style.italic },
            texMathZoneW      = { fg = newpaper.tex_math },
            texMathZoneY      = { fg = newpaper.tex_math },
            texMathZoneZ      = { fg = newpaper.tex_math },
            texNewCmd         = { fg = newpaper.tex_magenta },
            texNewEnv         = { fg = newpaper.tex_magenta },
            texOnlyMath       = { bg = newpaper.tex_only_math_error, sp = newpaper.tex_olive, style = style.error },
            texOption         = { fg = newpaper.tex_orange },
            texRefZone        = { fg = newpaper.tex_lightgreen },
            texSection        = { fg = newpaper.tex_blue,    style = style.tex_m_style },
            texSpaceCode      = { fg = newpaper.tex_blue },
            texSpaceCodeChar  = { fg = newpaper.tex_maroon },
            texStatement      = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texStyleStatement = { fg = newpaper.tex_blue },
            texSubscript      = { fg = newpaper.tex_math },
            texSubscripts     = { fg = newpaper.tex_math },
            texSuperscript    = { fg = newpaper.tex_math },
            texSuperscripts   = { fg = newpaper.tex_math },
            texType           = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texTypeSize       = { fg = newpaper.tex_navy },
            texTypeStyle      = { fg = newpaper.tex_navy },

            -- bibUnescapedSpecial Error
            -- bibComment          Comment
            -- bibComment2         Comment
            -- bibComment3         Comment
            bibBrace          = { fg = newpaper.tex_teal },
            bibEntry          = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            bibEntryData      = { fg = newpaper.tex_pink },
            bibEntryKw        = { fg = newpaper.tex_blue, style = style.tex_k_style},
            bibField          = { fg = newpaper.tex_math, style = style.tex_o_style },
            bibKey            = { fg = newpaper.tex_darkorange },
            bibMath           = { fg = newpaper.tex_math },
            bibNSEntryKw      = { fg = newpaper.tex_keyword },
            bibParen          = { fg = newpaper.tex_math_delim },
            bibQuote          = { fg = newpaper.tex_string },
            bibType           = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            bibVariable       = { fg = newpaper.tex_orange, style = style.v_style },
        }
        return syntax
    end

    tex.loadTreeSitter = function()

        local treesitter = {
            ["@error.latex"]                  = { fg = newpaper.tex_red, bg = newpaper.errormsg_bg, style = style.error },
            ["@function.latex"]               = { fg = newpaper.tex_navy },
            ["@function.macro.latex"]         = { fg = newpaper.tex_magenta },
            ["@include.latex"]                = { fg = newpaper.tex_blue, style = style.tex_k_style },
            ["@namespace.latex"]              = { fg = newpaper.tex_blue, style = style.tex_m_style },
            ["@operator.latex"]               = { fg = newpaper.tex_math, style = style.tex_o_style },
            ["@parameter.latex"]              = { fg = newpaper.tex_orange, style = style.tex_a_style },
            ["@punctuation.bracket.latex"]    = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
            ["@punctuation.delimiter.latex"]  = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            ["@punctuation.special.latex"]    = { fg = newpaper.tex_string },
            ["@text.comment.latex"]           = { fg = newpaper.comments, style = style.c_style },
            ["@text.emphasis.latex"]          = { fg = newpaper.fg, style = style.italic },
            ["@text.environment.latex"]       = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            ["@text.environment.name.latex"]  = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
            ["@text.math.latex"]              = { fg = newpaper.tex_math },
            ["@text.reference.latex"]         = { fg = newpaper.tex_lightgreen },
            ["@text.string.latex"]            = { fg = newpaper.tex_string, style = style.tex_string },
            ["@text.strong.latex"]            = { fg = newpaper.fg, style = style.bold },
            ["@text.title.latex"]             = { fg = newpaper.tex_part_title, style = style.tex_m_style },
            ["@text.uri.latex"]               = { fg = newpaper.tex_navy, style = style.underline },
            ["@type.latex"]                   = { fg = newpaper.tex_blue, style = style.tex_k_style },

            ["@constant.bibtex"]              = { fg = newpaper.tex_math },
            ["@field.bibtex"]                 = { fg = newpaper.tex_blue },
            ["@function.builtin.bibtex"]      = { fg = newpaper.tex_maroon },
            ["@keyword.bibtex"]               = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            ["@number.bibtex"]                = { fg = newpaper.tex_pink },
            ["@operator.bibtex"]              = { fg = newpaper.tex_math, style = style.tex_o_style },
            ["@parameter.bibtex"]             = { fg = newpaper.tex_orange },
            ["@punctuation.bracket.bibtex"]   = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
            ["@punctuation.delimiter.bibtex"] = { fg = newpaper.tex_orange },
            ["@string.bibtex"]                = { fg = newpaper.tex_teal },
            ["@symbol.bibtex"]                = { fg = newpaper.tex_darkorange },
        }

        return treesitter
    end

    tex.loadPlugins = function()
        local plugins = {
            -- Vimtex groups
            -- NOTE:Some groups from tex basic syntax include this

            texCmdType            = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texParm               = { fg = newpaper.tex_maroon },
            texZone               = { fg = newpaper.fg },
            texSymbol             = { fg = newpaper.tex_maroon },
            -- texError             VimtexError

            -- texStyleBold          gui=bold                  cterm=bold
            -- texStyleItal          gui=italic                cterm=italic
            -- texStyleUnder         gui=underline             cterm=underline
            -- texStyleBoth          gui=bold,italic           cterm=bold,italic
            -- texStyleBoldUnder     gui=bold,underline        cterm=bold,underline
            -- texStyleItalUnder     gui=italic,underline      cterm=italic,underline
            -- texStyleBoldItalUnder gui=bold,italic,underline cterm=bold,italic,underline
            -- texMathStyleBold      gui=bold        cterm=bold
            -- texMathStyleItal      gui=italic      cterm=italic

            -------------------------------------------------------------------
            -- texComment          Comment
            texCommentTodo        = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.c_title },
            texDelim              = { fg = newpaper.tex_lightpurple, style = style.tex_br_style }, -- {, }, [, and ]
            texCmd                = { fg = newpaper.tex_blue, style = style.tex_k_style }, -- \CMD
            texOpt                = { fg = newpaper.tex_orange }, -- \cmd[OPT]
            texOptSep             = { fg = newpaper.tex_orange }, -- [a, b] (commas)
            texOptEqual           = { fg = newpaper.tex_navy, style = style.tex_o_style }, -- [a=b]
            texArg                = { fg = newpaper.tex_navy }, -- \cmd[...]{ARG}
            texSpecialChar        = { fg = newpaper.tex_maroon, style = style.tex_o_style }, -- \S, \P, \$, \;, ...
            texCmdInput           = { fg = newpaper.tex_blue, style = style.tex_k_style }, -- \INPUT \INCLUDE \INCLUDEONLY \INCLUDEGRAPHICS
            texCmdBib             = { fg = newpaper.tex_blue, style = style.tex_k_style }, -- \BIBLIOGRAPHY \BIBLIOGRAPHYSTYLE
            texCmdClass           = { fg = newpaper.tex_keyword, style = style.tex_m_style }, -- \DOCUMENTCLASS
            texCmdPackage         = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \USEPACKAGE \REQUIREPACKAGE
            -- texFileOpt           texOpt       \includegraphics[PACKAGE OPTIONS] \documentclass[CLASS OPTIONS]
            texFileArg            = { fg = newpaper.tex_navy }, -- \input{FILE} \include{FILE} \includegraphics[...]{FILE} \bibliographystyle{FILE} \documentclass[...]{CLASS}
            texFilesOpt           = { fg = newpaper.tex_orange }, -- \usepackage[PACKAGE OPTIONS] \RequirePackage[PACKAGE OPTIONS]
            texFilesArg           = { fg = newpaper.tex_blue }, -- \includeonly{FILE1, FILE2} \bibliography{FILE1, FILE2} \usepackage[...]{PACKAGE1, PACKAGE2} \RequirePackage[...]{PACKAGE1, PACKAGE2}
            texCmdTitle           = { fg = newpaper.tex_blue, style = style.tex_m_style }, -- \TITLE
            texTitleArg           = { fg = newpaper.tex_navy, style = style.tex_m_style }, -- \title{MAIN TITLE}
            texCmdAuthor          = { fg = newpaper.tex_keyword, style = style.tex_m_style }, -- \AUTHOR
            -- texAuthorOpt         texOpt       \author[OPT]
            texAuthorArg          = { fg = newpaper.tex_navy }, -- \author[...]{AUTHOR LIST}
            texCmdPart            = { fg = newpaper.tex_blue, style = style.tex_m_style }, -- \(SUB*)SECTION
            texPartArgTitle       = { fg = newpaper.tex_part_title, style = style.tex_m_style }, -- \(sub*)section{TITLE}
            texCmdEnv             = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \BEGIN; \END
            texEnvArgName         = { fg = newpaper.tex_darkorange, style = style.italic }, -- \begin{ENVNAME}
            texCmdRef             = { fg = newpaper.tex_lightgreen }, -- \CITE; \LABEL
            texRefArg             = { fg = newpaper.tex_aqua }, -- \cite{REFERENCE}; \label{REF}
            -- texE3Variable        texCmd          \G_MYFILE_NAME_STR
            -- texE3Constant        texE3Variable   \C_MYFILE_NAME_STR
            -- texE3Function        texCmdType      \STR_NEW:n
            -- texE3Type            texParm         \str_new:N
            -- texCmdParbox         texCmd          \PARBOX[p][h][i]{w}{c}
            -- texBoxOptPosVal      texSymbol       \parbox[P][h][i]{w}{c} \begin{minipage}[P][h][i]{w}
            -- texBoxOptIPosVal     texBoxOptPosVal \parbox[p][h][I]{w}{c} \begin{minipage}[p][h][I]{w}
            -------------------------------------------------------------------
            texMathZone           = { fg = newpaper.tex_math },
            -- texMathZoneLI            texMathZone       \( HERE \)
            -- texMathZoneLD            texMathZone       \[ HERE \]
            texMathZoneTI         = { fg = newpaper.tex_math, style = style.italic }, -- $ HERE $
            texMathZoneTD         = { fg = newpaper.tex_math }, -- $$ HERE $$
            texMathZoneEnv        = { fg = newpaper.tex_math }, -- \begin{menv}  HERE \end{menv}
            texMathZoneEnvStarred = { fg = newpaper.tex_math }, -- \begin{menv*} HERE \end{menv*}
            texMathZoneEnsured    = { fg = newpaper.tex_math, style = style.italic }, -- \ensuremath{HERE}
            texMathDelimZone      = { fg = newpaper.tex_olive, style = style.tex_md_style },
            -- texMathDelimZoneLI       texMathDelimZone  \(; \)
            -- texMathDelimZoneLD       texMathDelimZone  \[; \]
            -- texMathDelimZoneTI       texMathDelimZone  $
            -- texMathDelimZoneTD       texMathDelimZone  $$
            texCmdMathEnv         = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \BEGIN; \END
            -- (Only for math environments)
            texMathEnvArgName     = { fg = newpaper.tex_math_cmd, style = style.italic }, -- \begin{EQUATION}
            texCmdMath            = { fg = newpaper.tex_math_cmd, style = style.tex_m_style }, -- \ENSUREMATH
            texMathDelim          = { fg = newpaper.tex_math_delim }, -- \LVERT
            texMathDelimMod       = { fg = newpaper.tex_math_delim, style = style.tex_k_style }, -- \LEFT\lvert \RIGHT\rvert
            texMathOper           = { fg = newpaper.tex_olive, style = style.tex_o_style }, -- Basic operators: +-=/
            texMathSuperSub       = { fg = newpaper.tex_pink }, -- Sub and super operators (^, _)
            -------------------------------------------------------------------
            texLength             = { fg = newpaper.tex_red }, -- Length units, e.g. "4 cm". Only when contained e.g. in option groups.
            texLigature           = { fg = newpaper.tex_maroon, style = style.tex_o_style }, -- --; ---; ``; ''; ,,
            texCmdAccent          = { fg = newpaper.tex_navy, style = style.tex_k_style }, -- \"{a}
            texCmdLigature        = { fg = newpaper.tex_navy }, -- \ss; \ae
            texCmdSpaceCodeChar   = { fg = newpaper.tex_maroon }, -- Catcodes. For more info, see: https://en.wikibooks.org/wikicatcode
            texCmdTodo            = { fg = newpaper.todo_info, style = style.b_bold },-- \TODOSOMETHING
            -- texCmdWarning       VimtexWarning
            -- texCmdError         VimtexError
            -- texCmdFatal         VimtexFatal
            texCmdVerb            = { fg = newpaper.tex_verb, style = style.tex_m_style }, -- \VERB
            texVerbZoneInline     = { fg = newpaper.tex_verb }, -- \verb+VERB TEXT+
            texVerbZone           = { fg = newpaper.tex_verb }, -- \begin{verbatim} VERB TEXT \end{verbatim}
            -- texCmdDef           texCmdNew       \DEF
            texDefArgName         = { fg = newpaper.tex_navy }, -- \def\NAME
            texDefParm            = { fg = newpaper.tex_orange }, -- \def\name #1
            texCmdItem            = { fg = newpaper.tex_string }, -- \item

            -- Inherited groups -----------------------------------------------
            texGroupError         = { bg = newpaper.tex_group_error, sp = newpaper.tex_aqua, style = style.error }, texMinipageOptHeight  = { fg = newpaper.tex_red },
            texMinipageOptIPos    = { fg = newpaper.tex_redorange },
            texMinipageOptPos     = { fg = newpaper.tex_redorange },
            texMathError          = { bg = newpaper.tex_math_error, sp = newpaper.tex_part_title, style = style.error },
            texMathErrorDelim     = { bg = newpaper.tex_math_delim_error, sp = newpaper.tex_math_delim, style = style.error },
            texParboxOptHeight    = { fg = newpaper.tex_red },
            texParboxOptIPos      = { fg = newpaper.tex_orange },
            texParboxOptPos       = { fg = newpaper.tex_orange },
            -- texPartConcealed      texCmdPart
            -- texPartConcArgTitle   texPartArgTitle
            texArgNew             = { link = 'texArg' },
            -- texBibitemArg         texArg
            -- texBibitemOpt         texOpt
            -- texCmdBibitem         texCmd
            texCmdConditional     = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            -- texCmdConditionalINC  texCmdConditional
            -- texCmdEnvM            texCmdEnv
            -- texCmdE3              texCmd
            -- texCmdFootnote        texCmd
            texCmdGreek           = { fg = newpaper.tex_math, style = style.italic },
            -- texCmdLet             texCmdNew
            texCmdNew             = { fg = newpaper.tex_magenta, style = style.tex_k_style },
            -- texCmdNewcmd          texCmdNew
            texCmdNewenv          = { fg = newpaper.tex_magenta },
            texCmdNewthm          = { fg = newpaper.tex_magenta },
            -- texCmdNoSpell         texCmd
            texCmdRefConcealed    = { fg = newpaper.tex_lightgreen },
            texCmdSize            = { fg = newpaper.tex_navy },
            texCmdSpaceCode       = { fg = newpaper.tex_blue },
            texCmdStyle           = { fg = newpaper.tex_navy },
            texCmdStyleBold       = { fg = newpaper.tex_navy, style = style.bold },
            texCmdStyleBoldItal   = { fg = newpaper.tex_navy, style = style.bold_i },
            texCmdStyleItal       = { fg = newpaper.tex_navy, style = style.italic },
            texCmdStyleItalBold   = { fg = newpaper.tex_navy, style = style.bold_i },
            texCommentAcronym     = { fg = newpaper.comments, style = style.c_title },
            -- texCommentFalse       texComment
            texCommentURL         = { fg = newpaper.comments, style = style.c_underline },
            -- texConcealedArg       texArg
            -- texConcealedArgGroup  texConcealedArg
            -- texConditionalArg     texArg
            -- texConditionalINCChar texSymbol
            -- texE3Cmd              texCmd
            -- texE3Delim            texDelim
            -- texE3Opt              texOpt
            -- texE3Parm             texParm
            texEnvOpt             = { fg = newpaper.tex_redorange },
            texEnvMArgName        = { fg = newpaper.tex_math, style = style.italic },
            -- texLetArgEqual        texSymbol
            -- texLetArgName         texArgNew
            -- texMathArg            texMathZone
            -- texMathArrayArg       texOpt
            texMathCmd            = { fg = newpaper.tex_math_cmd },
            -- texMathCmdStyle       texMathCmd
            texMathCmdStyleBold   = { fg = newpaper.tex_math_cmd, style = style.bold },
            texMathCmdStyleItal   = { fg = newpaper.tex_math_cmd, style = style.italic },
            texMathCmdText        = { fg = newpaper.tex_navy },
            texMathTextConcArg    = { fg = newpaper.tex_pink },
            -- texMathGroup          texMathZone
            -- texMathStyleConcArg   texMathZone
            -- texMathSub            texMathZone
            -- texMathSuper          texMathZone
            texMathSymbol         = { fg = newpaper.tex_math_delim },
            -- texNewcmdArgName      texArgNew
            -- texNewcmdOpt          texOpt
            -- texNewcmdParm         texParm
            -- texNewenvArgName      texEnvArgName
            -- texNewenvParm         texParm
            -- texNewthmArgName      texArg
            -- texNewenvOpt          texOpt
            -- texNewthmOptCounter   texOpt
            -- texNewthmOptNumberby  texOpt
            -- texNoSpellOpt         texOpt
            -- texRefOpt             texOpt
            -- texRefConcealedOpt1   texRefOpt
            -- texRefConcealedOpt2   texRefOpt
            texRefConcealedArg    = { fg = newpaper.tex_lightviolet },
            texRefConcealedDelim  = { fg = newpaper.tex_lightviolet, style = style.tex_br_style },
            -- texRefConcealedPOpt1  texRefOpt
            -- texRefConcealedPOpt2  texRefOpt
            -- texRefConcealedPArg   texRefArg
            -- texRefConcealedPDelim texDelim
            -- texTabularArg         texOpt
            -- texTabularAtSep       texMathDelim
            texTabularChar        = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            texTabularCol         = { fg = newpaper.tex_blue },
            -- texTabularOpt         texEnvOpt
            texTabularVertline    = { fg = newpaper.tex_math,   style = style.tex_o_style },
            texTheoremEnvOpt      = { fg = newpaper.tex_string, style = style.s_style },

            -- no highlighting in syntax files ================================
            texCmdTabular         = { fg = newpaper.tex_teal, style = style.tex_k_style },
            texTabularLength      = { fg = newpaper.tex_red },
            -- texNewenvArgBegin
            -- texNewenvArgEnd
            texMinipageArgWidth   = { fg = newpaper.tex_navy },
            texParboxArgWidth     = { fg = newpaper.tex_red },
            texNewthmArgPrinted   = { fg = newpaper.tex_part_title },
            texMathTagArg         = { fg = newpaper.tex_aqua },
            -- texMathCmdEnv

            -- amsmath.vim ----------------------------------------------------
            -- texCmdDeclmathoper     texCmdNew
            -- texCmdNumberWithin     texCmd
            -- texCmdOpName           texCmd
            -- texCmdSubjClass        texCmd
            -- texCmdRefEq            texCmdRef
            -- texRefEqConcealedArg   texRefArg
            -- texRefEqConcealedDelim texDelim
            -- texDeclmathoperArgName texArgNew
            -- texDeclmathoperArgBody texMathZone
            texMathConcealedArg    = { fg = newpaper.tex_math },
            -- texNumberWithinArg1    texArg
            -- texNumberWithinArg2    texArg
            -- texOpnameArg           texMathZone
            -- texSubjClassArg        texArg
            -- texSubjClassOpt        texOpt

            -- amsthm.vim -----------------------------------------------------
            -- texCmdThmStyle texCmd
            texProofEnvOpt = { fg = newpaper.tex_string, style = style.s_style },
            -- texThmStyleArg texArg

            -- array.vim ------------------------------------------------------
            texTabularCmd        = { fg = newpaper.tex_teal, style = style.tex_k_style },
            -- texTabularCmdOpt     texOpt
            texTabularPostPre    = { fg = newpaper.tex_math, style = style.tex_o_style },
            -- texTabularMathdelim  texMathDelimZone

            texCmdNewcolumn      = { fg = newpaper.tex_magenta },
            texCmdNewcolumnName  = { fg = newpaper.tex_navy, style = style.tex_k_style },
            -- texNewcolumnArgName  texArg
            -- texNewcolumnOpt      texOpt
            -- texNewcolumnParm     texParm
            texTabularMulti      = { fg = newpaper.tex_red },

            -- asymptote.vim --------------------------------------------------
            texAsymptoteZone = { fg = newpaper.tex_verb },

            -- beamer.vim -----------------------------------------------------
            texCmdBeamer   = { fg = newpaper.tex_navy,        style = style.tex_m_style },
            texBeamerOpt   = { fg = newpaper.tex_orange,      style = style.tex_m_style },
            texBeamerDelim = { fg = newpaper.tex_lightpurple, style = style.tex_m_style },

            -- biblatex.vim ---------------------------------------------------
            -- texRefArgs texRefArg
            -- texRefOpts texRefOpt

            -- booktabs.vim ---------------------------------------------------
            texCmdBooktabs = { fg = newpaper.tex_math_delim, style = style.tex_k_style },

            -- chemformula.vim ------------------------------------------------
            texCmdCH       = { fg = newpaper.tex_ch_brown,  style = style.tex_k_style },
            texMathCmdCH   = { fg = newpaper.tex_ch_green,  style = style.tex_k_style },
            texCHOpt       = { fg = newpaper.tex_ch_orange, style = style.tex_k_style },
            texCHArg       = { fg = newpaper.tex_ch_blue,   style = style.tex_k_style },
            texCHSymb      = { fg = newpaper.tex_ch_red,    style = style.tex_k_style },
            texCHText      = { fg = newpaper.tex_verb,      style = style.tex_string },

            -- cleveref.vim ---------------------------------------------------
            --  texCRefArg           texRefArg
            --  texCRefOpt           texRefOpt
            --  texCRefRangeArg      texRefArg
            --  texCmdCRef           texCmdRef
            --  texCmdCRName         texCmd
            --  texCRNameArgType     texArgNew
            --  texCRNameArgSingular texArg
            --  texCRNameArgPlural   texCRNameArgSingular

            -- csquotes.vim ---------------------------------------------------
            texCmdQuote = { fg = newpaper.tex_quotes, style = style.tex_k_style },
            -- no highlighting in syntax files ================================
            texQuoteArg = { fg = newpaper.tex_navy },

            -- dot2tex.vim ----------------------------------------------------
            texDotZone = { fg = newpaper.tex_verb },

            -- fixme.vim ------------------------------------------------------
            -- texFixmeEnvBgn        texCmdTodo
            -- texFixmeTodoEnvBgn    texCmdTodo
            -- texFixmeTodoEnvEnd    texFixmeTodoEnvBgn
            -- texFixmeWarningEnvBgn texCmdWarning
            -- texFixmeWarningEnvEnd texFixmeWarningEnvBgn
            -- texFixmeErrorEnvBgn   texCmdError
            -- texFixmeErrorEnvEnd   texFixmeErrorEnvBgn
            -- texFixmeFatalEnvBgn   texCmdFatal
            -- texFixmeFatalEnvEnd   texFixmeFatalEnvBgn

            -- fontawesome5.vim ------------------------------------------------------
            -- texCmdFontawesome texCmd
            -- texFontawesomeArg texArg
            -- texFontawesomeOpt texOpt

            -- geometry.vim ---------------------------------------------------
            -- texCmdGeometry texCmd
            -- texGeometryArg texOpt

            -- glossaries.vim -------------------------------------------------
            -- texCmdAcr         texCmd
            -- texCmdNewAcr      texCmdNew
            -- texNewAcrOpt      texOpt
            texNewAcrArgLong  = { fg = newpaper.tex_string },
            texNewAcrArgLabel = { fg = newpaper.tex_navy },
            texAcrArgLabel    = { fg = newpaper.tex_navy },
            texGlsArg         = { fg = newpaper.tex_navy },
            texNewAcrArgAbbr  = { fg = newpaper.tex_math },

            -- gnuplottex.vim -------------------------------------------------
            texGnuplotZone = { fg = newpaper.tex_verb },

            -- hyperref.vim ---------------------------------------------------
            -- texCmdHyperref   texCmd
            texHrefArgLink   = { fg = newpaper.tex_navy, style = style.underline },
            -- texHrefArgTextC  texArg
            -- texHrefLinkGroup texHrefArgLink
            texUrlArg        = { fg = newpaper.tex_navy, style = style.underline },
            -- texTOPSArgPdf    texOpt

            -- ieeetrantools.vim ----------------------------------------------
            -- texMathEnvIEEEArg texArg
            -- texMathEnvIEEEOpt texOpt

            -- listings.vim ---------------------------------------------------
            texCmdLstset     = { fg = newpaper.tex_verb, style = style.tex_m_style },
            -- texLstDelim      texDelim
            -- texLstInlineOpt  texOpt
            texLstOpt        = { fg = newpaper.tex_redorange },
            texLstZone       = { fg = newpaper.tex_verb },
            -- texLstZoneInline texVerbZoneInline
            texLstsetArg     = { link = 'texArg' },

            -- luacode.vim ----------------------------------------------------
            texCmdLua = { fg = newpaper.lua_navy, style = style.tex_m_style  },
            -- no highlighting in syntax files ================================
            texLuaZone = { fg = newpaper.tex_verb },
            texLuaArg  = { fg = newpaper.tex_verb },

            -- mathtools.vim --------------------------------------------------
            texMathToolsOptPos1  = { link = 'texEnvOpt' },
            texMathToolsOptPos2  = { link = 'texEnvOpt' },
            texMathToolsOptWidth = { fg = newpaper.tex_pink },

            -- minted.vim -----------------------------------------------------
            texCmdMinted        = { fg = newpaper.tex_verb, style = style.tex_m_style },
            texCmdNewmint       = { fg = newpaper.tex_magenta },
            -- texMintedArg        texSymbol
            -- texMintedEnvArg     texSymbol
            -- texMintedEnvArgOpt  texOpt
            texMintedEnvOpt     = { fg = newpaper.tex_redorange },
            texMintedOpt        = { fg = newpaper.tex_redorange },
            texMintedZone       = { fg = newpaper.tex_verb },
            texMintedZoneInline = { fg = newpaper.tex_verb },
            -- texNewmintArgOpts   texOpt
            -- texNewmintArgX      texSymbol
            -- texNewmintArgY      texComment
            -- texNewmintOpt       texSymbol

            -- nameref.vim ----------------------------------------------------
            texCmdNameref = { fg = newpaper.tex_lightgreen },

            -- pgfplots.vim ---------------------------------------------------
            texCmdAxis        = { fg = newpaper.tex_tikz_purple },
            texPgfNode        = { fg = newpaper.tex_tikz_purple },
            texPgfType        = { fg = newpaper.tex_tikz_green},
            texPgfFunc        = { fg = newpaper.tex_tikz_verb },
            texPgfTableArg    = { fg = newpaper.tex_tikz_navy },
            texPgfCoordinates = { fg = newpaper.tex_tikz_orange },
            texPgfAddplotOpt  = { fg = newpaper.tex_tikz_orange },
            texPgfTableOpt    = { fg = newpaper.tex_tikz_orange },
            -- no highlighting in syntax files ================================
            texPgfGnuplotArg = { fg = newpaper.tex_tikz_navy },

            -- pythontex.vim --------------------------------------------------
            texCmdPythontex = { fg = newpaper.python_blue, style = style.tex_m_style },
            -- no highlighting in syntax files ================================
            texPythontexZone = { fg = newpaper.tex_verb },
            texPythontexArg  = { fg = newpaper.tex_verb },

            -- pyluatex.vim ---------------------------------------------------
            texCmdPyluatex = { fg = newpaper.python_blue, style = style.tex_m_style },

            -- siunitx.vim ----------------------------------------------------
            texCmdSI       = { fg = newpaper.tex_SI_purple, style = style.tex_k_style },
            texMathCmdSI   = { fg = newpaper.tex_SI_green, style = style.tex_k_style },
            texSICmd       = { fg = newpaper.tex_SI_green },
            texSIDelim     = { fg = newpaper.tex_SI_magenta },
            texSIOpt       = { fg = newpaper.tex_SI_orange },
            texSIOptU      = { fg = newpaper.tex_SI_yellow },
            -- texSIOptN      texSIOpt
            texSIOptNN     = { link = 'texSIOpt'},
            -- texSIOptNU     texSIOpt
            -- texSIOptNNU    texSIOpt
            texSIArgUnit   = { fg = newpaper.tex_SI_navy },
            texSIArgNum    = { fg = newpaper.tex_SI_red },
            -- texSIArgNumN   texSIArgNum
            -- texSIArgNumU   texSIArgNum
            -- texSIArgNumNU  texSIArgNum
            -- texSIArgNumNNU texSIArgNum

            -- tabularx.vim --------------------------------------------------
            -- texTabularxPreamble    texOpt
            -- texTabularxWidth       texLength
            -- texTabularxOpt         texEnvOpt

            -- tcolorbox.vim --------------------------------------------------
            texTCBZone = { fg = newpaper.tex_verb },
            -- texTCBEnvArg texArg

            -- tikz.vim -------------------------------------------------------
            texCmdTikz       = { fg = newpaper.tex_tikz_purple },
            texCmdTikzset    = { fg = newpaper.tex_tikz_purple },
            texTikzNodeOpt   = { fg = newpaper.tex_tikz_orange },
            texTikzSemicolon = { fg = newpaper.tex_tikz_purple },
            texTikzDraw      = { fg = newpaper.tex_tikz_purple },
            texTikzCycle     = { fg = newpaper.tex_tikz_green },
            texTikzsetArg    = { fg = newpaper.tex_tikz_navy },
            texTikzOpt       = { fg = newpaper.tex_tikz_orange },
            -- no highlighting in syntax files ================================
            texTikzZone      = { fg = newpaper.tex_tikz_verb },
            texTikzEnvBgn    = { fg = newpaper.tex_tikz_purple },

            -- todonotes.vim --------------------------------------------------
            texTodoOpt = { fg = newpaper.todo_info },

            -- vimtex highlights ------------------------------------------
            VimtexImapsArrow          = { fg = newpaper.tex_math, style = style.b_bold },
            VimtexImapsLhs            = { fg = newpaper.tex_keyword },
            VimtexImapsRhs            = { fg = newpaper.tex_string },
            VimtexImapsWrapper        = { fg = newpaper.tex_math },
            VimtexInfo                = { fg = newpaper.hint_fg, style = style.b_bold },
            VimtexInfoTitle           = { fg = newpaper.tex_keyword, style = style.b_bold },
            VimtexInfoKey             = { fg = newpaper.ocean },
            VimtexInfoValue           = { fg = newpaper.tex_string, style = style.s_style },
            -- VimtexInfoOther        ,
            VimtexMsg                 = { fg = newpaper.info_fg },
            VimtexSuccess             = { fg = newpaper.tex_math, style = style.b_bold },
            -- VimtexTocHelp          helpVim,
            VimtexTocHelpKey          = { fg = newpaper.tex_blue,    style = style.b_bold },
            VimtexTocHelpLayerOn      = { fg = newpaper.tex_keyword, style = style.b_bold },
            -- VimtexTocHelpLayerOff  Comment,
            VimtexTocHelpKeySeparator = { fg = newpaper.tex_orange },
            -- VimtexTocTodo          Todo,
            -- VimtexTocNum           Number,
            VimtexTocSec0             = { link = "texPartArgTitle" },
            VimtexTocSec1             = { fg = newpaper.tex_part_title },
            VimtexTocSec2             = { fg = newpaper.fg },
            VimtexTocSec3             = { fg = newpaper.fg, style= style.s_style },
            VimtexTocSec4             = { fg = newpaper.tex_verb },
            -- VimtexTocHotkey        Comment,
            VimtexTocLabelsSecs       = { fg = newpaper.tex_aqua, style= style.tex_m_style },
            VimtexTocLabelsEq         = { fg = newpaper.tex_math_delim },
            VimtexTocLabelsFig        = { fg = newpaper.tex_aqua },
            VimtexTocLabelsTab        = { fg = newpaper.tex_darkorange },
            VimtexTocIncl             = { fg = newpaper.tex_maroon },
            VimtexTocInclPath         = { fg = newpaper.tex_navy },
            VimtexWarning             = { fg = newpaper.warn_fg, style = style.b_bold },
            -- VimtexError            ErrorMsg,
            -- VimtexFatal            Error
            -- VimtexTodo             Todo
            -- VimtexPopupContent     PreProc
            -- VimtexPopupPrompt      Special
            -- VimtexPopupPromptInput Type
        }
        return plugins
    end

    -- stylua: ignore end

    return tex
end

return M
