local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@label.vimdoc"]             = { fg = newpaper.tex_magenta, nocombine = true },
        ["@markup.link.vimdoc"]       = { fg = newpaper.links, style = style.underline, nocombine = true },
        ["@string.special.vimdoc"]    = { fg = newpaper.keywords, nocombine = true },
        ["@markup.link.label.vimdoc"] = { fg = newpaper.tex_maroon, style = style.b_bold, nocombine = true },
    }
end

return M
