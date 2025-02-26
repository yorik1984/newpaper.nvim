local M = {}

function M.setup(configColors, configStyle)
    local rainbowSyn       = {}
    rainbowSyn.colors      = configColors
    rainbowSyn.style       = configStyle
    local newpaper         = rainbowSyn.colors
    local style            = rainbowSyn.style

    rainbowSyn.loadPlugins = function()
        local plugins = {
            RainbowDelimiterRed    = { fg = newpaper.rainbowred, style = style.d_r_style, nocombine = true },
            RainbowDelimiterYellow = { fg = newpaper.rainbowyellow, style = style.d_r_style, nocombine = true },
            RainbowDelimiterBlue   = { fg = newpaper.rainbowblue, style = style.d_r_style, nocombine = true },
            RainbowDelimiterOrange = { fg = newpaper.rainboworange, style = style.d_r_style, nocombine = true },
            RainbowDelimiterGreen  = { fg = newpaper.rainbowgreen, style = style.d_r_style, nocombine = true },
            RainbowDelimiterViolet = { fg = newpaper.rainbowviolet, style = style.d_r_style, nocombine = true },
            RainbowDelimiterCyan   = { fg = newpaper.rainbowcyan, style = style.d_r_style, nocombine = true },
        }
        return plugins
    end

    return rainbowSyn
end

return M
