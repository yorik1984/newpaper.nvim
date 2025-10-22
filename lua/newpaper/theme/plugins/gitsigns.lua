local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        GitSignsAdd              = { fg = newpaper.git_added },
        GitSignsAddNr            = { fg = newpaper.git_added },
        GitSignsAddLn            = { fg = newpaper.git_added },
        GitSignsAddCul           = { fg = newpaper.git_added },
        GitSignsAddPreview       = { fg = newpaper.git_added },
        GitSignsChange           = { fg = newpaper.git_modified },
        GitSignsChangeNr         = { fg = newpaper.git_modified },
        GitSignsChangeLn         = { fg = newpaper.git_modified },
        GitSignsChangeCul        = { fg = newpaper.git_modified },
        GitSignsDelete           = { fg = newpaper.git_removed },
        GitSignsDeleteNr         = { fg = newpaper.git_removed },
        GitSignsDeleteLn         = { fg = newpaper.git_removed },
        GitSignsDeleteCul        = { fg = newpaper.git_removed },
        GitSignsDeletePreview    = { fg = newpaper.git_removed },
        GitSignsVirtLnum         = { fg = newpaper.git_removed },
        GitSignsDeleteVirtLn     = { fg = newpaper.git_removed },
        GitSignsUntracked        = { fg = newpaper.git_untracked },
        GitSignsUntrackedLn      = { fg = newpaper.git_untracked },
        GitSignsUntrackedNr      = { fg = newpaper.git_untracked },
        GitSignsUntrackedCul     = { fg = newpaper.git_untracked },
        GitSignsCurrentLineBlame = { fg = newpaper.grey, style = style.c_style },
    }
end

return M
