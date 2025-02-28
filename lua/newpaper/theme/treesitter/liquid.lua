local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@tag.delimiter.liquid"] = { fg = newpaper.jinja_red, nocombine = true },
    }
end

return M
