local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ExtraWhitespace = { fg = newpaper.disabled, bg = newpaper.pink },
    }
end

return M
