local M = {}

local plugsFolder  = "newpaper.theme.plugins."

local plugins = {
    "cheatsheet",
    "jinja",
    "lspsaga",
    "mason",
    "nvim-tree",
    "rbs",
    "telescope",
    "trouble",
}

for _, value in ipairs(plugins) do
    local fileSyn = plugsFolder .. value
    table.insert(M, fileSyn)
end

return M
