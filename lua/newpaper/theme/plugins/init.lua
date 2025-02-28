local M = {}

local folder = "newpaper.theme.plugins."

local files = {
    "bufferline",
    "cheatsheet",
    "cmp",
    "dashboard-nvim",
    "fugitive",
    "gitsigns",
    "lazy",
    "litee",
    "lspsaga",
    "mason",
    "mini",
    "neogit",
    "noice",
    "notify",
    "nvim-tree",
    "rainbow-delimiters",
    "snacks",
    "symbols-outline",
    "telescope",
    "todo-comments",
    "trouble",
    "vista",
    "plugins",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
