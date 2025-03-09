local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@property.toml"]       = { fg = newpaper.darkengreen, style = style.f_style },
        ["@string.special.toml"] = { fg = newpaper.maroon },
        ["@type.toml"]           = { fg = newpaper.keywords, style = style.k_style },
    }
end

return M
