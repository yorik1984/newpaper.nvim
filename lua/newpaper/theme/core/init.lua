local M = {}

local folder = "newpaper.theme.core."

local files = {
  "editor",
  "lsp",
  "syntax",
  "treesitter",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
