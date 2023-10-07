local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local luadocSyn  = {}
    luadocSyn.colors = configColors
    luadocSyn.style  = configStyle
    local newpaper   = luadocSyn.colors
    local style      = luadocSyn.style

    luadocSyn.loadTreeSitter = function()
        local treesitter = {
            ["@boolean.luadoc"]               = { fg = newpaper.booleans,        style = style.doc_k_style, nocombine = true },
            ["@comment.luadoc"]               = { fg = newpaper.doc_comments,    style = style.doc_style,   nocombine = true },
            ["@constant.builtin.luadoc"]      = { fg = newpaper.dark_maroon,     style = style.doc_style,   nocombine = true },
            ["@constructor.luadoc"]           = { fg = newpaper.lua_blue,        style = style.doc_k_style, nocombine = true },
            ["@field.luadoc"]                 = { fg = newpaper.tex_math_delim,  style = style.doc_style,   nocombine = true },
            ["@function.macro.luadoc"]        = { fg = newpaper.tex_magenta,     style = style.doc_style,   nocombine = true },
            ["@include.luadoc"]               = { fg = newpaper.tex_red,         style = style.doc_k_style, nocombine = true },
            ["@keyword.coroutine.luadoc"]     = { fg = newpaper.tex_lightpurple, style = style.doc_k_style, nocombine = true },
            ["@keyword.function.luadoc"]      = { fg = newpaper.tex_navy,        style = style.doc_k_style, nocombine = true },
            ["@keyword.luadoc"]               = { fg = newpaper.tex_keyword,     style = style.doc_k_style, nocombine = true },
            ["@keyword.return.luadoc"]        = { fg = newpaper.ruby_purple,     style = style.doc_k_style, nocombine = true },
            ["@namespace.luadoc"]             = { fg = newpaper.tex_string,      style = style.doc_style,   nocombine = true },
            ["@operator.luadoc"]              = { fg = newpaper.lua_navy,        style = style.doc_style,   nocombine = true },
            ["@parameter.luadoc"]             = { fg = newpaper.tex_orange,      style = style.doc_style,   nocombine = true },
            ["@punctuation.bracket.luadoc"]   = { fg = newpaper.tex_navy,        style = style.doc_style,   nocombine = true },
            ["@punctuation.delimiter.luadoc"] = { fg = newpaper.tex_orange,      style = style.doc_style,   nocombine = true },
            ["@punctuation.special.luadoc"]   = { fg = newpaper.tex_maroon,      style = style.doc_style,   nocombine = true },
            ["@string.luadoc"]                = { fg = newpaper.regexp_blue,     style = style.doc_style,   nocombine = true },
            ["@string.special.luadoc"]        = { fg = newpaper.tex_ch_brown,    style = style.doc_style,   nocombine = true },
            ["@text.uri.luadoc"]              = { fg = newpaper.regexp_blue,     style = style.links,       nocombine = true },
            ["@type.builtin.luadoc"]          = { fg = newpaper.bluegreen,       style = style.doc_style,   nocombine = true },
            ["@type.builtin.number.luadoc"]   = { fg = newpaper.numbers,         style = style.doc_k_style, nocombine = true },
            ["@type.builtin.string.luadoc"]   = { fg = newpaper.strings,         style = style.doc_k_style, nocombine = true },
            ["@type.luadoc"]                  = { fg = newpaper.tex_math,        style = style.doc_style,   nocombine = true },
            ["@type.qualifier.luadoc"]        = { fg = newpaper.ruby_maroon,     style = style.doc_k_style, nocombine = true },
            ["@variable.builtin.luadoc"]      = { fg = newpaper.tex_olive,       style = style.doc_style,   nocombine = true },
            ["@variable.luadoc"]              = { fg = newpaper.tex_tikz_green,  style = style.doc_style,   nocombine = true },
        }
        return treesitter
    end

    -- stylua: ignore end

    return luadocSyn
end

return M
