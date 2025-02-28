local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constant.luap"]                   = { fg = newpaper.texts, style = style.regex, nocombine = true },
        ["@character.luap"]                  = { fg = newpaper.redorange, style = style.regex, nocombine = true },
        ["@operator.luap"]                   = { fg = newpaper.regexp_blue, style = style.regex, nocombine = true },
        ["@punctuation.bracket.group.luap"]  = { fg = newpaper.regexp_green, style = style.regex, nocombine = true },
        ["@punctuation.bracket.square.luap"] = { fg = newpaper.regexp_orange, style = style.regex, nocombine = true },
        ["@punctuation.delimiter.luap"]      = { fg = newpaper.regexp_orange, style = style.regex, nocombine = true },
        ["@string.escape.assertion.luap"]    = { fg = newpaper.regexp_brown, style = style.regex, nocombine = true },
        ["@keyword.luap"]                    = { fg = newpaper.regexp_magenta, style = style.regex, nocombine = true },
        ["@variable.parameter.luap"]         = { fg = newpaper.regexp_orange, style = style.regex, nocombine = true },

        -- Capture group
        ["@string.set.luap"]                 = { bg = newpaper.regexp_orange_bg },
        ["@string.capture.luap"]             = { bg = newpaper.regexp_green_bg },
    }
end

return M
