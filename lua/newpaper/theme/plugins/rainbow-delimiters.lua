local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        RainbowDelimiterRed    = { fg = newpaper.rainbowred, style = style.d_r_style, nocombine = true },
        RainbowDelimiterYellow = { fg = newpaper.rainbowyellow, style = style.d_r_style, nocombine = true },
        RainbowDelimiterBlue   = { fg = newpaper.rainbowblue, style = style.d_r_style, nocombine = true },
        RainbowDelimiterOrange = { fg = newpaper.rainboworange, style = style.d_r_style, nocombine = true },
        RainbowDelimiterGreen  = { fg = newpaper.rainbowgreen, style = style.d_r_style, nocombine = true },
        RainbowDelimiterViolet = { fg = newpaper.rainbowviolet, style = style.d_r_style, nocombine = true },
        RainbowDelimiterCyan   = { fg = newpaper.rainbowcyan, style = style.d_r_style, nocombine = true },
    }
end

return M
