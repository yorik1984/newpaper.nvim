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
            markdownBlockquote          = { fg = newpaper.navy },
            markdownRule                = { fg = newpaper.teal },

            markdownFootnote            = { fg = newpaper.link, style = style.k_style },
            markdownFootnoteDefinition  = { fg = newpaper.link, style = 'underline'},

            markdownLinkText            = { fg = newpaper.link, style = 'underline' },
            markdownIdDeclaration       = { fg = newpaper.maroon, style = style.k_style },
            markdownId                  = { fg = newpaper.maroon },
            markdownAutomaticLink       = { fg = newpaper.link, style = 'italic,underline' },
            markdownUrl                 = { fg = newpaper.string },
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
            markdownTSURI            = { fg = newpaper.string },
            markdownTSLiteral        = { fg = newpaper.regexp_blue },
            markdownTSStringEscape   = { fg = newpaper.magenta },
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
            -- mkdCode          String
            mkdCodeDelimiter = { fg = newpaper.regexp_blue },
            mkdCodeStart     = { fg = newpaper.regexp_blue },
            mkdCodeEnd       = { fg = newpaper.regexp_blue },
            mkdFootnote      = { fg = newpaper.grey },
            mkdBlockquote    = { fg = newpaper.tag_navy },
            mkdListItem      = { fg = newpaper.darkgrey },
            mkdRule          = { fg = newpaper.darkpurple },
            mkdLineBreak     = { bg = newpaper.aqua },
            mkdFootnotes     = { fg = newpaper.link,   style = 'underline' },
            mkdURL           = { fg = newpaper.string },
            mkdLink          = { fg = newpaper.link,   style = 'underline' },
            mkdInlineURL     = { fg = newpaper.link,   style = 'underline' },
            mkdID            = { fg = newpaper.maroon},
            mkdLinkDef       = { fg = newpaper.maroon, style = style.k_style },
            mkdLinkDefTarget = { fg = newpaper.teal, style = 'underline' },
            mkdLinkTitle     = { fg = newpaper.string },
            mkdDelimiter     = { fg = newpaper.orange },

        }

        return plugins
        -- LuaFormatter on

    end

    return markdownSyn

end

return M
