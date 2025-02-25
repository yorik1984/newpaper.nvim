local check = require("newpaper.check")

vim = vim or { g = {}, o = {} }

local opt = function(key, default)
    key = "newpaper_" .. key
    if vim.g[key] == nil then
        return default
    else
        if vim.g[key] == 0 then
            return false
        else
            return vim.g[key]
        end
    end
end

-- stylua: ignore start

local term_opt = {
    bg                  = "bg",
    contrast            = "contrast",
    inverse             = "inverse",
    inverse_transparent = "inverse_transparent",
}

local hsluv_opt = {
    hue        = "hue",
    lightness  = "lightness",
    saturation = "saturation",
}

local greyscale_opt = {
    lightness  = "lightness",
    average    = "average",
    luminosity = "luminosity",
}

local config = {
    style               = opt("style", "light"),
    lightness           = opt(hsluv_opt.lightness, false),
    saturation          = opt(hsluv_opt.saturation, false),
    greyscale           = opt("greyscale", false),
    editor_better_view  = opt("editor_better_view", true),
    terminal            = opt("terminal", term_opt.contrast),
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
    devicons_custom     = opt("devicons_custom", {}),
}

local applyConfiguration = function(userConfig)
    local error_help = {
        sidebars_contrast = "Use: sidebars_contrast = { 'name' }",
        colors            = "Use: colors = { name = color }",
        colors_advanced   = "Use: colors_advanced = { name = color }",
        custom_highlights = "Use: custom_highlights = { hlGroup = { arg = color } }",
        devicons_custom   = "Use: devicons_custom = { gui = '#XXXXXX', cterm = number(0-15) }. See :help cterm-colors",
    }

    -- stylua: ignore end

    for key, help in pairs(error_help) do
        check.notTableError(key, userConfig[key], help)
    end
    for key, value in pairs(userConfig) do
        if value ~= nil then
            check.keyExistsError(userConfig, config, "Option", "See :help newpaper.nvim-configuration")
            config[key] = value
        end
    end
end

return {
    config = config,
    applyConfiguration = applyConfiguration,
    term_opt = term_opt,
    hsluv_opt = hsluv_opt,
    greyscale_opt = greyscale_opt,
}
