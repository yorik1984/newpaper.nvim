local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constant.html"] = { fg = newpaper.comments, style = style.c_style },
        ["@none.html"]     = { fg = newpaper.texts },
    }
end

return M
