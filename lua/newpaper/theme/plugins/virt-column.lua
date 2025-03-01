local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        VirtColumn = { fg = newpaper.colorcol, bg = newpaper.none, nocombine = true },
    }
end

return M
