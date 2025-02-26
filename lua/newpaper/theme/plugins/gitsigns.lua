local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        GitSignsAdd              = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        GitSignsAddNr            = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        GitSignsAddLn            = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        GitSignsChange           = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        GitSignsChangeNr         = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        GitSignsChangeLn         = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        GitSignsDelete           = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
        GitSignsDeleteNr         = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
        GitSignsDeleteLn         = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
        GitSignsCurrentLineBlame = { fg = newpaper.grey, style = style.c_style },
    }
end

return M
