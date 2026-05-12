local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@comment.note.perf.comment"]       = { fg = newpaper.bg, bg = newpaper.todo_default, style = style.b_bold },
        ["@comment.note.test.comment"]       = { fg = newpaper.bg, bg = newpaper.todo_test, style = style.b_bold },
        ["@constant.comment"]                = { fg = newpaper.tex_lightviolet, style = style.doc_style, nocombine = true },
        ["@keyword.comment"]                 = { fg = newpaper.tex_keyword, style = style.doc_k_style, nocombine = true },
        ["@keyword.exception.comment"]       = { fg = newpaper.tex_red, style = style.doc_k_style, nocombine = true },
        ["@keyword.function.comment"]        = { fg = newpaper.tex_navy, style = style.doc_k_style, nocombine = true },
        ["@keyword.macro.comment"]           = { fg = newpaper.tex_magenta_soft, style = style.doc_k_style, nocombine = true },
        ["@keyword.macro.symbol_at.comment"] = { link = "@keyword.macro.comment" },
        ["@keyword.macro.symbol_ex.comment"] = { link = "@keyword.macro.comment" },
        ["@keyword.modifier.comment"]        = { fg = newpaper.ruby_maroon, style = style.doc_k_style, nocombine = true },
        ["@keyword.return.comment"]          = { fg = newpaper.ruby_purple, style = style.doc_k_style, nocombine = true },
        ["@keyword.symbol_at.comment"]       = { link = "@keyword.comment" },
        ["@keyword.symbol_ex.comment"]       = { link = "@keyword.comment" },
        ["@punctuation.bracket.comment"]     = { fg = newpaper.tex_lightpurple, style = style.doc_style, nocombine = true },
        ["@punctuation.delimiter.comment"]   = { fg = newpaper.tex_SI_orange, style = style.doc_style, nocombine = true },
    }
end

return M
