local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        FocusedSymbol           = { fg = newpaper.search_fg, bg = newpaper.search_bg, style = style.b_bold },
        SymbolsOutlineConnector = { fg = newpaper.teal },
    }
end

return M
