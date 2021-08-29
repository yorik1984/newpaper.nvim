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

        -- Syntax highlight groups

        local syntax = {

            -- TeX

            -- Basic tex groups
            -- NOTE:some basic groups init in Vimtex part. See below

            texBadMath        = { bg = newpaper.tex_math_error },
            texMathDelimBad   = { bg = newpaper.tex_math_delim_error },
            texOnlyMath       = { bg = newpaper.tex_only_math_error },
            texCite           = { fg = newpaper.tex_lightviolet },
            texDefCmd         = { fg = newpaper.tex_magenta },
            texDefName        = { fg = newpaper.tex_blue },
            texDocType        = { fg = newpaper.tex_keyword, style = style.tex_m_style },
            texDocTypeArgs    = { fg = newpaper.tex_navy },
            texInputFileOpt   = { fg = newpaper.tex_orange },
            -- texInputCurlies   texDelimiter
            texMathDelimSet1  = { fg = newpaper.tex_lightpurple },
            texMathDelimSet2  = { fg = newpaper.tex_lightpurple },
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
            texDelimiter      = { fg = newpaper.tex_lightpurple },
            texInput          = { fg = newpaper.tex_blue },
            texInputFile      = { fg = newpaper.tex_navy },
            texMath           = { fg = newpaper.tex_math },
            texNewCmd         = { fg = newpaper.tex_magenta },
            texNewEnv         = { fg = newpaper.tex_magenta },
            texOption         = { fg = newpaper.tex_orange },
            texRefZone        = { fg = newpaper.tex_lightgreen },
            texSection        = { fg = newpaper.tex_blue, style = style.tex_m_style },
            texSpaceCodeChar  = { fg = newpaper.tex_maroon },
            texStatement      = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texType           = { fg = newpaper.tex_keyword, style = style.tex_k_style },

        }

        return syntax

    end

    tex.loadTreeSitter = function ()

        -- Tex treeSitter highlight syntax groups

        local treesitter = {

            -- Latex

            latexTSType            = { fg = newpaper.tex_blue, style = style.tex_k_style },
            latexTSTitle           = { fg = newpaper.tex_olive, style = style.tex_m_style },
            latexTSMath            = { fg = newpaper.tex_math },
            latexTSPunctDelimiter  = { fg = newpaper.tex_lightpurple },
            latexTSOperator        = { fg = newpaper.tex_math, style = style.tex_o_style },
            latexTSFuncMacro       = { fg = newpaper.tex_math },
            latexTSPunctBracket    = { fg = newpaper.tex_lightpurple },
            latexTSEnvironment     = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            latexTSEnvironmentName = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
            latexTSInclude         = { fg = newpaper.tex_blue, style = style.tex_k_style },
            latexTSParameter       = { fg = newpaper.tex_orange, style = style.tex_a_style },
            latexTSError           = { fg = newpaper.tex_red, bg = newpaper.pink },
            latexTSTextReference   = { fg = newpaper.tex_lightgreen },
            latexTSEmphasis        = { fg = newpaper.fg, style = 'italic' },
            latexTSStrong          = { fg = newpaper.fg, style = 'bold' },
            latexTSURI             = { fg = newpaper.tex_navy, style= 'underline' },
            latexTSComment         = { fg = newpaper.comment, style = style.c_style }
        }

        return treesitter

    end

    tex.loadPlugins = function()

        -- Tex special plugins highlight groups

        local plugins = {

            -- Vimtex groups
            -- NOTE:Some groups from tex basic syntax include this

            -- Primitive TeX highlighting groups
            -- texError            Error
            -- texComment          Comment
            -- texCommentTodo      Todo

            -- texStyleBold        gui=bold        cterm=bold
            -- texStyleBoth        gui=bold,italic cterm=bold,italic
            -- texStyleItal        gui=italic      cterm=italic
            -- texMathStyleBold    gui=bold        cterm=bold
            -- texMathStyleItal    gui=italic      cterm=italic
            -----------------------------------------------------------------------
            texCmdType            = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            texParm               = { fg = newpaper.tex_maroon },
            texZone               = { fg = newpaper.fg },
            texSymbol             = { fg = newpaper.tex_maroon },
            -----------------------------------------------------------------------
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
            texTitleArg           = { fg = newpaper.tex_navy, style = 'underline' }, -- \title{MAIN TITLE}
            texCmdAuthor          = { fg = newpaper.tex_keyword, style = style.tex_m_style }, -- \AUTHOR
            -- texAuthorOpt         texOpt       \author[OPT]
            texAuthorArg          = { fg = newpaper.tex_navy }, -- \author[...]{AUTHOR LIST}
            texCmdPart            = { fg = newpaper.tex_blue, style = style.tex_m_style }, -- \(SUB*)SECTION
            texPartArgTitle       = { fg = newpaper.tex_olive, style = style.tex_m_style }, -- \(sub*)section{TITLE}
            texCmdEnv             = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \BEGIN; \END
            texEnvArgName         = { fg = newpaper.tex_darkorange, style = 'italic' }, -- \begin{ENVNAME}
            texCmdRef             = { fg = newpaper.tex_aqua }, -- \CITE; \LABEL
            texRefArg             = { fg = newpaper.tex_lightgreen }, -- \cite{REFERENCE}; \label{REF}
            -- texE3Func            texCmdType   \STR_NEW:N
            -- texE3Var             texCmd       \G_MYFILE_NAME_STR
            -- texCmdParbox         texCmd       \PARBOX[p][h][i]{w}{c}
            -- texBoxOptPosVal      texSymbol    \parbox[P][h][i]{w}{c} \begin{minipage}[P][h][i]{w}
            -- texBoxOptIPosVal     texBoxOptPosVal \parbox[p][h][I]{w}{c} \begin{minipage}[p][h][I]{w}
            -----------------------------------------------------------------------
            texMathZone           = { fg = newpaper.tex_math }, -- \( HERE \); \[ HERE \]
            texMathZoneEnv        = { fg = newpaper.tex_math }, -- \begin{menv}  HERE \end{menv}
            texMathZoneEnvStarred = { fg = newpaper.tex_math }, -- \begin{menv*} HERE \end{menv*}
            texMathZoneX          = { fg = newpaper.tex_math, style = 'italic' }, -- $ HERE $
            texMathZoneXX         = { fg = newpaper.tex_math }, -- $$ HERE $$
            texMathZoneEnsured    = { fg = newpaper.tex_math, style = 'italic' }, -- \ensuremath{HERE}
            texCmdMathEnv         = { fg = newpaper.tex_keyword, style = style.tex_k_style }, -- \BEGIN; \END (for math environments)
            texMathEnvArgName     = { fg = newpaper.tex_darkorange, style = 'italic' }, -- \begin{EQUATION}
            texCmdMath            = { fg = newpaper.tex_blue }, -- \ENSUREMATH
            texMathDelim          = { fg = newpaper.tex_lightpurple }, -- \LVERT
            texMathDelimMod       = { fg = newpaper.tex_lightpurple }, -- \LEFT\lvert \RIGHT\rvert
            texMathOper           = { fg = newpaper.tex_math, style = style.tex_o_style }, -- Basic operators: +-=/
            texMathSuperSub       = { fg = newpaper.tex_pink }, -- Sub and super operators (^, _)
            -----------------------------------------------------------------------
            texLength             = { fg = newpaper.tex_red }, -- Length units, e.g. "4 cm". Only when contained e.g. in option groups.
            texLigature           = { fg = newpaper.tex_maroon, style = style.tex_o_style }, -- --; ---; ``; ''; ,,
            texCmdAccent          = { fg = newpaper.tex_navy }, -- \"{a}
            texCmdLigature        = { fg = newpaper.tex_blue }, -- \ss; \ae
            texCmdSpaceCodeChar   = { fg = newpaper.tex_maroon }, -- Catcodes. For more info, see: https://en.wikibooks.org/wikicatcode
            -- texCmdTodo           Todo            \TODOSOMETHING
            texCmdVerb            = { fg = newpaper.fg, style = style.tex_m_style }, -- \VERB
            texVerbZoneInline     = { fg = newpaper.tex_verb }, -- \verb+VERB TEXT+
            texVerbZone           = { fg = newpaper.tex_verb }, -- \begin{verbatim} VERB TEXT \end{verbatim}
            -- texCmdDef           texCmdNew       \DEF
            texDefArgName         = { fg = newpaper.tex_blue }, -- \def\NAME
            texDefParm            = { fg = newpaper.tex_orange }, -- \def\name #1
            texCmdItem            = { fg = newpaper.tex_blue }, -- \item
            -----------------------------------------------------------------------
            -- Inherited groups
            texGroupError         = { bg = newpaper.tex_group_error },
            texMinipageOptHeight  = { bg = newpaper.tex_minipage_error },
            texMinipageOptIPos    = { bg = newpaper.tex_minipage_error },
            texMinipageOptPos     = { bg = newpaper.tex_minipage_error },
            texMathError          = { bg = newpaper.tex_math_error },
            texMathErrorDelim     = { bg = newpaper.tex_math_delim_error },
            texParboxOptHeight    = { bg = newpaper.tex_parbox_opt_error },
            texParboxOptIPos      = { bg = newpaper.tex_parbox_opt_error },
            texParboxOptPos       = { bg = newpaper.tex_parbox_opt_error },
            texArgNew             = { fg = newpaper.tex_navy },
            -- texBibitemArg         texArg
            -- texBibitemOpt         texOpt
            -- texCmdBibitem         texCmd
            -- texCmdConditional     texCmd
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
            -- texCommentAcronym     texComment
            texCommentURL         = { fg = newpaper.comment, style = style.c_style .. ',underline' },
            -- texConditionalArg     texArg
            -- texConditionalINCChar texSymbol
            -- texE3Cmd              texCmd
            -- texE3Delim            texDelim
            -- texE3Opt              texOpt
            -- texE3Parm             texParm
            -- texEnvOpt             texOpt
            -- texEnvMArgName        texEnvArgName
            -- texLetArgEqual        texSymbol
            -- texLetArgName         texArgNew
            -- texMathArg            texMathZone
            -- texMathArrayArg       texOpt
            texMathCmd            = { fg = newpaper.tex_math },
            -- texMathCmdStyle       texMathCmd
            texMathCmdStyleBold   = { fg = newpaper.tex_math, style = style.tex_k_style },
            texMathCmdStyleItal   = { fg = newpaper.tex_math, style = 'italic' },
            texMathCmdText        = { fg = newpaper.tex_green },
            texMathDelimZone      = { fg = newpaper.tex_olive },
            texMathTextConcArg    = { fg = newpaper.tex_pink },
            -- texMathGroup          texMathZone
            -- texMathStyleConcArg   texMathZone
            -- texMathSub            texMathZone
            -- texMathSuper          texMathZone
            texMathSymbol         = { fg = newpaper.tex_math },
            -- texNewcmdArgName      texArgNew
            -- texNewcmdOpt          texOpt
            -- texNewcmdParm         texParm
            -- texNewenvArgName      texEnvArgName
            -- texNewenvParm         texParm
            -- texNewthmArgName      texArg
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
            texTabularChar        = { fg = newpaper.tex_lightpurple },
            texTabularCol         = { fg = newpaper.tex_lightpurple },
            -- texTabularOpt         texEnvOpt
            -- texTheoremEnvOpt      texEnvOpt
        }

        return plugins

    end

    return tex

end

return M
