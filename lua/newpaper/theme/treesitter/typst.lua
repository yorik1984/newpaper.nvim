local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@character.special.ligatures.typst"]  = { fg = newpaper.tex_maroon, style = style.tex_o_style, nocombine = true },
        ["@comment.verb.typst"]                 = { fg = newpaper.tex_verb, nocombine = true },
        ["@function.call.delim.typst"]          = { fg = newpaper.tex_lightpurple, nocombine = true },
        ["@function.call.frac.typst"]           = { fg = newpaper.tex_operator, nocombine = true },
        ["@function.call.math.typst"]           = { fg = newpaper.tex_symbol, nocombine = true },
        ["@function.call.greek.typst"]          = { fg = newpaper.tex_greek, nocombine = true },
        ["@function.call.special.typst"]        = { fg = newpaper.tex_maroon, nocombine = true },
        ["@function.call.typst"]                = { fg = newpaper.tex_navy, nocombine = true },
        ["@function.call.bracket.typst"]        = { fg = newpaper.tex_navy, style = style.tex_br_style, nocombine = true },
        ["@function.math.operator.typst"]       = { fg = newpaper.tex_operator, nocombine = true },
        ["@keyword.conditional.typst"]          = { fg = newpaper.tex_keyword, style = style.tex_m_style, nocombine = true },
        ["@keyword.import.typst"]               = { fg = newpaper.tex_blue, style = style.tex_k_style, nocombine = true },
        ["@keyword.operator.typst"]             = { fg = newpaper.tex_operator, style = style.tex_o_style, nocombine = true },
        ["@keyword.repeat.typst"]               = { fg = newpaper.tex_keyword, style = style.tex_m_style, nocombine = true },
        ["@keyword.typst"]                      = { fg = newpaper.tex_keyword, style = style.tex_m_style, nocombine = true },
        ["@label.typst"]                        = { fg = newpaper.tex_magenta },
        ["@markup.link.url.typst"]              = { fg = newpaper.tex_navy, style = style.links, nocombine = true },
        ["@number.typst"]                       = { fg = newpaper.tex_red },
        ["@operator.math.slash.typst"]          = { link = "@function.math.operator.typst" },
        ["@operator.math.sub.typst"]            = { fg = newpaper.tex_pink, style = style.tex_o_style},
        ["@operator.math.typst"]                = { fg = newpaper.tex_operator, style = style.tex_o_style, nocombine = true },
        ["@operator.typst"]                     = { fg = newpaper.tex_olive, style = style.tex_o_style, nocombine = true },
        ["@punctuation.bracket.code.typst"]     = { fg = newpaper.tex_operator, style = style.br_style, nocombine = true },
        ["@punctuation.bracket.delim.typst"]    = { fg = newpaper.tex_lightpurple, style = style.tex_br_style, nocombine = true },
        ["@punctuation.bracket.math.sub.typst"] = { fg = newpaper.tex_pink, style = style.tex_br_style, nocombine = true },
        ["@punctuation.bracket.typst"]          = { fg = newpaper.tex_operator, style = style.tex_br_style, nocombine = true },
        ["@punctuation.special.typst"]          = { fg = newpaper.tex_magenta_soft, nocombine = true },
        ["@string.typst"]                       = { fg = newpaper.tex_string, nocombine = true },
        ["@variable.member.typst"]              = { fg = newpaper.tex_orange, nocombine = true },
    }
end

return M
