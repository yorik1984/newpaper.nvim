local M = {}

function M.notTableError(key, value, help)
    if value ~= nil then
        if type(value) ~= "table" then
            error("newpaper.nvim: user config." .. key .. "." .. value .. " not a table. " .. help)
        end
    end
end

function M.keyExistsError(userConfig, config, key_type, help)
    for key, _ in pairs(userConfig) do
        if config[key] == nil then
            error("newpaper.nvim: " .. key_type .. " '" .. key .. "' does not exists. " .. help)
        end
    end
end

return M
