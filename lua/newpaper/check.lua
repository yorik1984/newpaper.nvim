---@class newpaper.check
local M = {}

M.error_help = {
    sidebars_contrast  = "Use: sidebars_contrast = { 'name' }",
    colors             = "Use: colors = { name = color }",
    colors_advanced    = "Use: colors_advanced = { name = color }",
    custom_highlights  = "Use: custom_highlights = { hlGroup = { arg = color } }",
}

---@alias ValidatorType "string" | "boolean" | "table"
---@type table<string, ValidatorType>
M.validators = {
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

return M
