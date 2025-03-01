local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        Headline  = { bg = newpaper.none, style = style.k_bold },
        CodeBlock = { bg = newpaper.codeblock },
        Dash      = { fg = newpaper.orange, bg = newpaper.none },
    }
end

return M
