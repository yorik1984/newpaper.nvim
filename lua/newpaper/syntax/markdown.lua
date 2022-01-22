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
        -- TODO: Add syntax
        -- Markdown syntax highlight groups

        local syntax = {

            markdownH1Delimiter = { fg = newpaper.purple },
            markdownH2Delimiter = { fg = newpaper.teal },
            markdownH3Delimiter = { fg = newpaper.darkengreen },
            markdownH4Delimiter = { fg = newpaper.orange },
            markdownH5Delimiter = { fg = newpaper.darkyellow },
            markdownH6Delimiter = { fg = newpaper.blue },

            markdownH1 = { fg = newpaper.purple, style = style.k_style },
            markdownH2 = { fg = newpaper.teal, style = style.k_style },
            markdownH3 = { fg = newpaper.darkengreen, style = style.k_style },
            markdownH4 = { fg = newpaper.orange, style = style.k_style },
            markdownH5 = { fg = newpaper.darkyellow, style = style.k_style },
            markdownH6 = { fg = newpaper.blue, style = style.k_style },
            -- markdownHeadingRule           markdownRule
            -- markdownHeadingDelimiter      Delimiter
            -- markdownOrderedListMarker     markdownListMarker
            -- markdownListMarker            htmlTagName
            -- markdownBlockquote            Comment
            -- markdownRule                  PreProc

            -- markdownFootnote              Typedef
            -- markdownFootnoteDefinition    Typedef

            -- markdownLinkText              htmlLink
            -- markdownIdDeclaration         Typedef
            -- markdownId                    Type
            -- markdownAutomaticLink         markdownUrl
            -- markdownUrl                   Float
            -- markdownUrlTitle              String
            -- markdownIdDelimiter           markdownLinkDelimiter
            -- markdownUrlDelimiter          htmlTag
            -- markdownUrlTitleDelimiter     Delimiter

            -- markdownItalic                htmlItalic
            -- markdownItalicDelimiter       markdownItalic
            -- markdownBold                  htmlBold
            -- markdownBoldDelimiter         markdownBold
            -- markdownBoldItalic            htmlBoldItalic
            -- markdownBoldItalicDelimiter   markdownBoldItalic
            -- markdownCodeDelimiter         Delimiter

            -- markdownEscape                Special
            -- markdownError                 Error

        }

        return syntax

    end

    markdownSyn.loadTreeSitter = function ()

        -- Markdown treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    markdownSyn.loadPlugins = function()

        -- Markdown special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
        -- LuaFormatter on

    end

    return markdownSyn

end

return M
