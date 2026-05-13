local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@function.call.typst"]            = { fg = newpaper.tex_navy, nocombine = true },
        ["@markup.link.url.typst"]          = { fg = newpaper.tex_navy, style = style.links, nocombine = true },
        ["@number.typst"]                   = { fg = newpaper.tex_red, nocombine = true },
        ["@operator.typst"]                 = { fg = newpaper.tex_operator, style = style.tex_o_style, nocombine = true },
        ["@punctuation.bracket.code.typst"] = { fg = newpaper.tex_operator, style = style.br_style, nocombine = true },
        ["@punctuation.bracket.typst"]      = { fg = newpaper.tex_lightpurple, style = style.tex_br_style, nocombine = true },
        ["@punctuation.special.typst"]      = { fg = newpaper.tex_magenta, nocombine = true },
        ["@string.typst"]                   = { fg = newpaper.tex_teal, nocombine = true },
        ["@variable.member.typst"]          = { fg = newpaper.tex_orange, style = style.b_italic, nocombine = true },

        ["@keyword.import.typst"]           = { fg = newpaper.tex_blue, style = style.tex_k_style, nocombine = true },
        ["@keyword.typst"]                  = { fg = newpaper.tex_keyword, style = style.tex_m_style, nocombine = true },
        ["@keyword.repeat.typst"]           = { fg = newpaper.tex_keyword, style = style.tex_k_style, nocombine = true },
        ["@keyword.conditional.typst"]      = { fg = newpaper.tex_keyword, style = style.tex_k_style, nocombine = true },
        ["@keyword.operator.typst"]         = { fg = newpaper.tex_operator, style = style.tex_o_style, nocombine = true },

    }
end

return M
