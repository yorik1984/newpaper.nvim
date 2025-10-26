local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ActionHintsDefinition = { fg = newpaper.tex_aqua },
        ActionHintsReferences = { fg = newpaper.tex_lightgreen },
    }
end

return M
