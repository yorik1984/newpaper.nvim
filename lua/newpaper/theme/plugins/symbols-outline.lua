local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local symbolsOutlineSyn  = {}
    symbolsOutlineSyn.colors = configColors
    symbolsOutlineSyn.style  = configStyle
    local newpaper           = symbolsOutlineSyn.colors
    local style              = symbolsOutlineSyn.style

    symbolsOutlineSyn.loadPlugins = function()
        local plugins = {
            FocusedSymbol           = { fg = newpaper.search_fg, bg = newpaper.search_bg, style = style.b_bold },
            SymbolsOutlineConnector = { fg = newpaper.teal },
        }
        return plugins
    end

    -- stylua: ignore end

    return symbolsOutlineSyn
end

return M
