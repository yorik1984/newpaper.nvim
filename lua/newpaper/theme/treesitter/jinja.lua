local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@keyword.directive.jinja"] = { fg = newpaper.jinja_red, nocombine = true },
    }
end

return M
