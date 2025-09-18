local M = {}

local folder = "newpaper.theme.filetypes."

local files = {
    "html",
    "json",
    "liquid",
    "log",
    "markdown",
    "rmd",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
