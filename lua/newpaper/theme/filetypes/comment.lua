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
            ["@comment.note.test.comment"]     = { fg = newpaper.bg, bg = newpaper.todo_test, style = style.b_bold },
            ["@comment.note.perf.comment"]     = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
            ["@keyword.comment"]               = { fg = newpaper.tex_keyword, style = style.doc_k_style, nocombine = true },
            ["@keyword.function.comment"]      = { fg = newpaper.tex_navy,    style = style.doc_k_style, nocombine = true },
            ["@keyword.return.comment"]        = { fg = newpaper.ruby_purple, style = style.doc_k_style, nocombine = true },
            ["@keyword.modifier.comment"]      = { fg = newpaper.ruby_maroon, style = style.doc_k_style, nocombine = true },
        }

        return treesitter
    end

    -- stycomment: ignore end

    return commentSyn

end

return M
