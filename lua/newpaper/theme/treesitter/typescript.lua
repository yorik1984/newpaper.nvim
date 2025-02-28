local M = {}

function M.setup(configColors, configStyle)
    local newpaper   = configColors
    local style      = configStyle

    local treesitter = {
        ["@none.tsx"] = { fg = newpaper.tex_verb },
    }
    return treesitter
end

return M
