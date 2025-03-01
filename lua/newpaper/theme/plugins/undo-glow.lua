local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        UgComment = { bg = newpaper.difftext_bg },
        UgCursor  = { bg = newpaper.magenta_bg },
        UgPaste   = { bg = newpaper.aqua },
        UgRedo    = { bg = newpaper.diffadd_bg },
        UgSearch  = { bg = newpaper.lightviolet },
        UgUndo    = { bg = newpaper.tex_parbox_opt_error },
        UgYank    = { bg = newpaper.diffchange_bg },
    }
end

return M
