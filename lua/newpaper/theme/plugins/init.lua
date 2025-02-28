local M = {}

local folder = "newpaper.theme.plugins."

local files = {
    "bufferline",
    "cheatsheet",
    "cmp",
    "dashboard",
    "flash",
    "gitsigns",
    "headlines",
    "highlight-undo",
    "indent-blankline",
    "lazy",
    "lazygit",
    "litee",
    "lspsaga",
    "lualine",
    "mason",
    "mini",
    "neogit",
    "noice",
    "nvim-dap",
    "nvim-dap-ui",
    "nvim-dap-virtual-text",
    "nvim-notify",
    "nvim-tree",
    "nvim-treesitter-context",
    "nvim-web-devicons",
    "rainbow-delimiters",
    "snacks",
    "telescope",
    "todo-comments",
    "trim",
    "trouble",
    "undo-glow",
    "vim-fugitive",
    "vim-matchup",
    "virt-column",
    "which-key",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
