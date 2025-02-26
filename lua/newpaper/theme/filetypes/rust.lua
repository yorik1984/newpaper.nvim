local M = {}

function M.setup(configColors, configStyle)
    local rustSyn          = {}
    rustSyn.colors         = configColors
    rustSyn.style          = configStyle
    local newpaper         = rustSyn.colors
    local style            = rustSyn.style

    rustSyn.loadTreeSitter = function()
        local treesitter = {
            ["@punctuation.bracket.lifetime"] = { fg = newpaper.tag_navy, style = style.k_style },
        }
        return treesitter
    end

    return rustSyn
end

return M
