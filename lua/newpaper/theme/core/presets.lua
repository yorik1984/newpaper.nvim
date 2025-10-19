local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- Text
        NormalText         = { fg = newpaper.text_fg, bg = newpaper.text_bg },
        CursorLineText     = { bg = newpaper.text_cursor },
        CursorLineNrText   = { fg = newpaper.text_cursor_nr_fg, bg = newpaper.text_cursor_nr_bg, style = style.b_bold },
        CursorLineFoldText = { bg = newpaper.text_cursor_fold_bg },
        CursorLineSignText = { bg = newpaper.text_cursor_sign_bg },
        LineNrText         = { fg = newpaper.text_linenumber_fg, bg = newpaper.text_bg },
        FoldColumnText     = { fg = newpaper.text_fg, bg = newpaper.text_bg },
        SignColumnText     = { bg = newpaper.text_bg },
        WinBarText         = { fg = newpaper.text_fg, bg = newpaper.text_bg },
        WinBarNCText       = { fg = newpaper.text_fg, bg = newpaper.text_bg },
        VisualText         = { bg = newpaper.text_visual },
        VisualNOSText      = { bg = newpaper.text_visual },
        NonTextVisualText  = { fg = newpaper.tex_tikz_orange, bg = newpaper.text_visual },

        -- Task
        NormalTask         = { fg = newpaper.task_fg, bg = newpaper.task_bg },
        CursorLineTask     = { bg = newpaper.task_cursor },
        CursorLineNrTask   = { fg = newpaper.task_cursor_nr_fg, bg = newpaper.task_cursor_nr_bg, style = style.b_bold },
        CursorLineFoldTask = { bg = newpaper.task_cursor_fold_bg },
        CursorLineSignTask = { bg = newpaper.task_cursor_sign_bg },
        LineNrTask         = { fg = newpaper.task_linenumber_fg, bg = newpaper.task_bg },
        FoldColumnTask     = { fg = newpaper.task_fg, bg = newpaper.task_bg },
        SignColumnTask     = { bg = newpaper.task_bg },
        WinBarTask         = { fg = newpaper.task_fg, bg = newpaper.task_bg },
        WinBarNCTask       = { fg = newpaper.task_fg, bg = newpaper.task_bg },
        VisualTask         = { bg = newpaper.task_visual },
        VisualNOSTask      = { bg = newpaper.task_visual },
        NonTextVisualTask  = { fg = newpaper.tex_tikz_orange, bg = newpaper.task_visual },
    }
end

return M
