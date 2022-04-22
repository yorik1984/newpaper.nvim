local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local markdownSyn = {}
    markdownSyn.colors = require("newpaper.colors").setup(config)
    markdownSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper     = markdownSyn.colors
    local style        = markdownSyn.style

    -- LuaFormatter off

    markdownSyn.loadSyntax = function ()

        -- Markdown syntax highlight groups

        local syntax = {

            markdownH1Delimiter         = { fg = newpaper.purple },
            markdownH2Delimiter         = { fg = newpaper.teal },
            markdownH3Delimiter         = { fg = newpaper.darkengreen },
            markdownH4Delimiter         = { fg = newpaper.orange },
            markdownH5Delimiter         = { fg = newpaper.darkyellow },
            markdownH6Delimiter         = { fg = newpaper.blue },

            markdownH1                  = { fg = newpaper.purple,      style = style.k_style },
            markdownH2                  = { fg = newpaper.teal,        style = style.k_style },
            markdownH3                  = { fg = newpaper.darkengreen, style = style.k_style },
            markdownH4                  = { fg = newpaper.orange,      style = style.k_style },
            markdownH5                  = { fg = newpaper.darkyellow,  style = style.k_style },
            markdownH6                  = { fg = newpaper.blue,        style = style.k_style },
            markdownHeadingRule         = { fg = newpaper.purple },
            markdownHeadingDelimiter    = { fg = newpaper.orange },
            markdownBlockquote          = { fg = newpaper.tag_navy },
            markdownRule                = { fg = newpaper.teal },

            markdownFootnote            = { fg = newpaper.link, style = style.b_link },
            markdownFootnoteDefinition  = { fg = newpaper.link, style = style.k_style },

            markdownLinkText            = { fg = newpaper.link, style = 'underline' },
            markdownIdDeclaration       = { fg = newpaper.tex_maroon, style = style.k_style },
            markdownId                  = { fg = newpaper.maroon },
            markdownAutomaticLink       = { fg = newpaper.link, style = style.link },
            markdownUrl                 = { fg = newpaper.tex_string },
            markdownUrlTitle            = { fg = newpaper.regexp_blue },
            markdownIdDelimiter         = { fg = newpaper.red },
            markdownLinkDelimiter       = { fg = newpaper.orange },
            markdownLinkTextDelimiter   = { fg = newpaper.orange },
            markdownListMarker          = { fg = newpaper.keyword },
            markdownOrderedListMarker   = { fg = newpaper.red },
            markdownUrlDelimiter        = { fg = newpaper.tag_navy },
            markdownUrlTitleDelimiter   = { fg = newpaper.regexp_blue },

            markdownItalic              = { fg = newpaper.fg,       style = 'italic' },
            markdownItalicDelimiter     = { fg = newpaper.tag_navy },
            markdownBold                = { fg = newpaper.fg,       style = 'bold' },
            markdownBoldDelimiter       = { fg = newpaper.tag_navy, style = 'bold' },
            markdownBoldItalic          = { fg = newpaper.fg,       style = 'bold,italic' },
            markdownBoldItalicDelimiter = { fg = newpaper.tag_navy, style = 'bold,' },
            markdownCodeDelimiter       = { fg = newpaper.regexp_blue },
            markdownCode                = { fg = newpaper.string },

            markdownEscape              = { fg = newpaper.magenta },
            -- markdownError                 Error

            -- rmd syntax

            rmdInlineDelim              = { fg = newpaper.orange },
            rmdCodeDelim                = { fg = newpaper.regexp_blue },
            rmdYamlBlockDelim           = { fg = newpaper.orange },
            rmdYamlFieldTtl             = { fg = newpaper.orange },
        }

        return syntax

    end

            markdownSyn.loadTreeSitter = function ()

        -- Markdown treeSitter highlight syntax groups

        local treesitter = {

            markdownTSTitle          = { fg = newpaper.keyword, style = style.k_style },
            markdownTSEmphasis       = { fg = newpaper.fg,      style = 'italic' },
            markdownTSStrong         = { fg = newpaper.fg,      style = 'bold' },
            markdownTSTextReference  = { fg = newpaper.link,    style = 'underline' },
            markdownTSPunctSpecial   = { fg = newpaper.teal },
            markdownTSURI            = { fg = newpaper.tex_string },
            markdownTSLiteral        = { fg = newpaper.regexp_blue },
            markdownTSStringEscape   = { fg = newpaper.tex_magenta },
            markdownTSPunctDelimiter = { fg = newpaper.orange },
            markdownTSNone           = { fg = newpaper.fg },
        }

        return treesitter

    end

    markdownSyn.loadPlugins = function()

        -- Markdown special plugins highlight groups

        local plugins = {

            -- [n]vim-markdown

            -- mkdString        String
            mkdCode          = { fg = newpaper.string },
            mkdCodeDelimiter = { fg = newpaper.regexp_blue },
            mkdCodeStart     = { fg = newpaper.regexp_blue },
            mkdCodeEnd       = { fg = newpaper.regexp_blue },
            mkdFootnote      = { fg = newpaper.grey },
            mkdBlockquote    = { fg = newpaper.tex_quotes, style = style.s_style },
            mkdListItem      = { fg = newpaper.keyword },
            mkdRule          = { fg = newpaper.darkpurple },
            mkdLineBreak     = { bg = newpaper.aqua },
            mkdFootnotes     = { fg = newpaper.link, style = style.k_style },
            mkdURL           = { fg = newpaper.tex_string },
            mkdLink          = { fg = newpaper.link,style = 'underline' },
            mkdInlineURL     = { fg = newpaper.link, style = 'underline' },
            mkdID            = { fg = newpaper.maroon},
            mkdLinkDef       = { fg = newpaper.tex_maroon, style = style.k_style },
            mkdLinkDefTarget = { fg = newpaper.teal, style = 'underline' },
            mkdLinkTitle     = { fg = newpaper.regexp_blue },
            mkdDelimiter     = { fg = newpaper.orange },

            -- vim-pandoc

            -- pandocOperator                       Operator
            pandocTitleBlock                     = { fg = newpaper.comment, style = style.c_style },
            pandocTitleBlockTitle                = { fg = newpaper.comment, style = style.comment_title },
            -- pandocAtxHeader                      Title
            pandocAtxStart                       = { fg = newpaper.keyword,  style = style.k_style },
            -- pandocSetexHeader                    Title
            pandocHeaderAttr                     = { fg = newpaper.comment,  style = style.comment_title },
            pandocHeaderID                       = { fg = newpaper.tex_aqua, style = style.c_style },

            pandocLaTexSectionCmd                = { fg = newpaper.tex_keyword, style = style.tex_k_style },
            -- pandocLaTeXDelimiter                 texDelimiter

            -- pandocHTMLComment                    Comment
            pandocHTMLCommentStart               = { fg = newpaper.comment,    style = style.comment_title },
            pandocHTMLCommentEnd                 = { fg = newpaper.comment,    style = style.comment_title },
            pandocBlockQuote                     = { fg = newpaper.tex_quotes, style = style.s_style },
            pandocBlockQuoteMark                 = { fg = newpaper.tag_navy },
            pandocAmpersandEscape                = { fg = newpaper.tex_magenta },

            pandocCodeBlockInsideIndent          = { fg = newpaper.string },

            pandocDelimitedCodeBlock             = { fg = newpaper.string },

            pandocDelimitedCodeBlockStart        = { fg = newpaper.regexp_blue, style = style.s_style },
            pandocDelimitedCodeBlockEnd          = { fg = newpaper.regexp_blue, style = style.s_style },
            pandocDelimitedCodeBlockLanguage     = { fg = newpaper.regexp_blue, style = style.s_style },
            pandocBlockQuoteinDelimitedCodeBlock = { fg = newpaper.tex_quotes,  style = style.s_style },
            pandocCodePre                        = { fg = newpaper.string,      style = style.s_style },

            -- pandocLineBlockDelimiter             Delimiter

            pandocListItemBullet                 = { fg = newpaper.keyword },
            pandocUListItemBullet                = { fg = newpaper.keyword },
            pandocListItemBulletId               = { fg = newpaper.red },

            pandocReferenceLabel                 = { fg = newpaper.tex_maroon},
            pandocReferenceURL                   = { fg = newpaper.tex_string },
            pandocLinkTip                        = { fg = newpaper.regexp_blue },
            pandocImageIcon                      = { fg = newpaper.tag_navy },

            pandocReferenceDefinition            = { fg = newpaper.link, style = style.b_link },
            pandocReferenceDefinitionLabel       = { fg = newpaper.tex_magenta },
            pandocReferenceDefinitionAddress     = { fg = newpaper.link, style = 'underline' },
            pandocReferenceDefinitionTip         = { fg = newpaper.tex_verb },

            pandocAutomaticLink                  = { fg = newpaper.link, style = style.link },

            pandocDefinitionBlockTerm            = { fg = newpaper.tex_verb, style = style.k_style },
            pandocDefinitionBlockMark            = { fg = newpaper.tex_orange },

            pandocSimpleTableDelims              = { fg = newpaper.tex_orange },
            -- pandocSimpleTableHeader              pandocStrong
            -- pandocTableMultilineHeader           pandocStrong
            pandocTableDelims                    = { fg = newpaper.tex_orange },
            pandocGridTableDelims                = { fg = newpaper.tex_orange },
            pandocGridTableHeader                = { fg = newpaper.tex_orange },
            pandocPipeTableDelims                = { fg = newpaper.tex_orange },
            pandocPipeTableHeader                = { fg = newpaper.tex_orange },
            -- pandocTableHeaderWord                pandocStrong

            pandocAbbreviationHead               = { fg = newpaper.regexp_blue, style = style.o_title },
            pandocAbbreviation                   = { fg = newpaper.ocean, style = style.k_style },
            pandocAbbreviationTail               = { fg = newpaper.regexp_blue, style = style.o_style },
            pandocAbbreviationSeparator          = { fg = newpaper.regexp_blue },
            pandocAbbreviationDefinition         = { fg = newpaper.comment, style = style.k_style },

            pandocFootnoteID                     = { fg = newpaper.tag_navy, style = style.b_link },
            pandocFootnoteIDHead                 = { fg = newpaper.orange },
            pandocFootnoteIDTail                 = { fg = newpaper.orange },
            pandocFootnoteDef                    = { fg = newpaper.tex_tikz_verb, style = style.c_style },
            pandocFootnoteDefHead                = { fg = newpaper.orange },
            pandocFootnoteDefTail                = { fg = newpaper.orange },
            pandocFootnoteBlock                  = { fg = newpaper.tex_tikz_verb },
            -- pandocFootnoteBlockSeparator         Operator

            pandocPCite                          = { fg = newpaper.tex_lightgreen, style = style.o_style },
            pandocICite                          = { fg = newpaper.tex_lightgreen, style = style.o_style },
            pandocCiteKey                        = { fg = newpaper.tex_lightviolet },
            pandocCiteAnchor                     = { fg = newpaper.tex_magenta },
            pandocCiteLocator                    = { fg = newpaper.tex_lightgreen, style = style.o_style },

            pandocEmphasis                       = { fg = newpaper.fg, style = 'italic' },
            pandocStrong                         = { fg = newpaper.fg, style = 'bold' },
            pandocStrongEmphasis                 = { fg = newpaper.fg, style = 'bold,italic' },
            pandocStrongInEmphasis               = { fg = newpaper.fg, style = 'bold,italic' },
            pandocEmphasisInStrong               = { fg = newpaper.fg, style = 'bold,italic' },
            pandocNoFormattedInEmphasis          = { style = 'italic' },
            pandocNoFormattedInStrong            = { style = 'bold' },

            pandocNoFormatted                    = { fg = newpaper.string },
            pandocNoFormattedAttrs               = { fg = newpaper.comment },
            pandocSubscriptMark                  = { fg = newpaper.tex_pink },
            pandocSuperscriptMark                = { fg = newpaper.tex_pink },
            pandocStrikeoutMark                  = { fg = newpaper.tex_maroon },
            pandocSubscript                      = { style = 'underline' },
            pandocSuperscript                    = { style = 'underline' },
            pandocStrikeout                      = { style = 'underline' },
            -- pandocNewLine                        Error
            -- pandocHRule                          Delimiter
        }

        return plugins
        -- LuaFormatter on

    end

    return markdownSyn

end

return M
