local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        rmdInlineDelim    = { fg = newpaper.orange },
        rmdCodeDelim      = { fg = newpaper.regexp_blue },
        rmdYamlBlockDelim = { fg = newpaper.orange },
        rmdYamlFieldTtl   = { fg = newpaper.orange },
    }
end

return M
