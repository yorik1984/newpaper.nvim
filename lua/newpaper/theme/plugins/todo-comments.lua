local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        TodoSignWARN = { fg = newpaper.todo_warn },
        TodoSignTODO = { fg = newpaper.todo_info },
        TodoSignPERF = { fg = newpaper.todo_default },
        TodoSignNOTE = { fg = newpaper.todo_hint },
        TodoSignHACK = { fg = newpaper.todo_warn },
        TodoSignFIX  = { fg = newpaper.todo_error },
        TodoSignTEST = { fg = newpaper.todo_test },
        TodoFgWARN   = { fg = newpaper.todo_warn },
        TodoFgTODO   = { fg = newpaper.todo_info },
        TodoFgPERF   = { fg = newpaper.todo_default },
        TodoFgNOTE   = { fg = newpaper.todo_hint },
        TodoFgHACK   = { fg = newpaper.todo_warn },
        TodoFgFIX    = { fg = newpaper.todo_error },
        TodoFgTEST   = { fg = newpaper.todo_test },
        TodoBgWARN   = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
        TodoBgTODO   = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
        TodoBgPERF   = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
        TodoBgNOTE   = { fg = newpaper.bg, bg = newpaper.todo_hint, style = style.b_bold },
        TodoBgHACK   = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
        TodoBgFIX    = { fg = newpaper.bg, bg = newpaper.todo_error, style = style.b_bold },
        TodoBgTEST   = { fg = newpaper.bg, bg = newpaper.todo_test, style = style.b_bold },
    }
end

return M
