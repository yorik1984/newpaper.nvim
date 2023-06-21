local M = {}

local ftypesFolder = "newpaper.theme.filetypes."

local filetypes = {
    "html",
    "json",
    "liquid",
    "lua",
    "markdown",
    "ruby",
    "rust",
    "tex",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
}

for _, value in ipairs(filetypes) do
    local fileSyn = ftypesFolder .. value
    table.insert(M, fileSyn)
end

return M
