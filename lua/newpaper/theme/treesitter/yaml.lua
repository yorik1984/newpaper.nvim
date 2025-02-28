local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constant.builtin.yaml"]    = { fg = newpaper.ocean, style = style.k_style },
        ["@property.yaml"]            = { fg = newpaper.ocean, style = style.f_style, nocombine = true },
        ["@punctuation.special.yaml"] = { fg = newpaper.magenta },
    }
end

return M
