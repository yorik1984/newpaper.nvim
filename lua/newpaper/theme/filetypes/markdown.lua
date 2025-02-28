local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        markdownH1Delimiter         = { fg = newpaper.tex_part_title },
        markdownH2Delimiter         = { fg = newpaper.teal },
        markdownH3Delimiter         = { fg = newpaper.blue },
        markdownH4Delimiter         = { fg = newpaper.tex_math },
        markdownH5Delimiter         = { fg = newpaper.tex_lightpurple },
        markdownH6Delimiter         = { fg = newpaper.tex_darkorange },

        markdownH1                  = { fg = newpaper.tex_part_title, style = style.k_style },
        markdownH2                  = { fg = newpaper.teal, style = style.k_style },
        markdownH3                  = { fg = newpaper.blue, style = style.k_style },
        markdownH4                  = { fg = newpaper.tex_math, style = style.k_style },
        markdownH5                  = { fg = newpaper.tex_lightpurple, style = style.k_style },
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
end

return M
