local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        IblScope      = { fg = newpaper.contextchar },
        RainbowRed    = { fg = newpaper.rainbowred, style = style.d_r_style, nocombine = true },
        RainbowYellow = { fg = newpaper.rainbowyellow, style = style.d_r_style, nocombine = true },
        RainbowBlue   = { fg = newpaper.rainbowblue, style = style.d_r_style, nocombine = true },
        RainbowOrange = { fg = newpaper.rainboworange, style = style.d_r_style, nocombine = true },
        RainbowGreen  = { fg = newpaper.rainbowgreen, style = style.d_r_style, nocombine = true },
        RainbowViolet = { fg = newpaper.rainbowviolet, style = style.d_r_style, nocombine = true },
        RainbowCyan   = { fg = newpaper.rainbowcyan, style = style.d_r_style, nocombine = true },
    }
end

return M
