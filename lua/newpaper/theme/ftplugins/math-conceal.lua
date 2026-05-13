local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- ["@_comma"]              = { link = "" },
        -- ["@_frac_name"]          = { link = "" },
        -- ["@abs_name"]            = { link = "" },
        ["@close_paren"]      = { link = "@punctuation.bracket.math.sub.latex" },
        -- ["@cmd"]                 = { link = "" },
        -- ["@comma"]               = { link = "" },
        ["@conceal_dollar"]   = { link = "@markup.math.delim" },
        -- ["@content"]             = { link = "" },
        -- ["@first_letter"]        = { link = "" },
        ["@font_letter"]      = { link = "@function.math.greek.latex" },
        ["@frac"]             = { link = "@function.math.operator.latex" },
        -- ["@func"]                = { link = "" },
        -- ["@func_name"]           = { link = "" },
        ["@left_1"]           = { link = "@punctuation.bracket.math.latex" },
        ["@left_2"]           = { link = "@punctuation.bracket.math.latex" },
        ["@left_brace"]       = { link = "@punctuation.delimiter.latex" },
        -- ["@left_content"]        = { link = "" },
        ["@left_paren"]       = { link = "@function.bracket.latex" },
        ["@left_paren_cmd"]   = { link = "@punctuation.bracket.math.sub.latex" },
        ["@open_paren"]       = { link = "@punctuation.bracket.math.sub.latex" },
        ["@right_1"]          = { link = "@punctuation.bracket.math.latex" },
        ["@right_2"]          = { link = "@punctuation.bracket.math.latex" },
        ["@right_brace"]      = { link = "@punctuation.delimiter.latex" },
        -- ["@right_content"]       = { link = "" },
        ["@right_paren"]      = { link = "@function.bracket.latex" },
        ["@right_paren_cmd"]  = { link = "@punctuation.bracket.math.sub.latex" },
        -- ["@second_letter"]       = { link = "" },
        -- ["@sub_letter"]          = { link = "" },
        -- ["@sub_number"]          = { link = "" },
        -- ["@sub_object"]          = { link = "" },
        ["@sub_symbol"]       = { link = "@operator.math.sub.latex" },
        -- ["@sup_letter"]          = { link = "" },
        -- ["@sup_number"]          = { link = "" },
        -- ["@sup_object"]          = { link = "" },
        ["@sup_symbol"]       = { link = "@operator.math.sub.latex" },
        -- ["@symbol"]              = { link = "" },

        ["@tex_font_name"]    = { link = "@function.latex" },
        ["@tex_greek"]        = { link = "@function.math.greek.latex" },
        ["@tex_math_command"] = { link = "@function.math.latex" },

        -- ["@typ_font_name"]       = { link = "" },
        -- ["@typ_greek_symbol"]    = { link = "" },
        -- ["@typ_inline_asterisk"] = { link = "" },
        -- ["@typ_inline_dollar"]   = { link = "" },
        -- ["@typ_inline_quote"]    = { link = "" },
        -- ["@typ_math_delim"]      = { link = "" },
        -- ["@typ_math_font"]       = { link = "" },
        -- ["@typ_math_symbol"]     = { link = "" },
        -- ["@typ_phy_symbol"]      = { link = "" },
    }
end

return M
