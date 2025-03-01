local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        TreesitterContextLineNumber = { fg = newpaper.linenumber_fg, bg = newpaper.linenumber_bg, style = style.b_bold },
        TreesitterContextBottom     = { style = style.underline, sp = newpaper.contextchar },
    }
end

return M
