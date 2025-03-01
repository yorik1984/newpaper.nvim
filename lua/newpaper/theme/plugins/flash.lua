local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        FlashBackdrop = { fg = newpaper.comment },
        FlashLabel    = { fg = newpaper.fg, bg = newpaper.magenta_bg, style = style.b_bold },
    }
end

return M
