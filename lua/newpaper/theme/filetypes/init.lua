local M = {}

local ftypesFolder = "newpaper.theme.filetypes."

local filetypes = {
    "comment",
    "html",
    "jinja",
    "json",
    "liquid",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "markdown",
    "query",
    "rbs",
    "regexp",
    "ruby",
    "rust",
    "tex",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

for _, value in ipairs(filetypes) do
    local fileSyn = ftypesFolder .. value
    table.insert(M, fileSyn)
end

return M
