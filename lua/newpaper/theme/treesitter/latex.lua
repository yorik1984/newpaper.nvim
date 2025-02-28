local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@function.latex"]               = { fg = newpaper.tex_navy },
        ["@function.macro.latex"]         = { fg = newpaper.tex_magenta },
        ["@keyword.import.latex"]         = { fg = newpaper.tex_blue, style = style.tex_k_style },
        ["@label.latex"]                  = { fg = newpaper.tex_darkorange, style = style.tex_a_style },
        ["@markup.heading.latex"]         = { fg = newpaper.tex_navy, style = style.b_bold },
        ["@markup.link.latex"]            = { fg = newpaper.tex_aqua },
        ["@markup.link.url.latex"]        = { fg = newpaper.tex_navy, style = style.links },
        ["@module.latex"]                 = { fg = newpaper.tex_keyword, style = style.tex_k_style },
        ["@none.latex"]                   = { fg = newpaper.tex_pink },
        ["@operator.latex"]               = { fg = newpaper.tex_operator, style = style.tex_o_style },
        ["@punctuation.bracket.latex"]    = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
        ["@punctuation.delimiter.latex"]  = { fg = newpaper.tex_lightpurple, style = style.tex_o_style },
        ["@punctuation.special.latex"]    = { fg = newpaper.tex_string },
        ["@string.latex"]                 = { fg = newpaper.tex_teal },
        ["@type.latex"]                   = { fg = newpaper.tex_blue, style = style.tex_k_style },
        ["@variable.parameter.latex"]     = { fg = newpaper.tex_orange, style = style.tex_a_style },

        ["@constant.bibtex"]              = { fg = newpaper.tex_math },
        ["@function.builtin.bibtex"]      = { fg = newpaper.tex_maroon },
        ["@keyword.bibtex"]               = { fg = newpaper.tex_keyword, style = style.tex_k_style },
        ["@number.bibtex"]                = { fg = newpaper.tex_pink },
        ["@operator.bibtex"]              = { fg = newpaper.tex_operator, style = style.tex_o_style },
        ["@punctuation.bracket.bibtex"]   = { fg = newpaper.tex_lightpurple, style = style.tex_br_style },
        ["@punctuation.delimiter.bibtex"] = { fg = newpaper.tex_orange },
        ["@string.bibtex"]                = { fg = newpaper.tex_teal },
        ["@string.special.symbol.bibtex"] = { fg = newpaper.tex_darkorange },
        ["@variable.member.bibtex"]       = { fg = newpaper.tex_blue },
        ["@variable.parameter.bibtex"]    = { fg = newpaper.tex_orange },
    }
end

return M
