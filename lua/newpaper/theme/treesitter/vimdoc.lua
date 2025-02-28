local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@label.vimdoc"]          = { fg = newpaper.tex_magenta },
        ["@markup.link.vimdoc"]    = { fg = newpaper.links, style = style.underline },
        ["@string.special.vimdoc"] = { fg = newpaper.keywords, nocombine = true },
    }
end

return M
