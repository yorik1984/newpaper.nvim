local M = {}

local folder = "newpaper.theme.treesitter."

local files = {
    "comment",
    "html",
    "jinja",
    "json",
    "latex",
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
    "toml",
    "typescript",
    "vimdoc",
    "yaml",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
