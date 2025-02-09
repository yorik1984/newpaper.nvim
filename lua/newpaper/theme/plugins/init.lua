local M = {}

local plugsFolder = "newpaper.theme.plugins."

local plugins = {
    "bufferline",
    "cheatsheet",
    "cmp",
    "dashboard-nvim",
    "fugitive",
    "gitsigns",
    "lazy",
    "litee",
    "lsp",
    "lspsaga",
    "mason",
    "mini",
    "neogit",
    "noice",
    "notify",
    "nvim-tree",
    "rainbow-delimiters",
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
