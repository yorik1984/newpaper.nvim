local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        MatchWord = { bg = newpaper.lightviolet, style = style.b_bold },
    }
end

return M
