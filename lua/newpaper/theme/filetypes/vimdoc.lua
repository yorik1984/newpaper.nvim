local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        helpBacktick       = { fg = newpaper.magenta },
        helpSpecial        = { fg = newpaper.magenta },
        helpCommand        = { fg = newpaper.regexp_blue },
        helpExample        = { fg = newpaper.regexp_blue },
        helpHyperTextEntry = { fg = newpaper.keywords, style = style.s_style },
        helpHyperTextJump  = { fg = newpaper.links, style = style.s_underline },
        helpURL            = { fg = newpaper.strings, style = style.links },
    }
end

return M
