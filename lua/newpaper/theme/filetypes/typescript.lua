local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local typescriptSyn  = {}
    typescriptSyn.colors = configColors
    typescriptSyn.style  = configStyle
    local newpaper       = typescriptSyn.colors
    local style          = typescriptSyn.style

    typescriptSyn.loadTreeSitter = function()
        local treesitter = {
            ["@none.tsx"] = { fg = newpaper.tex_verb },
        }
        return treesitter
    end

    -- stylua: ignore end

    return typescriptSyn
end

return M
