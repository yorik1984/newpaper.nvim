local M = {}

local folder = "newpaper.theme.ftplugins."

local files = {
    "markdown-plus",
    "vim-jinja2-syntax",
    "vim-lua",
    "vim-markdown",
    "vim-pandoc-syntax",
    "vim-rbs",
    "vim-ruby",
    "vimtex",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
