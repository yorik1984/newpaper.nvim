local check     = require("newpaper.check")

local M         = {}

--- @class TermOptions
--- @field bg string                  -- identifier for background variant (e.g. "bg" | "transparent")
--- @field contrast string            -- identifier for contrast variant (e.g. "contrast" | "high")
--- @field inverse string             -- identifier for inverted variant (e.g. "inverse")
--- @field inverse_transparent string -- identifier for inverted transparent variant
M.term_opt      = {
    bg                  = "bg",
    contrast            = "contrast",
    inverse             = "inverse",
    inverse_transparent = "inverse_transparent",
}

--- @class HSLuvOptions
--- @field hue string        -- name for hue option (e.g. "hue")
--- @field lightness string  -- name for lightness option (e.g. "lightness")
--- @field saturation string -- name for saturation option (e.g. "saturation")
M.hsluv_opt     = {
    hue        = "hue",
    lightness  = "lightness",
    saturation = "saturation",
}

--- @class GreyscaleOptions
--- @field lightness string   -- key for lightness
--- @field average string     -- key for average
--- @field luminosity string  -- key for luminosity weighting
M.greyscale_opt = {
    lightness  = "lightness",
    average    = "average",
    luminosity = "luminosity",
}

--- @class PresetOpt
--- @field by_filetype table<string, string[]>  -- mapping: preset_name -> list of filetypes (e.g. { "markdown", "text" })
--- @field by_filename table<string, string[]>  -- mapping: preset_name -> list of filename glob patterns (e.g. { "*.md", "*.TODO" })
M.preset_opt    = {
    by_filetype = {
        text = {}, -- e.g. { "markdown", "text" }
        task = {}, -- e.g. { "todo" }
        view = {}, -- e.g. { "log" }
    },

    by_filename = {
        text = {}, -- e.g. { "*.md", "*.txt" }
        task = {}, -- e.g. { "*.TODO", "*.todo" }
        view = {}, -- e.g. { "LICENSE" }
    },
}

--- This annotation enforces that only the listed keys are present:
---   - Top-level: "preset" (Config)
---   - PresetSpec: "by_filetype" and "by_filename"
---   - PresetByKind: allowed preset names "text", "task", "view"
---
--- Use these annotations with the Lua language server / EmmyLua for stronger
--- static hints and to make intent explicit: any other keys are considered invalid.
---
--- @class PresetByKind
--- @field text string[]  @list of strings: for by_filetype => filetype names; for by_filename => glob patterns
--- @field task string[]  @list of strings: for by_filetype => filetype names; for by_filename => glob patterns
--- @field view string[]  @list of strings: for by_filetype => filetype names; for by_filename => glob patterns
--- @class PresetSpec
--- @field by_filetype PresetByKind  @only these fields ("text","task","view") are allowed in this section
--- @field by_filename PresetByKind  @only these fields ("text","task","view") are allowed in this section
--- Notes:
--- - Elements of by_filetype[...] are strings representing filetypes (e.g. "markdown", "lua").
--- - Elements of by_filename[...] are strings representing filename glob patterns (e.g. "*.TODO", "README.md").
--- - The implementation may perform runtime validation and report an error if any unexpected keys appear.
---
--- @class Defaults
--- @field style "light"|"dark"|"auto"
--- @field preset PresetSpec  @main preset configuration table (only the keys declared above are allowed)
--- @field lightness boolean|number
--- @field saturation boolean|number
--- @field greyscale "lightness"|"average"|"luminosity"|false
--- @field editor_better_view boolean
--- @field terminal string
--- @field sidebars_contrast table
--- @field contrast_float boolean
--- @field contrast_telescope boolean
--- @field operators_bold boolean
--- @field delimiters_bold boolean
--- @field brackets_bold boolean
--- @field delim_rainbow_bold boolean
--- @field booleans string
--- @field booleans_operators string
--- @field keywords string
--- @field doc_keywords string
--- @field regex string
--- @field regex_bg boolean
--- @field tags string
--- @field tags_brackets_bold boolean
--- @field tex_major string
--- @field tex_operators_bold boolean
--- @field tex_brackets_bold boolean
--- @field tex_math_delim_bold boolean
--- @field tex_keywords string
--- @field tex_zone string
--- @field tex_arg string
--- @field error_highlight "bg"|"undercurl"|"both"|"NONE"
--- @field diff_highlight "fg"|"bg"|"both"
--- @field italic_strings boolean
--- @field italic_comments boolean
--- @field italic_doc_comments boolean
--- @field italic_functions boolean
--- @field italic_variables boolean
--- @field borders boolean
--- @field disable_background boolean
--- @field lsp_virtual_text_bg boolean
--- @field hide_eob boolean
--- @field colors table
--- @field colors_advanced table
--- @field custom_highlights table
--- @field lualine_bold boolean
M.defaults      = {
    -- Visual / behavioral defaults
    style               = "light",
    preset              = {},
    lightness           = false,
    saturation          = false,
    greyscale           = false,
    editor_better_view  = true,
    terminal            = M.term_opt.contrast,
    sidebars_contrast   = {},
    contrast_float      = true,
    contrast_telescope  = true,

    -- Syntax element styling
    operators_bold      = true,
    delimiters_bold     = false,
    brackets_bold       = false,
    delim_rainbow_bold  = false,

    booleans            = "bold",
    booleans_operators  = "bold",
    keywords            = "bold",
    doc_keywords        = "bold,italic",
    regex               = "bold",
    regex_bg            = true,
    tags                = "bold",
    tags_brackets_bold  = true,

    -- TeX / LaTeX specific options
    tex_major           = "bold",
    tex_operators_bold  = true,
    tex_brackets_bold   = false,
    tex_math_delim_bold = false,
    tex_keywords        = "NONE",
    tex_zone            = "italic",
    tex_arg             = "italic",

    -- Miscellaneous
    error_highlight     = "undercurl",
    diff_highlight      = "bg",
    italic_strings      = true,
    italic_comments     = true,
    italic_doc_comments = true,
    italic_functions    = false,
    italic_variables    = false,
    borders             = true,
    disable_background  = false,
    lsp_virtual_text_bg = true,
    hide_eob            = false,

    -- Color tables and advanced settings
    colors              = {}, -- expected map<string, hex>, e.g. { bg = "#1f1f1f", fg = "#f5f5f5" }
    colors_advanced     = {}, -- like colors specific color variants / options
    custom_highlights   = {}, -- example: { MyGroup = { fg = "#000000", bg = "#FFFFFF", bold = true } }

    -- Integrations
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

    check.typeError(user_settings)

    if user_settings.preset ~= nil then
        check.validatePreset(user_settings.preset)
    end

    check.keyExistsError(user_settings, M.defaults, "Option")

    M.config = vim.tbl_deep_extend("force", {}, M.defaults, user_settings)

    for k, v in pairs(M.config) do
        if v == 0 then
            M.config[k] = false
        end
    end
    M.sync_gvars()
end

return M
