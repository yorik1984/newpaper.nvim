local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        jinjaPunctuation = { fg = newpaper.blueviolet },
        jinjaAttribute   = { fg = newpaper.darkengreen },
        jinjaFunction    = { fg = newpaper.navy, style = style.f_style },

        -- jinjaTagDelim     jinjaTagBlock
        -- jinjaVarDelim     jinjaVarBlock
        -- jinjaCommentDelim jinjaComment
        jinjaRawDelim    = { fg = newpaper.darkgrey, style = style.d_style },

        jinjaSpecial     = { fg = newpaper.darkgreen, style = style.o_style },
        jinjaOperator    = { fg = newpaper.navy, style = style.o_style },
        jinjaRaw         = { fg = newpaper.darkgrey },
        jinjaTagBlock    = { fg = newpaper.jinja_red },
        jinjaVarBlock    = { fg = newpaper.jinja_red },
        -- jinjaStatement    Statement
        jinjaFilter      = { fg = newpaper.blue, style = style.f_style },
        jinjaBlockName   = { fg = newpaper.teal },
        -- jinjaVariable     Identifier
        jinjaString      = { fg = newpaper.strings, style = style.s_style },
        jinjaNumber      = { fg = newpaper.red },
        -- jinjaComment      Comment
    }
end

return M
