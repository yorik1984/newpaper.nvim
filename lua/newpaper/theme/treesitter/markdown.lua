local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@keyword.directive.markdown"]           = { fg = newpaper.orange },
        ["@label.markdown"]                       = { fg = newpaper.tex_magenta },
        ["@none.markdown"]                        = { fg = newpaper.fg },
        ["@punctuation.special.markdown"]         = { fg = newpaper.tex_orange, style = style.d_style },
        ["@lsp.type.class.markdown"]              = { default = true },
        ["@markup.strikethrough.markdown_inline"] = { fg = newpaper.comments, style = style.strike },
        ["@markup.list.progress"]                 = { fg = newpaper.todo_warn, nocombine = true },
        ["@markup.list.inprogress"]               = { fg = newpaper.tex_aqua, nocombine = true },
        ["@markup.list.cancelled"]                = { fg = newpaper.tex_red, nocombine = true },
        ["@markup.list.onhold"]                   = { fg = newpaper.darkyellow, nocombine = true },
    }
end

return M
