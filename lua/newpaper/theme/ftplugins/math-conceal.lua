local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- ["@_env"]                 = { link = "@conceal" },
        ["@_frac_name"]           = { link = "@function.math.operator.latex" },
        ["@_func_name"]           = { link = "@function.math.operator.latex" },
        -- ["@_line"]                = { link = "@conceal" },
        ["@abs_name"]             = { link = "@function.math.operator.latex" },
        ["@close_paren"]          = { link = "@punctuation.bracket.math.sub.latex" },
        ["@cmd"]                  = { link = "@function.latex" },
        ["@comma"]                = { link = "@function.math.operator.latex" },
        ["@conceal_dollar"]       = { link = "@markup.math.delim" },
        -- ["@content"]              = { link = "@conceal" },
        -- ["@first_letter"]         = { link = "@conceal" },
        -- ["@font_letter"]          = { link = "@conceal" },
        ["@frac"]                 = { link = "@function.math.operator.latex" },
        ["@func"]                 = { link = "@function.latex" },
        ["@func_name"]            = { link = "@function.math.operator.latex" },
        ["@left_1"]               = { link = "@punctuation.bracket.math.latex" },
        ["@left_2"]               = { link = "@punctuation.bracket.math.latex" },
        ["@left_brace"]           = { link = "@punctuation.delimiter.latex" },
        -- ["@left_content"]         = { link = "@conceal" },
        ["@left_paren"]           = { link = "@function.math.markup.latex" },
        ["@left_paren_cmd"]       = { link = "@punctuation.bracket.math.sub.latex" },
        ["@open_paren"]           = { link = "@punctuation.bracket.math.sub.latex" },
        -- ["@punctuation"]          = { link = "@conceal" },
        ["@punctuation.comma"]    = { link = "@function.math.operator.latex" },
        ["@right_1"]              = { link = "@operator.math.slash.latex" },
        ["@right_2"]              = { link = "@punctuation.bracket.math.latex" },
        ["@right_brace"]          = { link = "@punctuation.delimiter.latex" },
        -- ["@right_content"]        = { link = "@conceal" },
        ["@right_paren"]          = { link = "@function.math.markup.latex" },
        ["@right_paren_cmd"]      = { link = "@punctuation.bracket.math.sub.latex" },
        -- ["@second_letter"]        = { link = "@conceal" },
        ["@sub_letter"]           = { link = "@number.latex" },
        ["@sub_object"]           = { link = "@number.latex" },
        ["@sub_symbol"]           = { link = "@operator.math.sub.latex" },
        ["@sup_letter"]           = { link = "@number.latex" },
        ["@sup_object"]           = { link = "@number.latex" },
        ["@sup_symbol"]           = { link = "@operator.math.sub.latex" },
        ["@symbol"]               = { link = "@operator.math.typst" },
        ["@tex_font_name"]        = { link = "@function.math.markup.latex" },
        ["@tex_greek"]            = { link = "@function.math.greek.latex" },
        -- ["@tex_math_command"]     = { link = "@conceal" },

        ["@typ_font_name"]        = { link = "@function.latex" },
        ["@typ_greek_symbol"]     = { link = "@function.math.greek.latex" },
        ["@typ_inline_ampersand"] = { link = "@punctuation.delimiter.latex" },
        ["@typ_inline_asterisk"]  = { link = "@markup.quote.marker" },
        ["@typ_inline_dollar"]    = { link = "@markup.math.delim" },
        ["@typ_inline_quote"]     = { link = "@markup.quote.marker" },
        ["@typ_math_delim"]       = { link = "@punctuation.delimiter.latex" },
        ["@typ_math_font"]        = { link = "@function.math.markup.latex" },
        -- ["@typ_math_symbol"]      = { link = "@conceal" },
        -- ["@typ_phy_symbol"]       = { link = "@conceal" },
    }
end

return M
