local M = {}

function M.isHex(value)
    if value == nil then
        return false
    elseif string.sub(tostring(value), 1, 1) == "#" and #tostring(value) == 7 then
        return true
    else
        return false
    end
end

function M.isLoaded(plugin)
    local ok, _ = pcall(require, plugin)
    if not ok then
        return false
    end
    return true
end

function M.notTableError(key, value, help)
    if value ~= nil then
        if type(value) ~= "table" then
            error("newpaper.nvim: user `config." .. key .. " = " .. tostring(value) .. "` not a table. " .. help)
        end
    end
end

function M.keyExistsError(userConfig, config, key_type, help)
    for key, _ in pairs(userConfig) do
        if config[key] == nil then
            error("newpaper.nvim: " .. key_type .. " `" .. key .. "` does not exists. " .. help)
        end
    end
end

function M.requiresPluginError(plugin, help)
    if not M.isLoaded(plugin) then
        error("newpaper.nvim: Plugin `" .. plugin .. "` not loaded or not installed. " .. help)
    end
end

return M
