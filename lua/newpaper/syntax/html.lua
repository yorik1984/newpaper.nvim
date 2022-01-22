local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local htmlSyn  = {}
    htmlSyn.colors = require("newpaper.colors").setup(config)
    htmlSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = htmlSyn.colors
    local style    = htmlSyn.style

    -- LuaFormatter off

    htmlSyn.loadSyntax = function ()
        -- TODO: Add syntax
        -- HTML syntax highlight groups

        local syntax = {

            htmlLink = { fg = newpaper.link, style = 'underline' },
            htmlH1   = { fg = newpaper.purple, style = style.tag_style },
            htmlH2   = { fg = newpaper.teal, style = style.tag_style },
            htmlH3   = { fg = newpaper.darkengreen, style = style.tag_style },
            htmlH4   = { fg = newpaper.orange, style = style.tag_style },
            htmlH5   = { fg = newpaper.darkyellow, style = style.tag_style },
            htmlH6   = { fg = newpaper.blue, style = style.tag_style },

-- hi def link htmlTag                     Function
-- hi def link htmlEndTag                  Identifier
-- hi def link htmlArg                     Type
-- hi def link htmlTagName                 htmlStatement
-- hi def link htmlSpecialTagName          Exception
-- hi def link htmlValue                   String
-- hi def link htmlSpecialChar             Special

-- if !exists("html_no_rendering")
--   hi def link htmlH1                      Title
--   hi def link htmlH2                      htmlH1
--   hi def link htmlH3                      htmlH2
--   hi def link htmlH4                      htmlH3
--   hi def link htmlH5                      htmlH4
--   hi def link htmlH6                      htmlH5
--   hi def link htmlHead                    PreProc
--   hi def link htmlTitle                   Title
--   hi def link htmlBoldItalicUnderline     htmlBoldUnderlineItalic
--   hi def link htmlUnderlineBold           htmlBoldUnderline
--   hi def link htmlUnderlineItalicBold     htmlBoldUnderlineItalic
--   hi def link htmlUnderlineBoldItalic     htmlBoldUnderlineItalic
--   hi def link htmlItalicUnderline         htmlUnderlineItalic
--   hi def link htmlItalicBold              htmlBoldItalic
--   hi def link htmlItalicBoldUnderline     htmlBoldUnderlineItalic
--   hi def link htmlItalicUnderlineBold     htmlBoldUnderlineItalic
--   hi def link htmlLink                    Underlined
--   hi def link htmlLeadingSpace            None
--   if !exists("html_my_rendering")
--     hi def htmlBold                term=bold cterm=bold gui=bold
--     hi def htmlBoldUnderline       term=bold,underline cterm=bold,underline gui=bold,underline
--     hi def htmlBoldItalic          term=bold,italic cterm=bold,italic gui=bold,italic
--     hi def htmlBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
--     hi def htmlUnderline           term=underline cterm=underline gui=underline
--     hi def htmlUnderlineItalic     term=italic,underline cterm=italic,underline gui=italic,underline
--     hi def htmlItalic              term=italic cterm=italic gui=italic
--     if v:version > 800 || v:version == 800 && has("patch1038")
--         hi def htmlStrike              term=strikethrough cterm=strikethrough gui=strikethrough
--     else
--         hi def htmlStrike              term=underline cterm=underline gui=underline
--     endif
--   endif
-- endif

-- hi def link htmlPreStmt            PreProc
-- hi def link htmlPreError           Error
-- hi def link htmlPreProc            PreProc
-- hi def link htmlPreAttr            String
-- hi def link htmlPreProcAttrName    PreProc
-- hi def link htmlPreProcAttrError   Error
-- hi def link htmlString             String
-- hi def link htmlStatement          Statement
-- hi def link htmlComment            Comment
-- hi def link htmlCommentNested      htmlError
-- hi def link htmlCommentError       htmlError
-- hi def link htmlTagError           htmlError
-- hi def link htmlEvent              javaScript
-- hi def link htmlError              Error

-- hi def link javaScript             Special
-- hi def link javaScriptExpression   javaScript
-- hi def link htmlCssStyleComment    Comment
-- hi def link htmlCssDefinition      Special
        }

        return syntax

    end

    htmlSyn.loadTreeSitter = function ()

        -- HTML treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    htmlSyn.loadPlugins = function()

        -- HTML special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
        -- LuaFormatter on

    end

    return htmlSyn

end

return M
