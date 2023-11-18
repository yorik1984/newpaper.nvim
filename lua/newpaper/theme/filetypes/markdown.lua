local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local markdownSyn  = {}
    markdownSyn.colors = configColors
    markdownSyn.style  = configStyle
    local newpaper     = markdownSyn.colors
    local style        = markdownSyn.style

    markdownSyn.loadSyntax = function()
        local syntax = {
            markdownH1Delimiter         = { fg = newpaper.tex_part_title },
            markdownH2Delimiter         = { fg = newpaper.teal },
            markdownH3Delimiter         = { fg = newpaper.blue },
            markdownH4Delimiter         = { fg = newpaper.tex_math },
            markdownH5Delimiter         = { fg = newpaper.tex_lightpurple },
            markdownH6Delimiter         = { fg = newpaper.tex_darkorange },

            markdownH1                  = { fg = newpaper.tex_part_title, style = style.k_style },
            markdownH2                  = { fg = newpaper.teal,           style = style.k_style },
            markdownH3                  = { fg = newpaper.blue,           style = style.k_style },
            markdownH4                  = { fg = newpaper.tex_math,       style = style.k_style },
            markdownH5                  = { fg = newpaper.tex_lightpurple,style = style.k_style },
            markdownH6                  = { fg = newpaper.tex_darkorange, style = style.k_style },
            markdownHeadingRule         = { fg = newpaper.tex_part_title },
            markdownHeadingDelimiter    = { fg = newpaper.tex_darkorange },
            markdownBlockquote          = { fg = newpaper.keywords, style = style.k_style },
            markdownRule                = { fg = newpaper.teal },

            markdownFootnote            = { fg = newpaper.tex_maroon, style = style.b_links },
            markdownFootnoteDefinition  = { fg = newpaper.tex_maroon, style = style.k_style },

            markdownLinkText            = { fg = newpaper.tex_maroon },
            markdownIdDeclaration       = { fg = newpaper.tex_maroon, style = style.k_style },
            markdownId                  = { fg = newpaper.maroon },
            markdownAutomaticLink       = { fg = newpaper.links, style = style.links },
            markdownUrl                 = { fg = newpaper.tex_string, style = style.links },
            markdownUrlTitle            = { fg = newpaper.regexp_blue },
            markdownIdDelimiter         = { fg = newpaper.red },
            markdownLinkDelimiter       = { fg = newpaper.tex_redorange },
            markdownLinkTextDelimiter   = { fg = newpaper.tex_redorange },
            markdownListMarker          = { fg = newpaper.keywords },
            markdownOrderedListMarker   = { fg = newpaper.red },
            markdownUrlDelimiter        = { fg = newpaper.tag_navy, style = style.d_bold },
            markdownUrlTitleDelimiter   = { fg = newpaper.regexp_blue },

            markdownItalic              = { style = style.italic },
            markdownItalicDelimiter     = { fg = newpaper.tag_navy },
            markdownBold                = { style = style.bold },
            markdownBoldDelimiter       = { fg = newpaper.tag_navy, style = style.bold },
            markdownBoldItalic          = { style = style.bold_i },
            markdownBoldItalicDelimiter = { fg = newpaper.tag_navy, style = style.bold_i },
            markdownCodeDelimiter       = { fg = newpaper.regexp_blue },
            markdownCode                = { fg = newpaper.strings },

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

    markdownSyn.loadTreeSitter = function()

        local treesitter = {
            ["@none.markdown"]                  = { fg = newpaper.fg },
            ["@punctuation.special.markdown"]   = { fg = newpaper.tex_orange, style = style.d_style},
            ["@text.quote.bracket.markdown"]    = { fg = newpaper.tex_navy,  style = style.br_style },
            ["@text.todo.checked.markdown"]     = { fg = newpaper.todo_hint, style = style.b_bold },
            ["@text.todo.unchecked.markdown"]   = { fg = newpaper.comments },
            ["@text.underline.markdown"]        = { fg = newpaper.tex_string, style = style.underline },
            ["@text.underline.markdown_inline"] = { link = "@text.underline.markdown" },
            ["@lsp.type.class.markdown"]        = { default = true },
        }

        return treesitter
    end

    markdownSyn.loadPlugins = function()
        local plugins = {
            -- [n]vim-markdown
            -- mkdString        String
            mkdCode          = { fg = newpaper.strings },
            mkdCodeDelimiter = { fg = newpaper.regexp_blue },
            mkdCodeStart     = { fg = newpaper.regexp_blue },
            mkdCodeEnd       = { fg = newpaper.regexp_blue },
            mkdFootnote      = { fg = newpaper.grey },
            mkdBlockquote    = { fg = newpaper.tex_quotes, style = style.s_style },
            mkdListItem      = { fg = newpaper.keywords },
            mkdRule          = { fg = newpaper.darkpurple },
            mkdLineBreak     = { bg = newpaper.aqua },
            mkdFootnotes     = { fg = newpaper.links, style = style.k_style },
            mkdURL           = { fg = newpaper.tex_string, style = style.links },
            mkdLink          = { fg = newpaper.links, style = style.underline },
            mkdInlineURL     = { fg = newpaper.links, style = style.underline },
            mkdID            = { fg = newpaper.maroon},
            mkdLinkDef       = { fg = newpaper.tex_maroon, style = style.k_style },
            mkdLinkDefTarget = { fg = newpaper.links, style = style.links },
            mkdLinkTitle     = { fg = newpaper.regexp_blue },
            mkdDelimiter     = { fg = newpaper.persimona, style = style.d_style },

            -- vim-pandoc -----------------------------------------------------
            pandocOperator                       = { fg = newpaper.tex_redorange },
            pandocTitleBlock                     = { fg = newpaper.comments,  style = style.c_style },
            pandocTitleBlockTitle                = { fg = newpaper.comments,  style = style.c_title },
            pandocAtxHeader                      = { fg = newpaper.keywords,  style = style.o_style },
            pandocAtxStart                       = { fg = newpaper.keywords,  style = style.k_style },
            pandocSetexHeader                    = { fg = newpaper.keywords,  style = style.o_style },
            pandocHeaderAttr                     = { fg = newpaper.comments,  style = style.c_title },
            pandocHeaderID                       = { fg = newpaper.tex_aqua, style = style.c_style },

            pandocLaTexSectionCmd                = { fg = newpaper.keywords, style = style.tex_k_style },
            -- pandocLaTeXDelimiter                 texDelimiter

            -- pandocHTMLComment                    Comment
            pandocHTMLCommentStart               = { fg = newpaper.comments,    style = style.c_title },
            pandocHTMLCommentEnd                 = { fg = newpaper.comments,    style = style.c_title },
            pandocBlockQuote                     = { fg = newpaper.tex_quotes, style = style.s_style },
            pandocBlockQuoteMark                 = { fg = newpaper.tag_navy },
            pandocAmpersandEscape                = { fg = newpaper.tex_magenta },

            pandocCodeBlockInsideIndent          = { fg = newpaper.strings },

            pandocDelimitedCodeBlock             = { fg = newpaper.tex_verb },

            pandocDelimitedCodeBlockStart        = { fg = newpaper.regexp_blue, style = style.s_style },
            pandocDelimitedCodeBlockEnd          = { fg = newpaper.regexp_blue, style = style.s_style },
            pandocDelimitedCodeBlockLanguage     = { fg = newpaper.regexp_blue, style = style.k_style },
            pandocBlockQuoteinDelimitedCodeBlock = { fg = newpaper.tex_quotes,  style = style.s_style },
            pandocCodePre                        = { fg = newpaper.strings,     style = style.s_style },

            -- pandocLineBlockDelimiter             Delimiter

            pandocListItemBullet                 = { fg = newpaper.keywords },
            pandocUListItemBullet                = { fg = newpaper.keywords },
            pandocListItemBulletId               = { fg = newpaper.red },

            pandocReferenceLabel                 = { fg = newpaper.tex_maroon},
            pandocReferenceURL                   = { fg = newpaper.tex_string, style = style.links },
            pandocLinkTip                        = { fg = newpaper.regexp_blue },
            pandocImageIcon                      = { fg = newpaper.tag_navy },

            pandocReferenceDefinition            = { fg = newpaper.links, style = style.b_links },
            pandocReferenceDefinitionLabel       = { fg = newpaper.tex_magenta },
            pandocReferenceDefinitionAddress     = { fg = newpaper.links, style = style.underline },
            pandocReferenceDefinitionTip         = { fg = newpaper.tex_verb },

            pandocAutomaticLink                  = { fg = newpaper.links, style = style.links },

            pandocDefinitionBlockTerm            = { fg = newpaper.tex_verb, style = style.k_style },
            pandocDefinitionBlockMark            = { fg = newpaper.tex_orange },

            pandocSimpleTableDelims              = { fg = newpaper.tex_orange, style = style.d_style },
            -- pandocSimpleTableHeader              pandocStrong
            -- pandocTableMultilineHeader           pandocStrong
            pandocTableDelims                    = { fg = newpaper.tex_orange, style = style.d_style },
            pandocGridTableDelims                = { fg = newpaper.tex_orange, style = style.d_style },
            pandocGridTableHeader                = { fg = newpaper.tex_orange },
            pandocPipeTableDelims                = { fg = newpaper.tex_orange, style = style.d_style },
            pandocPipeTableHeader                = { fg = newpaper.tex_orange },
            -- pandocTableHeaderWord                pandocStrong

            pandocAbbreviationHead               = { fg = newpaper.regexp_blue, style = style.o_title },
            pandocAbbreviation                   = { fg = newpaper.ocean, style = style.k_style },
            pandocAbbreviationTail               = { fg = newpaper.regexp_blue, style = style.o_style },
            pandocAbbreviationSeparator          = { fg = newpaper.regexp_blue },
            pandocAbbreviationDefinition         = { fg = newpaper.comments, style = style.k_style },

            pandocFootnoteID                     = { fg = newpaper.tag_navy, style = style.b_links },
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

            pandocEmphasis                       = { style = style.italic },
            pandocStrong                         = { style = style.bold },
            pandocStrongEmphasis                 = { style = style.bold_i },
            pandocStrongInEmphasis               = { style = style.bold_i },
            pandocEmphasisInStrong               = { style = style.bold_i },
            pandocNoFormattedInEmphasis          = { style = style.italic },
            pandocNoFormattedInStrong            = { style = style.bold },

            pandocNoFormatted                    = { fg = newpaper.strings },
            pandocNoFormattedAttrs               = { fg = newpaper.comments },
            pandocSubscriptMark                  = { fg = newpaper.tex_pink },
            pandocSuperscriptMark                = { fg = newpaper.tex_pink },
            pandocStrikeoutMark                  = { fg = newpaper.tex_maroon },
            pandocSubscript                      = { style = style.underline },
            pandocSuperscript                    = { style = style.underline },
            pandocStrikeout                      = { style = style.underline },
            -- pandocNewLine                        Error
            -- pandocHRule                          Delimiter

            -- zotcite
            zoteroRefAnchor                      = { fg = newpaper.tex_magenta },
            zoteroCiteLocator                    = { fg = newpaper.tex_lightgreen, style = style.o_style },
            zoteroRefLabel                       = { fg = newpaper.tex_lightviolet },
            zoteroCiteKey                        = { fg = newpaper.tex_pink },
            -- zoteroHidden                         Comment
        }
        return plugins
    end

    -- stylua: ignore end

    return markdownSyn
end

return M
