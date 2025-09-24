local check = require("newpaper.check")

local M = {}
vim = vim or { g = {}, o = {} }

local function opt(key, default)
    local v = vim.g["newpaper_" .. key]
    if v == nil then
        return default
    elseif v == 0 then
        return false
    else
        return v
    end
end

M.term_opt = {
    bg                  = "bg",
    contrast            = "contrast",
    inverse             = "inverse",
    inverse_transparent = "inverse_transparent",
}

M.hsluv_opt = {
    hue        = "hue",
    lightness  = "lightness",
    saturation = "saturation",
}

M.greyscale_opt = {
    lightness  = "lightness",
    average    = "average",
    luminosity = "luminosity",
}

M.defaults = {
    style               = opt("style", "light"),
    lightness           = opt(M.hsluv_opt.lightness, false),
    saturation          = opt(M.hsluv_opt.saturation, false),
    greyscale           = opt("greyscale", false),
    editor_better_view  = opt("editor_better_view", true),
    terminal            = opt("terminal", M.term_opt.contrast),
    sidebars_contrast   = opt("sidebars_contrast", {}),
    contrast_float      = opt("contrast_float", true),
    contrast_telescope  = opt("contrast_telescope", true),
    operators_bold      = opt("operators_bold", true),
    delimiters_bold     = opt("delimiters_bold", false),
    brackets_bold       = opt("brackets_bold", false),
    delim_rainbow_bold  = opt("delim_rainbow_bold", false),
    booleans            = opt("booleans", "bold"),
    keywords            = opt("keywords", "bold"),
    doc_keywords        = opt("doc_keywords", "bold,italic"),
    regex               = opt("regex", "bold"),
    regex_bg            = opt("regex_bg", true),
    tags                = opt("tags", "bold"),
    tags_brackets_bold  = opt("tags_brackets_bold", true),
    tex_major           = opt("tex_major", "bold"),
    tex_operators_bold  = opt("tex_operators_bold", true),
    tex_brackets_bold   = opt("tex_brackets_bold", false),
    tex_math_delim_bold = opt("tex_math_delim_bold", false),
    tex_keywords        = opt("tex_keywords", "NONE"),
    tex_zone            = opt("tex_zone", "italic"),
    tex_arg             = opt("tex_arg", "italic"),
    error_highlight     = opt("error_highlight", "undercurl"),
    italic_strings      = opt("italic_strings", true),
    italic_comments     = opt("italic_comments", true),
    italic_doc_comments = opt("italic_doc_comments", true),
    italic_functions    = opt("italic_functions", false),
    italic_variables    = opt("italic_variables", false),
    borders             = opt("borders", true),
    disable_background  = opt("disable_background", false),
    lsp_virtual_text_bg = opt("lsp_virtual_text_bg", true),
    hide_eob            = opt("hide_eob", false),
    colors              = opt("colors", {}),
    colors_advanced     = opt("colors_advanced", {}),
    custom_highlights   = opt("custom_highlights", {}),
    lualine_bold        = opt("lualine_bold", true),
    lualine_style       = opt("lualine_style", "light"),
}

M.config = vim.deepcopy(M.defaults)

---@param user_settings table?
function M.setup(user_settings)
    user_settings = user_settings or {}

    for _, key in ipairs({ "sidebars_contrast", "colors", "colors_advanced", "custom_highlights" }) do
        check.notTableError(key, user_settings[key])
    end

    check.keyExistsError(user_settings, M.defaults, "Option")

    check.typeError(user_settings)

    M.config = vim.tbl_deep_extend("force", {}, M.defaults, user_settings)
end

return M
