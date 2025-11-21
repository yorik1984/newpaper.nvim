local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@none.vue"] = { fg = newpaper.texts },
    }
end

return M
