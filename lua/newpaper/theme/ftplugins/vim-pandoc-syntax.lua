local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        pandocOperator                       = { fg = newpaper.tex_redorange },
        pandocTitleBlock                     = { fg = newpaper.comments, style = style.c_style },
        pandocTitleBlockTitle                = { fg = newpaper.comments, style = style.c_title },
        pandocAtxHeader                      = { fg = newpaper.keywords, style = style.o_style },
        pandocAtxStart                       = { fg = newpaper.keywords, style = style.k_style },
        pandocSetexHeader                    = { fg = newpaper.keywords, style = style.o_style },
        pandocHeaderAttr                     = { fg = newpaper.comments, style = style.c_title },
        pandocHeaderID                       = { fg = newpaper.tex_aqua, style = style.c_style },

        pandocLaTexSectionCmd                = { fg = newpaper.keywords, style = style.tex_k_style },
        -- pandocLaTeXDelimiter                 texDelimiter

        -- pandocHTMLComment                    Comment
        pandocHTMLCommentStart               = { fg = newpaper.comments, style = style.c_title },
        pandocHTMLCommentEnd                 = { fg = newpaper.comments, style = style.c_title },
        pandocBlockQuote                     = { fg = newpaper.tex_quotes, style = style.s_style },
        pandocBlockQuoteMark                 = { fg = newpaper.tag_navy },
        pandocAmpersandEscape                = { fg = newpaper.tex_magenta },

        pandocCodeBlockInsideIndent          = { fg = newpaper.strings },

        pandocDelimitedCodeBlock             = { fg = newpaper.tex_verb },

        pandocDelimitedCodeBlockStart        = { fg = newpaper.regexp_blue, style = style.s_style },
        pandocDelimitedCodeBlockEnd          = { fg = newpaper.regexp_blue, style = style.s_style },
        pandocDelimitedCodeBlockLanguage     = { fg = newpaper.regexp_blue, style = style.k_style },
        pandocBlockQuoteinDelimitedCodeBlock = { fg = newpaper.tex_quotes, style = style.s_style },
        pandocCodePre                        = { fg = newpaper.strings, style = style.s_style },

        -- pandocLineBlockDelimiter             Delimiter

        pandocListItemBullet                 = { fg = newpaper.keywords },
        pandocUListItemBullet                = { fg = newpaper.keywords },
        pandocListItemBulletId               = { fg = newpaper.red },

        pandocReferenceLabel                 = { fg = newpaper.tex_maroon },
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
    }
end

return M
