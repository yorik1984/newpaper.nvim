local M = {}

function M.setupStyle(config)

    -- stylua: ignore start

    local style = {
        -- default styles
        none          = "NONE",
        bold          = "bold",
        italic        = "italic",
        underline     = "underline",
        undercurl     = "undercurl",
        reverse       = "reverse",

        b_bold        = "NONE", -- editor style bold
        b_italic      = "NONE", -- editor style italic
        b_bold_i      = "NONE", -- editor style bold italic
        b_bold_u      = "NONE", -- editor style bold underline
        c_style       = "NONE", -- comments style
        o_style       = "NONE", -- operators style
        d_style       = "NONE", -- delimiters style
        br_style      = "NONE", -- brackets style
        tb_style      = "NONE", -- tags brackets style
        s_style       = "NONE", -- strings style
        v_style       = "NONE", -- variables style
        f_style       = "NONE", -- functions style
        comment_title = "NONE", -- magic and tittle comments in VimL, Ruby and others

        -- Spell style
        error = "NONE",

        -- Make keywords bold or italic
        k_style = config.keywords,

        -- Tex settings
        tex_m_style  = config.tex_major,
        tex_k_style  = config.tex_keywords,
        tex_z_style  = config.tex_zone,
        tex_a_style  = config.tex_arg,
        tex_o_style  = "NONE", -- operators style
        tex_br_style = "NONE", -- brackets style
        tex_md_style = "NONE", -- math delim style

    }
    -- Combine style
    style.bold_i      = style.bold .. "," .. style.italic
    style.bold_u      = style.bold .. "," .. style.underline
    style.italic_u    = style.italic .. "," .. style.underline

    -- HTML tag styles
    style.tag_style   = config.tags
    style.link        = style.italic_u
    style.b_link      = style.bold_u

    -- comments style underline
    style.c_underline = style.underline

    -- strings style underline
    style.s_underline = style.underline

    -- Make bold or italic style for editor groups
    if config.editor_better_view then
        style.b_bold   = style.bold
        style.b_italic = style.italic
        style.b_bold_i = style.bold_i
        style.b_bold_u = style.bold_u
    end

    if config.operators_bold then
        style.o_style = style.bold
    end

    if config.delimiters_bold then
        style.d_style = style.bold
    end

    if config.brackets_bold then
        style.br_style = style.bold
    end

    if config.tags_brackets_bold then
        style.tb_style = style.bold
    end

    -- Tex settings
    if config.tex_operators_bold then
        style.tex_o_style = style.bold
    end

    if config.tex_brackets_bold then
        style.tex_br_style = style.bold
    end

    if config.tex_math_delim_bold then
        style.tex_md_style = style.bold
    end

    -- Error style
    if config.error_highlight == "undercurl" or config.error_highlight == "both" then
        style.error = style.undercurl
    end

    -- Make italic strings
    if config.italic_strings then
        style.s_style = style.italic
        style.s_underline = style.s_style .. "," .. style.underline
    end

    -- Make italic comments
    if config.italic_comments then
        style.c_style = style.italic
        style.c_underline = style.c_style .. "," .. style.underline
    end

    -- Make italic functions
    if config.italic_functions then
        style.f_style = style.italic
    end

    -- Make italic variable
    if config.italic_variables then
        style.v_style = style.italic
    end

    -- comment for VimL
    if config.italic_comments and config.keywords then
        style.comment_title = style.bold_i
    elseif config.keywords then
        style.comment_title = style.k_style
    else
        style.comment_title = style.c_style
    end

    return style
end

-- stylua: ignore end

return M
