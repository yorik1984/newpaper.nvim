local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        HighlightUndo = { bg = newpaper.diffchange },
        HighlightRedo = { bg = newpaper.diffadd },
    }
end

return M
