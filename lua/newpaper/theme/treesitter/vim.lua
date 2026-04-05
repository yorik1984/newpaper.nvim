local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@variable.builtin.vim"] = { fg = newpaper.tex_magenta, style = style.v_style, nocombine = true },
    }
end

return M
