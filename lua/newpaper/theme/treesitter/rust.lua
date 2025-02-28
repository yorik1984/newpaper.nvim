local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@punctuation.bracket.lifetime"] = { fg = newpaper.tag_navy, style = style.k_style },
    }
end

return M
