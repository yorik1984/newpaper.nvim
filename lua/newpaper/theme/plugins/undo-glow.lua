local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        UgComment = { bg = newpaper.difftext },
        UgCursor  = { bg = newpaper.magenta_bg },
        UgPaste   = { bg = newpaper.aqua },
        UgRedo    = { bg = newpaper.diffadd },
        UgSearch  = { bg = newpaper.lightviolet },
        UgUndo    = { bg = newpaper.tex_parbox_opt_error },
        UgYank    = { bg = newpaper.diffchange },
    }
end

return M
