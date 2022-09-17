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

local config = {
    style               = opt("style", "light"),
    editor_better_view  = opt("editor_better_view", true),
    terminal            = opt("terminal", term_opt.contrast),
    sidebars_contrast   = opt("sidebars_contrast", {}),
    contrast_float      = opt("contrast_float", true),
    contrast_telescope  = opt("contrast_telescope", true),
    operators_bold      = opt("operators_bold", true),
    keywords            = opt("keywords", "bold"),
    tags                = opt("tags", "bold"),
    tex_major           = opt("tex_major", "bold"),
    tex_operators_bold  = opt("tex_operators_bold", true),
    tex_keywords        = opt("tex_keywords", "NONE"),
    tex_zone            = opt("tex_zone", "italic"),
    tex_arg             = opt("tex_arg", "italic"),
    error_highlight     = opt("error_highlight", "undercurl"),
    italic_strings      = opt("italic_strings", true),
    italic_comments     = opt("italic_comments", true),
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
        custom_highlights = "Use: custom_highlights = { hlGroup = { arg = color } }",
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

return { config = config, applyConfiguration = applyConfiguration, term_opt = term_opt }
