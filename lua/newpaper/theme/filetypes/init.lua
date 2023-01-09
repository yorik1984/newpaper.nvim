local M = {}

local ftypesFolder = "newpaper.theme.filetypes."

local filetypes = {
    "help",
    "html",
    "json",
    "lua",
    "markdown",
    "ruby",
    "tex",
    "toml",
    "vim",
    "yaml",
}

for _, value in ipairs(filetypes) do
    local fileSyn = ftypesFolder .. value
    table.insert(M, fileSyn)
end

return M
