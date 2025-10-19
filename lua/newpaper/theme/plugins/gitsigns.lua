local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        GitSignsAdd              = { fg = newpaper.git_added },
        GitSignsAddNr            = { fg = newpaper.git_added },
        GitSignsAddLn            = { fg = newpaper.git_added },
        GitSignsChange           = { fg = newpaper.git_modified },
        GitSignsChangeNr         = { fg = newpaper.git_modified },
        GitSignsChangeLn         = { fg = newpaper.git_modified },
        GitSignsDelete           = { fg = newpaper.git_removed },
        GitSignsDeleteNr         = { fg = newpaper.git_removed },
        GitSignsDeleteLn         = { fg = newpaper.git_removed },
        GitSignsCurrentLineBlame = { fg = newpaper.grey, style = style.c_style },
    }
end

return M
