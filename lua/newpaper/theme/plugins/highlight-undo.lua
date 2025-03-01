local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        HighlightUndo = { bg = newpaper.diffchange_bg },
        HighlightRedo = { bg = newpaper.diffadd_bg },
    }
end

return M
