local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local tex      = {}
    tex.colors     = require("newpaper.colors").setup(config)
    tex.style      = require("newpaper.style").setup_style(config)
    local newpaper = tex.colors
    local style    = tex.style

-- LuaFormatter off

    tex.loadSyntax = function ()

        local syntax = {

            -- Basic tex groups
            -- NOTE:some basic groups init in Vimtex part. See below

            texCursor         = { fg = newpaper.bg, bg = newpaper.tex_aqua },
            texBadMath        = { bg = newpaper.tex_math_error, style = style.error },
            texMathDelimBad   = { bg = newpaper.tex_math_delim_error, style = style.error },
            texOnlyMath       = { bg = newpaper.tex_only_math_error, style = style.error },
            texCite           = { fg = newpaper.tex_lightviolet },
            texDefCmd         = { fg = newpaper.tex_magenta },
            texDefName        = { fg = newpaper.tex_blue },
            texDocType        = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            texDocTypeArgs    = { fg = newpaper.tex_navy },
            texInputFileOpt   = { fg = newpaper.tex_orange },
            -- texInputCurlies   texDelimiter
            texMathDelimSet1  = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            texMathDelimSet2  = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            texMathDelimKey   = { fg = newpaper.tex_pink },
            -- texMathMatcher    texMath
            texAccent         = { fg = newpaper.tex_math },
            texGreek          = { fg = newpaper.tex_math },
            texSuperscript    = { fg = newpaper.tex_math },
            texSubscript      = { fg = newpaper.tex_math },
            texSuperscripts   = { fg = newpaper.tex_math },
            texSubscripts     = { fg = newpaper.tex_math },
            texMathZoneV      = { fg = newpaper.tex_math, style = 'italic' },
            texMathZoneW      = { fg = newpaper.tex_math },
            texMathZoneY      = { fg = newpaper.tex_math },
            texMathZoneZ      = { fg = newpaper.tex_math },
            texBeginEnd       = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texBeginEndName   = { fg = newpaper.tex_darkorange },
            texSpaceCode      = { fg = newpaper.tex_blue },
            texStyleStatement = { fg = newpaper.tex_blue },
            texTypeSize       = { fg = newpaper.tex_navy },
            texTypeStyle      = { fg = newpaper.tex_navy },
            texCmdArgs        = { fg = newpaper.tex_navy },
            texCmdName        = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texDef            = { fg = newpaper.tex_blue },
            texDelimiter      = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            texInput          = { fg = newpaper.tex_blue },
            texInputFile      = { fg = newpaper.tex_navy },
            texMath           = { fg = newpaper.tex_math },
            texNewCmd         = { fg = newpaper.tex_magenta },
            texNewEnv         = { fg = newpaper.tex_magenta },
            texOption         = { fg = newpaper.tex_orange },
            texRefZone        = { fg = newpaper.tex_lightgreen },
            texSection        = { fg = newpaper.tex_blue,    style = style.tex_m_style },
            texSpaceCodeChar  = { fg = newpaper.tex_maroon },
            texStatement      = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texType           = { fg = newpaper.tex_keyword, style = style.tex_k_style },

            -- bibUnescapedSpecial Error
            -- bibComment          Comment
            -- bibComment2         Comment
            -- bibComment3         Comment
            bibNSEntryKw      = { fg = newpaper.tex_keyword },
            bibEntryData      = { fg = newpaper.tex_pink },
            bibVariable       = { fg = newpaper.tex_orange },
            bibEntryKw        = { fg = newpaper.tex_blue, style = style.tex_k_style},
            bibQuote          = { fg = newpaper.tex_string },
            bibParen          = { fg = newpaper.tex_math_delim },
            bibField          = { fg = newpaper.tex_math, style = style.tex_o_style },
            bibEntry          = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            bibBrace          = { fg = newpaper.tex_teal },
            bibType           = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            bibMath           = { fg = newpaper.tex_math },
            bibKey            = { fg = newpaper.tex_darkorange }

        }

        return syntax

    end

    tex.loadTreeSitter = function ()

        local treesitter = {

            -- Latex

            latexTSType            = { fg = newpaper.tex_blue, style = style.tex_k_style },
            latexTSTitle           = { fg = newpaper.tex_part_title, style = style.tex_m_style },
            latexTSMath            = { fg = newpaper.tex_math },
            latexTSPunctDelimiter  = { fg = newpaper.tex_lightpurple },
            latexTSOperator        = { fg = newpaper.tex_math, style = style.tex_o_style },
            latexTSFuncMacro       = { fg = newpaper.tex_magenta },
            latexTSFunction        = { fg = newpaper.tex_navy },
            latexTSPunctBracket    = { fg = newpaper.tex_lightpurple },
            latexTSPunctSpecial    = { fg = newpaper.tex_string },
            latexTSEnvironment     = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            latexTSEnvironmentName = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
            latexTSNamespace       = { fg = newpaper.tex_blue, style = style.tex_m_style },
            latexTSInclude         = { fg = newpaper.tex_blue, style = style.tex_k_style },
            latexTSParameter       = { fg = newpaper.tex_orange, style = style.tex_a_style },
            latexTSError           = { fg = newpaper.tex_red, bg = newpaper.errormsg_bg, style = style.error },
            latexTSTextReference   = { fg = newpaper.tex_lightgreen },
            latexTSEmphasis        = { fg = newpaper.fg, style = 'italic' },
            latexTSStrong          = { fg = newpaper.fg, style = 'bold' },
            latexTSString          = { fg = newpaper.tex_string, style = style.tex_string },
            latexTSURI             = { fg = newpaper.tex_navy, style = 'underline' },
            latexTSComment         = { fg = newpaper.comment, style = style.c_style },

            bibtexTSPunctDelimiter = { fg = newpaper.tex_orange },
            bibtexTSPunctBracket   = { fg = newpaper.tex_lightpurple },
            bibtexTSFuncBuiltin    = { fg = newpaper.tex_maroon },
            bibtexTSParameter      = { fg = newpaper.tex_orange },
            bibtexTSOperator       = { fg = newpaper.tex_math, style = style.tex_o_style },
            bibtexTSConstant       = { fg = newpaper.tex_math },
            bibtexTSKeyword        = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            bibtexTSSymbol         = { fg = newpaper.tex_darkorange },
            bibtexTSString         = { fg = newpaper.tex_teal },
            bibtexTSField          = { fg = newpaper.tex_blue },
            bibtexTSNumber         = { fg = newpaper.tex_pink }

        }

        return treesitter

    end

    tex.loadPlugins = function()

        local plugins = {

            -- Vimtex groups
            -- NOTE:Some groups from tex basic syntax include this

            -- Primitive TeX highlighting groups
            -- texError            Error
            -- texComment          Comment
            texCommentTodo         = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.comment_title },

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
            texCmdType            = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texParm               = { fg = newpaper.tex_maroon },
            texZone               = { fg = newpaper.fg },
            texSymbol             = { fg = newpaper.tex_maroon },
            -------------------------------------------------------------------
            texDelim              = { fg = newpaper.tex_lightpurple }, -- {, }, [, and ]
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
            texEnvArgName         = { fg = newpaper.tex_darkorange, style = 'italic' }, -- \begin{ENVNAME}
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
            texMathZone           = { fg = newpaper.tex_math }, -- \( HERE \); \[ HERE \]
            texMathZoneEnv        = { fg = newpaper.tex_math }, -- \begin{menv}  HERE \end{menv}
            texMathZoneEnvStarred = { fg = newpaper.tex_math }, -- \begin{menv*} HERE \end{menv*}
            texMathZoneX          = { fg = newpaper.tex_math, style = 'italic' }, -- $ HERE $
            texMathZoneXX         = { fg = newpaper.tex_math }, -- $$ HERE $$
            texMathZoneEnsured    = { fg = newpaper.tex_math, style = 'italic' }, -- \ensuremath{HERE}
            texCmdMathEnv         = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \BEGIN; \END (for math environments)
            texMathEnvArgName     = { fg = newpaper.tex_math, style = 'italic' }, -- \begin{EQUATION}
            texCmdMath            = { fg = newpaper.tex_math, style = style.tex_m_style }, -- \ENSUREMATH
            texMathDelim          = { fg = newpaper.tex_math_delim }, -- \LVERT
            texMathDelimMod       = { fg = newpaper.tex_math_delim, style = style.tex_k_style }, -- \LEFT\lvert \RIGHT\rvert
            texMathOper           = { fg = newpaper.tex_math, style = style.tex_o_style }, -- Basic operators: +-=/
            texMathSuperSub       = { fg = newpaper.tex_pink }, -- Sub and super operators (^, _)
            -------------------------------------------------------------------
            texLength             = { fg = newpaper.tex_red }, -- Length units, e.g. "4 cm". Only when contained e.g. in option groups.
            texLigature           = { fg = newpaper.tex_maroon, style = style.tex_o_style }, -- --; ---; ``; ''; ,,
            texCmdAccent          = { fg = newpaper.tex_navy }, -- \"{a}
            texCmdLigature        = { fg = newpaper.tex_blue }, -- \ss; \ae
            texCmdSpaceCodeChar   = { fg = newpaper.tex_maroon }, -- Catcodes. For more info, see: https://en.wikibooks.org/wikicatcode
            texCmdTodo            = { fg = newpaper.todo_warn, style = style.b_bold },-- \TODOSOMETHING
            texCmdVerb            = { fg = newpaper.tex_verb, style = style.tex_m_style }, -- \VERB
            texVerbZoneInline     = { fg = newpaper.tex_verb }, -- \verb+VERB TEXT+
            texVerbZone           = { fg = newpaper.tex_verb }, -- \begin{verbatim} VERB TEXT \end{verbatim}
            -- texCmdDef           texCmdNew       \DEF
            texDefArgName         = { fg = newpaper.tex_navy }, -- \def\NAME
            texDefParm            = { fg = newpaper.tex_orange }, -- \def\name #1
            texCmdItem            = { fg = newpaper.tex_string }, -- \item

            -- Inherited groups -----------------------------------------------
            texGroupError         = { bg = newpaper.tex_group_error, style = style.error },
            texMinipageOptHeight  = { fg = newpaper.tex_red },
            texMinipageOptIPos    = { fg = newpaper.tex_redorange },
            texMinipageOptPos     = { fg = newpaper.tex_redorange },
            texMathError          = { bg = newpaper.tex_math_error, style = style.error },
            texMathErrorDelim     = { bg = newpaper.tex_math_delim_error, style = style.error },
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
            texCmdGreek           = { fg = newpaper.tex_math, style = 'italic' },
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
            texCmdStyleBold       = { fg = newpaper.tex_navy, style = 'bold' },
            texCmdStyleBoldItal   = { fg = newpaper.tex_navy, style = 'bold,italic' },
            texCmdStyleItal       = { fg = newpaper.tex_navy, style = 'italic' },
            texCmdStyleItalBold   = { fg = newpaper.tex_navy, style = 'bold,italic' },
            texCommentAcronym     = { fg = newpaper.comment, style = style.comment_title },
            -- texCommentFalse       texComment
            texCommentURL         = { fg = newpaper.comment, style = style.c_style .. ',underline' },
            -- texConditionalArg     texArg
            -- texConditionalINCChar texSymbol
            -- texE3Cmd              texCmd
            -- texE3Delim            texDelim
            -- texE3Opt              texOpt
            -- texE3Parm             texParm
            texEnvOpt             = { fg = newpaper.tex_redorange },
            texEnvMArgName        = { fg = newpaper.tex_math, style = 'italic' },
            -- texLetArgEqual        texSymbol
            -- texLetArgName         texArgNew
            -- texMathArg            texMathZone
            -- texMathArrayArg       texOpt
            texMathCmd            = { fg = newpaper.tex_math },
            -- texMathCmdStyle       texMathCmd
            texMathCmdStyleBold   = { fg = newpaper.tex_math, style = 'bold' },
            texMathCmdStyleItal   = { fg = newpaper.tex_math, style = 'italic' },
            texMathCmdText        = { fg = newpaper.tex_navy },
            texMathDelimZone      = { fg = newpaper.tex_olive },
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
            texRefConcealedDelim  = { fg = newpaper.tex_lightviolet },
            -- texTabularArg         texOpt
            -- texTabularAtSep       texMathDelim
            texTabularChar        = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
            texTabularCol         = { fg = newpaper.tex_blue },
            -- texTabularOpt         texEnvOpt
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
            texTabularVertline   = { fg = newpaper.tex_math, style = style.tex_o_style },
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
            texCmdBeamer   = { fg = newpaper.tex_navy, style = style.tex_m_style },
            texBeamerOpt   = { fg = newpaper.tex_orange, style = style.tex_m_style },
            texBeamerDelim = { fg = newpaper.tex_lightpurple, style = style.tex_m_style },

            -- biblatex.vim ---------------------------------------------------
            -- texRefArgs texRefArg
            -- texRefOpts texRefOpt

            -- booktabs.vim ---------------------------------------------------
            texCmdBooktabs = { fg = newpaper.tex_math_delim, style = style.tex_k_style },

            -- chemformula.vim ------------------------------------------------
            texCmdCH       = { fg = newpaper.tex_ch_brown, style = style.tex_k_style },
            texMathCmdCH   = { fg = newpaper.tex_ch_green, style = style.tex_k_style },
            texCHOpt       = { fg = newpaper.tex_ch_orange, style = style.tex_k_style },
            texCHArg       = { fg = newpaper.tex_ch_blue, style = style.tex_k_style },
            texCHSymb      = { fg = newpaper.tex_ch_red, style = style.tex_k_style },
            texCHText      = { fg = newpaper.tex_verb, style = style.tex_string },

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

            -- geometry.vim ---------------------------------------------------
            --  texCmdGeometry texCmd
            --  texGeometryArg texOpt

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
            texHrefArgLink   = { fg = newpaper.tex_navy, style = 'underline' },
            -- texHrefArgTextC  texArg
            -- texHrefLinkGroup texHrefArgLink
            texUrlArg        = { fg = newpaper.tex_navy, style = 'underline' },

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
            texTodoOpt = { fg = newpaper.todo_warn }
        }

        return plugins

    end

    return tex

end

return M
