local M = {}

-- Выбираем стандартный путь для логов Neovim: stdpath('log') если есть (nvim >= 0.9),
-- иначе fallback на stdpath('cache').
local log_dir = (vim.fn.has("nvim-0.9") == 1) and vim.fn.stdpath("log") or vim.fn.stdpath("cache")
local log_file = log_dir .. "/newpaper.log"

-- Убедиться, что каталог существует и вернуть полный путь
function M.path()
    vim.fn.mkdir(log_dir, "p")
    return log_file
end

-- Очистить лог (truncate) и записать заголовок с временной меткой
function M.clear()
    local path = M.path()
    local f, err = io.open(path, "w")
    if not f then
        vim.notify("newpaper logger: failed to open log file for write: " .. tostring(err), vim.log.levels.WARN)
        return
    end
    f:write(string.format("[newpaper] log cleared at %s\n\n", os.date("%Y-%m-%d %H:%M:%S")))
    f:close()
end

-- Добавить строку в конец лога
function M.append(line)
    local path = M.path()
    local f, err = io.open(path, "a")
    if not f then
        vim.notify("newpaper logger: failed to open log file for append: " .. tostring(err), vim.log.levels.WARN)
        return
    end
    f:write(line .. "\n")
    f:close()
end

-- Сериализовать таблицу через vim.inspect и записать в лог с меткой
-- depth можно передать, по умолчанию 5
function M.log_table(tbl, label, depth)
    depth = depth or 5
    local ok, s = pcall(vim.inspect, tbl, { depth = depth })
    if not ok then s = tostring(tbl) end
    local header = string.format("[%s] %s\n", os.date("%Y-%m-%d %H:%M:%S"), label or "table")
    M.append(header .. s .. "\n")
end

-- Быстрый лог произвольного значения
function M.log(msg)
    M.append(string.format("[%s] %s", os.date("%Y-%m-%d %H:%M:%S"), tostring(msg)))
end

return M
