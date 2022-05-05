local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local htmlSyn  = {}
    htmlSyn.colors = configColors
    htmlSyn.style  = configStyle
    local newpaper = htmlSyn.colors
    local style    = htmlSyn.style

    htmlSyn.loadSyntax = function ()
        -- TODO: Add syntax
        -- HTML syntax highlight groups

        local syntax = {

            htmlH1                      = { fg = newpaper.tex_part_title, style = style.tag_style },
            htmlH2                      = { fg = newpaper.tex_navy,       style = style.tag_style },
            htmlH3                      = { fg = newpaper.keyword,        style = style.tag_style },
            htmlH4                      = { fg = newpaper.blue,           style = style.tag_style },
            htmlH5                      = { fg = newpaper.darkyellow,     style = style.tag_style },
            htmlH6                      = { fg = newpaper.orange,         style = style.tag_style },

            htmlTag                     = { fg = newpaper.tag_navy },
            htmlEndTag                  = { fg = newpaper.tag_navy },
            htmlArg                     = { fg = newpaper.darkengreen },
            -- htmlTagName                 htmlStatement
            htmlSpecialTagName          = { fg = newpaper.maroon },
            htmlValue                   = { fg = newpaper.tex_string },
            htmlSpecialChar             = { fg = newpaper.tex_magenta },

            -- html_no_rendering
            -- htmlH1                      Title
            -- htmlH2                      htmlH1
            -- htmlH3                      htmlH2
            -- htmlH4                      htmlH3
            -- htmlH5                      htmlH4
            -- htmlH6                      htmlH5
            htmlHead                    = { fg = newpaper.darkpurple },
            -- htmlTitle                   Title
            -- htmlBoldItalicUnderline     htmlBoldUnderlineItalic
            -- htmlUnderlineBold           htmlBoldUnderline
            -- htmlUnderlineItalicBold     htmlBoldUnderlineItalic
            -- htmlUnderlineBoldItalic     htmlBoldUnderlineItalic
            -- htmlItalicUnderline         htmlUnderlineItalic
            -- htmlItalicBold              htmlBoldItalic
            -- htmlItalicBoldUnderline     htmlBoldUnderlineItalic
            -- htmlItalicUnderlineBold     htmlBoldUnderlineItalic
            htmlLink                    = { fg = newpaper.link, style = style.underline },
            -- htmlLeadingSpace            None

            -- html_my_rendering
            -- htmlBold                    term=bold cterm=bold gui=bold
            -- htmlBoldUnderline           term=bold,underline cterm=bold,underline gui=bold,underline
            -- htmlBoldItalic              term=bold,italic cterm=bold,italic gui=bold,italic
            -- htmlBoldUnderlineItalic     term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
            -- htmlUnderline               term=underline cterm=underline gui=underline
            -- htmlUnderlineItalic         term=italic,underline cterm=italic,underline gui=italic,underline
            -- htmlItalic                  term=italic cterm=italic gui=italic
            -- htmlStrike                  term=strikethrough cterm=strikethrough gui=strikethrough

            htmlPreStmt                 = { fg = newpaper.darkpurple },
            -- htmlPreError                Error
            htmlPreProc                 = { fg = newpaper.darkpurple },
            htmlPreAttr                 = { fg = newpaper.regexp_blue },
            htmlPreProcAttrName         = { fg = newpaper.darkpurple },
            -- htmlPreProcAttrError        Error
            -- htmlString                  String
            htmlStatement               = { fg = newpaper.tag_navy, style = style.tag_style },
            -- htmlComment                 Comment
            -- htmlCommentNested           htmlError
            -- htmlCommentError            htmlError
            -- htmlTagError                htmlError
            htmlEvent                  = { fg = newpaper.tex_verb, style = style.s_style },
            -- htmlError                  Error

            javaScript                 = { fg = newpaper.tex_verb },
            -- javaScriptExpression       javaScript
            -- htmlCssStyleComment        Comment
            -- htmlCssDefinition          Special
        }

        return syntax
    end

    htmlSyn.loadTreeSitter = function ()

        -- HTML treeSitter highlight syntax groups

        local treesitter = {

            htmlTSTag                   = { fg = newpaper.tag_navy, style = style.k_style },
            htmlTSTagDelimiter          = { fg = newpaper.tag_navy },
            htmlTSOperator              = { fg = newpaper.tag_navy, style = style.o_style },
            htmlTSTagAttribute          = { fg = newpaper.darkengreen },
            htmlTSConstant              = { fg = newpaper.comment,  style = style.c_style },
            htmlTSString                = { fg = newpaper.string,   style = style.s_style },
            htmlTSTitle                 = { fg = newpaper.title,    style = style.k_style },
            htmlTSText                  = { fg = newpaper.fg },

        }

        return treesitter
    end

    htmlSyn.loadPlugins = function()

        -- HTML special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
    end

    -- stylua: ignore end

    return htmlSyn
end

return M
