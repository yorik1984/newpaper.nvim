local M = {}

function M.contains(tbl, value)
    if type(tbl) ~= "table" then
        return false
    end

    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end

    return false
end

---@param value string
---@return boolean
function M.isHex(value)
    if type(value) ~= "string" then
        return false
    end
    return value:match("^#%x%x%x%x%x%x$") ~= nil
end

---@param plugin string
---@return boolean
function M.isLoaded(plugin)
    local ok, _ = pcall(require, plugin)
    return ok
end

---@param userConfig table
---@param config table
---@param key_type string
---@param help string?
function M.keyExistsError(userConfig, config, key_type, help)
    local error_help = {
        sidebars_contrast = "Use: sidebars_contrast = { 'name' }",
        colors            = "Use: colors = { name = color }",
        colors_advanced   = "Use: colors_advanced = { name = color }",
        custom_highlights = "Use: custom_highlights = { hlGroup = { arg = color } }",
    }
    for key, _ in pairs(userConfig or {}) do
        if config[key] == nil then
            local hint = ""
            if help and help ~= "" then
                hint = " " .. tostring(help)
            elseif error_help and error_help[key] then
                hint = " " .. tostring(error_help[key])
            end

            error(string.format(
                "newpaper.nvim: %s `%s` does not exist.%s",
                key_type or "Option", key, hint
            ), 2)
        end
    end
end

---@param plugin string
---@param help string?
function M.requiresPluginError(plugin, help)
    if not M.isLoaded(plugin) then
        help = help or ""
        error(string.format(
            "newpaper.nvim: Plugin `%s` not loaded or not installed. %s",
            plugin, help
        ))
    end
end

--- Validate user_settings argument for setup
---@param user_settings any
function M.validateUserSettings(user_settings)
    if user_settings ~= nil and type(user_settings) ~= "table" then
        error("newpaper.nvim: Error in `setup(config)`. `config` must be a table or nil", 2)
    end
end

---@param userConfig table
function M.typeError(userConfig)
    -- Rules:
    --   - validators[key] = "string"  -> compare type(value) == "string"
    --   - validators[key] = { ... }   -> if all elements are primitive type names ("string","number","boolean","table")
    --                                  then treat as allowed types list;
    --                                otherwise treat as enumeration of allowed literal values (string/number/boolean)
    -- Only top-level fields of userConfig are checked. No deep inspection of tables.
    local function is_primitive_type_name(s)
        return s == "string" or s == "number" or s == "boolean" or s == "table"
    end

    local function table_all_types(tbl)
        if type(tbl) ~= "table" or #tbl == 0 then return false end
        for _, v in ipairs(tbl) do
            if type(v) ~= "string" or not is_primitive_type_name(v) then
                return false
            end
        end
        return true
    end

    local function value_in_literals(value, literals)
        for _, lit in ipairs(literals) do
            if value == lit then
                return true
            end
        end
        return false
    end

    local validators = {
        style               = { "light", "dark", "auto" },                     -- ENUM: allowed literal strings
        preset              = "table",                                         -- preset table
        lightness           = { "boolean", "number" },                         -- allowed types
        saturation          = { "boolean", "number" },                         -- allowed types
        greyscale           = { "lightness", "average", "luminosity", false }, -- ENUM: allowed literal strings OR boolean false

        editor_better_view  = "boolean",
        terminal            = "string",

        sidebars_contrast   = "table",
        contrast_float      = "boolean",
        contrast_telescope  = "boolean",

        operators_bold      = "boolean",
        delimiters_bold     = "boolean",
        brackets_bold       = "boolean",
        delim_rainbow_bold  = "boolean",

        booleans            = "string",
        booleans_operators  = "string",
        keywords            = "string",
        doc_keywords        = "string",
        regex               = "string",
        regex_bg            = "boolean",
        tags                = "string",
        tags_brackets_bold  = "boolean",

        tex_major           = "string",
        tex_operators_bold  = "boolean",
        tex_brackets_bold   = "boolean",
        tex_math_delim_bold = "boolean",
        tex_keywords        = "string",
        tex_zone            = "string",
        tex_arg             = "string",

        error_highlight     = "string",
        italic_strings      = "boolean",
        italic_comments     = "boolean",
        italic_doc_comments = "boolean",
        italic_functions    = "boolean",
        italic_variables    = "boolean",
        borders             = "boolean",
        disable_background  = "boolean",
        lsp_virtual_text_bg = "boolean",
        hide_eob            = "boolean",

        colors              = "table",
        colors_advanced     = "table",
        custom_highlights   = "table",

        lualine_bold        = "boolean",
    }

    local function is_allowed_type_or_value(value, expected)
        if type(expected) == "string" then
            return type(value) == expected
        end

        if type(expected) == "table" then
            if table_all_types(expected) then
                for _, t in ipairs(expected) do
                    if type(value) == t then
                        return true
                    end
                end
                return false
            else
                return value_in_literals(value, expected)
            end
        end

        return false
    end
    for key, value in pairs(userConfig or {}) do
        local expected = validators[key]
        if expected ~= nil then
            if not is_allowed_type_or_value(value, expected) then
                local expected_repr
                if type(expected) == "string" then
                    expected_repr = expected
                else
                    if table_all_types(expected) then
                        expected_repr = "{" .. table.concat(expected, ",") .. "}"
                    else
                        local reprs = {}
                        for _, v in ipairs(expected) do
                            if type(v) == "string" then
                                reprs[#reprs + 1] = ("'%s'"):format(v)
                            else
                                reprs[#reprs + 1] = tostring(v)
                            end
                        end
                        expected_repr = "[" .. table.concat(reprs, ", ") .. "]"
                    end
                end
                error(string.format(
                    "newpaper.nvim: Invalid value/type for config.%s. Expected %s, got %s",
                    key, expected_repr, type(value)
                ))
            end
        end
    end
end

--- Usage:
---   local ok, errmsg = errs_mod.validate(opts, scope, win, allowed_spec)
---   if not ok then
---     if errmsg then error(errmsg) end
---     return false
---   end
--- @param opts table|nil         Options table to validate
--- @param scope string|nil       "local" or "global"
--- @param win number|nil         window id (required when scope == "local")
--- @param allowed_spec table     mapping option_key -> spec string
---                               allowed spec values: "boolean", "number", "string"
--- @return boolean ok            true if validation passed
--- @return string|nil errmsg     formatted error message if validation failed and should error;
---                               nil means "nothing to do" (opts missing) or validation failed but not error (use caller behavior)
M.validateApplyWinHl = function(opts, scope, win, allowed_spec)
    local DEFAULT_ERRS = {
        invalid_opts            = "newpaper.nvim-applyWinHl: opts must be a table",
        invalid_scope           = "newpaper.nvim-applyWinHl: scope must be 'local' or 'global'",
        invalid_win             = "newpaper.nvim-applyWinHl: win must be a window id (number) when scope is 'local'",
        expect_boolean          = "newpaper.nvim-applyWinHl: option '%s' expects boolean, got %s",
        expect_number           = "newpaper.nvim-applyWinHl: option '%s' expects number (0..100), got %s",
        expect_string           = "newpaper.nvim-applyWinHl: option '%s' expects string, got %s",
    }

    if not opts or type(opts) ~= "table" then
        error(DEFAULT_ERRS.invalid_opts)
    end

    scope = scope or "local"
    if scope ~= "local" and scope ~= "global" then
        error(DEFAULT_ERRS.invalid_scope)
    end

    if scope == "local" then
        win = win or vim.api.nvim_get_current_win()
        if type(win) ~= "number" then
            error(DEFAULT_ERRS.invalid_win)
        end
    end

    if not allowed_spec or type(allowed_spec) ~= "table" then
        return true, nil
    end

    for key, spec in pairs(allowed_spec) do
        local val = opts[key]
        if val ~= nil then
            if spec == "boolean" then
                if type(val) ~= "boolean" then
                    error(string.format(DEFAULT_ERRS.expect_boolean, key, type(val)))
                end
            elseif spec == "number" then
                if type(val) ~= "number" then
                    error(string.format(DEFAULT_ERRS.expect_number, key, type(val)))
                end
            elseif spec == "string" then
                if type(val) ~= "string" then
                    error(string.format(DEFAULT_ERRS.expect_string, key, type(val)))
                end
            else
                -- unknown spec: skip validation for this key
            end
        end
    end

    return true, nil
end

--- Validate a `preset` table.
--- @param preset table
--- @return boolean, nil
function M.validatePreset(preset)
    local error_help = {
        preset =
        [[
Use:
preset = {
    by_filetype = {
        text = { "<filetype1>", "<filetype2>", ... },
        task = { "<filetype1>", "<filetype2>", ... },
        view = { "<filetype1>", "<filetype2>", ... },
    },
    by_filename  = {
        text = { "<pattern1>", "<pattern2>", ... },
        task = { "<pattern1>", "<pattern2>", ... },
        view = { "<pattern1>", "<pattern2>", ... },
    },
}
]],
    }

    local DEFAULT_ERRS = {
        PRESET_MUST_BE_TABLE         = "newpaper.nvim: `config.preset` must be a table. " .. error_help.preset,
        INVALID_TOP_KEY              = "newpaper.nvim: invalid top-level key in preset: '%s'. " ..
            "Allowed keys: by_filetype, by_filename. " .. error_help.preset,
        PRESET_SECTION_NOT_TABLE     = "newpaper.nvim: preset.%s must be a table.",
        INVALID_PRESET_NAME          = "newpaper.nvim: invalid preset name '%s' in preset.%s. " ..
            "Allowed names: text, task, view. " .. error_help.preset,
        PRESET_VALUE_NOT_TABLE       = "newpaper.nvim: preset.%s.%s must be a table (array of strings). " ..
        error_help.preset,
        PRESET_VALUE_ITEM_NOT_STRING = "newpaper.nvim: preset.%s.%s[%d] must be a string. " .. error_help.preset,
    }

    if type(preset) ~= "table" then
        error(DEFAULT_ERRS.PRESET_MUST_BE_TABLE)
    end

    local allowed_top = {
        by_filetype = true,
        by_filename = true,
    }
    local allowed_presets = {
        text = true,
        task = true,
        view = true,
    }

    for k, v in pairs(preset) do
        if not allowed_top[k] then
            error(DEFAULT_ERRS.INVALID_TOP_KEY:format(tostring(k)))
        end
        if type(v) ~= "table" then
            error(DEFAULT_ERRS.PRESET_SECTION_NOT_TABLE:format(k))
        end
    end

    for _, section in ipairs({ "by_filetype", "by_filename" }) do
        local section_tbl = preset[section]
        if section_tbl ~= nil then
            if type(section_tbl) ~= "table" then
                error(DEFAULT_ERRS.PRESET_SECTION_NOT_TABLE:format(section))
            end
            for preset_name, patterns in pairs(section_tbl) do
                if not allowed_presets[preset_name] then
                    error(DEFAULT_ERRS.INVALID_PRESET_NAME:format(tostring(preset_name), section))
                end
                if type(patterns) ~= "table" then
                    error(DEFAULT_ERRS.PRESET_VALUE_NOT_TABLE:format(section, preset_name))
                end
                for i, p in ipairs(patterns) do
                    if type(p) ~= "string" then
                        error(DEFAULT_ERRS.PRESET_VALUE_ITEM_NOT_STRING:format(section, preset_name, i))
                    end
                end
            end
        end
    end

    return true, nil
end

return M
