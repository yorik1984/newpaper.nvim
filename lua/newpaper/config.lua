local check = require("newpaper.check")

local M = {}

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
    style               = "light",
    lightness           = false,
    saturation          = false,
    greyscale           = false,
    editor_better_view  = true,
    terminal            = M.term_opt.contrast,
    sidebars_contrast   = {},
    contrast_float      = true,
    contrast_telescope  = true,
    operators_bold      = true,
    delimiters_bold     = false,
    brackets_bold       = false,
    delim_rainbow_bold  = false,
    booleans            = "bold",
    keywords            = "bold",
    doc_keywords        = "bold,italic",
    regex               = "bold",
    regex_bg            = true,
    tags                = "bold",
    tags_brackets_bold  = true,
    tex_major           = "bold",
    tex_operators_bold  = true,
    tex_brackets_bold   = false,
    tex_math_delim_bold = false,
    tex_keywords        = "NONE",
    tex_zone            = "italic",
    tex_arg             = "italic",
    error_highlight     = "undercurl",
    italic_strings      = true,
    italic_comments     = true,
    italic_doc_comments = true,
    italic_functions    = false,
    italic_variables    = false,
    borders             = true,
    disable_background  = false,
    lsp_virtual_text_bg = true,
    hide_eob            = false,
    colors              = {},
    colors_advanced     = {},
    custom_highlights   = {},
    lualine_bold        = true,
}
local function sanitize_for_gvar(tbl, depth)
    depth = depth or 4
    if type(tbl) ~= "table" or depth <= 0 then return nil end
    local out = {}
    for k, v in pairs(tbl) do
        if type(k) ~= "string" and type(k) ~= "number" then
        else
            if type(v) == "string" or type(v) == "number" or type(v) == "boolean" then
                out[k] = v
            elseif type(v) == "table" then
                local nested = sanitize_for_gvar(v, depth - 1)
                if nested ~= nil then out[k] = nested end
            else
            end
        end
    end
    return out
end

function M.sync_gvars()
    if type(vim) ~= "table" or type(vim.g) ~= "table" then return end
    vim.g.newpaper_colors = sanitize_for_gvar(M.config.colors, 4) or {}
    vim.g.newpaper_lualine_bold = M.config.lualine_bold
end

M.config = vim.deepcopy(M.defaults)

---@param user_settings table?
function M.setup(user_settings)
    user_settings = user_settings or {}

    check.validateUserSettings(user_settings)

    for _, key in ipairs({ "sidebars_contrast", "colors", "colors_advanced", "custom_highlights" }) do
        check.notTableError(key, user_settings[key])
    end

    check.keyExistsError(user_settings, M.defaults, "Option")

    check.typeError(user_settings)

    M.config = vim.tbl_deep_extend("force", {}, M.defaults, user_settings)

    for k, v in pairs(M.config) do
        if v == 0 then
            M.config[k] = false
        end
    end
    M.sync_gvars()
end

return M
