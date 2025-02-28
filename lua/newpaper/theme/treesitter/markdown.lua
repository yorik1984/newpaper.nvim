local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@keyword.directive.markdown"]   = { fg = newpaper.orange },
        ["@label.markdown"]               = { fg = newpaper.tex_magenta },
        ["@none.markdown"]                = { fg = newpaper.fg },
        ["@punctuation.special.markdown"] = { fg = newpaper.tex_orange, style = style.d_style },
        ["@lsp.type.class.markdown"]      = { default = true },
    }
end

return M
