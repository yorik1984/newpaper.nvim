local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@label.json"]    = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        ["@label.hjson"]   = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        ["@label.jsonnet"] = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
    }
end

return M
