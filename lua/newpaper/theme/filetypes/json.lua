local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        jsonKeyword = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
    }
end

return M
