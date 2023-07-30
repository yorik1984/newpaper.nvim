local M = {}

function M.setup(configColors, configStyle)

    -- stycomment: ignore start

    local commentSyn  = {}
    commentSyn.colors = configColors
    commentSyn.style  = configStyle
    local newpaper    = commentSyn.colors
    local style       = commentSyn.style

    commentSyn.loadTreeSitter = function()

        local treesitter = {
            ["@constant.comment"]              = { fg = newpaper.tex_lightviolet, style = style.c_style, nocombine = true },
            ["@punctuation.bracket.comment"]   = { fg = newpaper.tex_lightpurple, style = style.c_style, nocombine = true },
            ["@punctuation.delimiter.comment"] = { fg = newpaper.tex_SI_orange,   style = style.c_style, nocombine = true },
            ["@text.note.test.comment"]        = { fg = newpaper.bg, bg = newpaper.todo_test, style = style.b_bold },
            ["@text.note.perf.comment"]        = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
            ["@text.uri.comment"]              = { fg = newpaper.regexp_blue,     style = style.link, nocombine = true },
        }

        return treesitter
    end

    -- stycomment: ignore end

    return commentSyn

end

return M
