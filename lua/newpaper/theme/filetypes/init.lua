local M = {}

local ftypesFolder = "newpaper.theme.filetypes."

local filetypes = {
    "comment",
    "html",
    "json",
    "liquid",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "markdown",
    "query",
    "regex",
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
