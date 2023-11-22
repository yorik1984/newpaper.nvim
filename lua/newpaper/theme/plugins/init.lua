local M = {}

local plugsFolder = "newpaper.theme.plugins."

local plugins = {
    "bufferline",
    "cheatsheet",
    "cmp",
    "dashboard-nvim",
    "fugitive",
    "jinja",
    "lazy",
    "litee",
    "lsp",
    "lspsaga",
    "mason",
    "neogit",
    "noice",
    "notify",
    "nvim-tree",
    "rainbow-delimiters",
    "rbs",
    "symbols-outline",
    "telescope",
    "todo-comments",
    "trouble",
    "vista",
}

for _, value in ipairs(plugins) do
    local fileSyn = plugsFolder .. value
    table.insert(M, fileSyn)
end

return M
