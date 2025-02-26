local M = {}

function M.setup(configColors, configStyle)
    local todoCommentsSyn       = {}
    todoCommentsSyn.colors      = configColors
    todoCommentsSyn.style       = configStyle
    local newpaper              = todoCommentsSyn.colors
    local style                 = todoCommentsSyn.style

    todoCommentsSyn.loadPlugins = function()
        local plugins = {
            TodoSignWARN = { fg = newpaper.todo_warn, bg = newpaper.linenumber_bg },
            TodoSignTODO = { fg = newpaper.todo_info, bg = newpaper.linenumber_bg },
            TodoSignPERF = { fg = newpaper.todo_default, bg = newpaper.linenumber_bg },
            TodoSignNOTE = { fg = newpaper.todo_hint, bg = newpaper.linenumber_bg },
            TodoSignHACK = { fg = newpaper.todo_warn, bg = newpaper.linenumber_bg },
            TodoSignFIX  = { fg = newpaper.todo_error, bg = newpaper.linenumber_bg },
            TodoSignTEST = { fg = newpaper.todo_test, bg = newpaper.linenumber_bg },
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
        return plugins
    end

    return todoCommentsSyn
end

return M
