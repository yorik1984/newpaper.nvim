local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local regexpSyn  = {}
    regexpSyn.colors = configColors
    regexpSyn.style  = configStyle
    local newpaper   = regexpSyn.colors
    local style      = regexpSyn.style

    regexpSyn.loadTreeSitter = function()
        local treesitter = {
            ["@constant.regex"]                   = { fg = newpaper.texts,          style = style.regex, nocombine = true },
            ["@number.regex"]                     = { fg = newpaper.regexp_blue,    nocombine = true },
            ["@operator.regex"]                   = { fg = newpaper.regexp_blue,    style = style.regex, nocombine = true },
            ["@property.regex"]                   = { fg = newpaper.regexp_green,   style = style.regex, nocombine = true, bg = newpaper.regexp_green_bg },
            ["@punctuation.bracket.curly.regex"]  = { fg = newpaper.regexp_blue,    style = style.regex, nocombine = true },
            ["@punctuation.bracket.group.regex"]  = { fg = newpaper.regexp_green,   style = style.regex, nocombine = true },
            ["@punctuation.bracket.square.regex"] = { fg = newpaper.regexp_orange,  style = style.regex, nocombine = true },
            ["@punctuation.delimiter.regex"]      = { fg = newpaper.regexp_orange,  style = style.regex, nocombine = true },
            ["@string.escape.assertion.regex"]    = { fg = newpaper.regexp_brown,   style = style.regex, nocombine = true },
            ["@string.escape.regex"]              = { fg = newpaper.regexp_magenta, style = style.regex, nocombine = true },
            ["@string.escape.control.regex"]      = { fg = newpaper.regexp_orange,  style = style.regex, nocombine = true },
            ["@markup.heading.regex"]             = { fg = newpaper.texts,          style = style.regex, nocombine = true },

            -- Capture group
            ["@string.class.regex"]               = { bg = newpaper.regexp_orange_bg },
            ["@string.group.regex"]               = { bg = newpaper.regexp_green_bg },
        }
        return treesitter
    end

    -- stylua: ignore end

    return regexpSyn
end

return M
