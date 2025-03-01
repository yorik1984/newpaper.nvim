local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        LazyGitFloat  = { fg = newpaper.git_fg, bg = newpaper.term_fl_bg },
        LazyGitBorder = { fg = newpaper.win_act_border, bg = newpaper.term_fl_bg },
    }
end

return M
