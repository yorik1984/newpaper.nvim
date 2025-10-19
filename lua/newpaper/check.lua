---@class newpaper.check
local M = {}

M.error_help = {
    preset            =
    [[ preset = {
        by_filetype = {
            text = { "<filetype>" },
            task = { "<filetype>" },
        },
        by_filename  = {
            text = { "<pattern>" },
            task = { "<pattern>" },
    }]],
    sidebars_contrast = "Use: sidebars_contrast = { 'name' }",
    colors            = "Use: colors = { name = color }",
    colors_advanced   = "Use: colors_advanced = { name = color }",
    custom_highlights = "Use: custom_highlights = { hlGroup = { arg = color } }",
}

---@alias ValidatorType "string" | "boolean" | "table"
---@type table<string, ValidatorType>
M.validators = {
    preset             = "table",
    sidebars_contrast  = "table",
    colors             = "table",
    colors_advanced    = "table",
    custom_highlights  = "table",
    style              = "string",
    terminal           = "string",
    editor_better_view = "boolean",
}

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

---@param key string
---@param value any
function M.notTableError(key, value)
    if value ~= nil and type(value) ~= "table" then
        local help = M.error_help and M.error_help[key] or ""
        error(string.format(
            "newpaper.nvim: user config.%s = %s is not a table. %s",
            key, tostring(value), help
        ), 2)
    end
end

---@param userConfig table
---@param config table
---@param key_type string
---@param help string?
function M.keyExistsError(userConfig, config, key_type, help)
    for key, _ in pairs(userConfig or {}) do
        if config[key] == nil then
            local hint = ""
            if help and help ~= "" then
                hint = " " .. tostring(help)
            elseif M.error_help and M.error_help[key] then
                hint = " " .. tostring(M.error_help[key])
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

---@param userConfig table
function M.typeError(userConfig)
    for key, value in pairs(userConfig or {}) do
        local expected = M.validators[key]
        if expected and type(value) ~= expected then
            error(string.format(
                "newpaper.nvim: Invalid type for config.%s. Expected %s, got %s",
                key, expected, type(value)
            ))
        end
    end
end

--- Validate user_settings argument for setup
---@param user_settings any
function M.validateUserSettings(user_settings)
    if user_settings ~= nil and type(user_settings) ~= "table" then
        error("newpaper.nvim: setup: user_settings must be a table or nil", 2)
    end
end

--- Usage:
---   local ok, errmsg = errs_mod.validate(opts, scope, win, custom_errs, allowed_spec)
---   if not ok then
---     if errmsg then error(errmsg) end
---     return false
---   end
--- @param opts table|nil         Options table to validate
--- @param scope string|nil       "local" or "global"
--- @param win number|nil         window id (required when scope == "local")
--- @param allowed_spec table     mapping option_key -> spec string
---                               allowed spec values: "boolean", "number", "string", "number_or_string"
--- @return boolean ok            true if validation passed
--- @return string|nil errmsg     formatted error message if validation failed and should error;
---                               nil means "nothing to do" (opts missing) or validation failed but not error (use caller behavior)
M.validateApplyWinHl = function(opts, scope, win, allowed_spec)
    local DEFAULT_ERRS = {
        invalid_scope           = "newpaper-applyWinHl: scope must be 'local' or 'global'",
        invalid_win             = "newpaper-applyWinHl: win must be a window id (number) when scope is 'local'",
        expect_boolean          = "newpaper-applyWinHl: option '%s' expects boolean, got %s",
        expect_number           = "newpaper-applyWinHl: option '%s' expects number (0..100), got %s",
        expect_number_or_string = "newpaper-applyWinHl: option '%s' expects number or string, got %s",
        expect_string           = "newpaper-applyWinHl: option '%s' expects string, got %s",
    }
    -- If opts not provided or not a table, caller treats it as "nothing to do"
    if not opts or type(opts) ~= "table" then
        return false, nil
    end

    scope = scope or "local"
    if scope ~= "local" and scope ~= "global" then
        return false, DEFAULT_ERRS.invalid_scope
    end

    if scope == "local" then
        win = win or vim.api.nvim_get_current_win()
        if type(win) ~= "number" then
            return false, DEFAULT_ERRS.invalid_win
        end
    end

    -- allowed_spec is required to validate option types
    if not allowed_spec or type(allowed_spec) ~= "table" then
        -- if allowed_spec missing, we cannot validate per-option types; treat as ok.
        return true, nil
    end

    for key, spec in pairs(allowed_spec) do
        local val = opts[key]
        if val ~= nil then
            if spec == "boolean" then
                if type(val) ~= "boolean" then
                    return false, string.format(DEFAULT_ERRS.expect_boolean, key, type(val))
                end
            elseif spec == "number" then
                if type(val) ~= "number" then
                    return false, string.format(DEFAULT_ERRS.expect_number, key, type(val))
                end
            elseif spec == "string" then
                if type(val) ~= "string" then
                    return false, string.format(DEFAULT_ERRS.expect_string, key, type(val))
                end
            elseif spec == "number_or_string" then
                if not (type(val) == "number" or type(val) == "string") then
                    return false, string.format(DEFAULT_ERRS.expect_number_or_string, key, type(val))
                end
            else
                -- unknown spec: skip validation for this key
            end
        end
    end

    return true, nil
end

return M
