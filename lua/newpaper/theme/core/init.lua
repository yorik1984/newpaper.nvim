local M = {}

local folder = "newpaper.theme.core."

local files = {
  "editor",
  "custom",
  "lsp",
  "presets",
  "syntax",
  "treesitter",
}

for _, value in ipairs(files) do
    local fileSyn = folder .. value
    table.insert(M, fileSyn)
end

return M
