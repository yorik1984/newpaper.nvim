local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- LogNumber           Number
        -- LogNumberFloat      Float
        LogNumberBin   = { link = "Special" },
        LogNumberOctal = { fg = newpaper.tex_maroon },
        LogNumberHex   = { fg = newpaper.tex_red },

        LogSymbol      = { fg = newpaper.persimona, style = style.b_bold },
        -- LogSeparatorLine    Comment

        -- LogBool             Boolean
        LogNull        = { fg = newpaper.maroon, style = style.b_bold },
        LogString      = { fg = newpaper.tex_string },

        LogDate        = { link = "Constant" },
        LogWeekdayStr  = { fg = newpaper.tex_olive },
        LogTime        = { fg = newpaper.tex_navy },
        LogTimeAMPM    = { link = "Character" },
        -- LogTimeZone         Operator
        LogDuration    = { fg = newpaper.tex_operator, style = style.b_bold },

        -- LogSysColumns       Statement
        -- LogSysProcess       Function

        -- LogUrl              Underlined
        LogMacAddr     = { fg = newpaper.tex_SI_yellow, style = style.underline },
        LogIPv4        = { fg = newpaper.tex_math_delim, style = style.underline },
        LogIPv6        = { fg = newpaper.tex_aqua, style = style.underline },
        LogUUID        = { fg = newpaper.rainbowcyan },
        LogMD5         = { fg = newpaper.regexp_magenta },
        LogSHA         = { fg = newpaper.tex_magenta },
        LogPath        = { link = "Directory" },

        LogLvFatal     = { fg = newpaper.todo_error },
        LogLvEmergency = { link = "LogLvFatal" },
        LogLvAlert     = { link = "LogLvFatal" },
        LogLvCritical  = { link = "LogLvFatal" },
        LogLvError     = { link = "LogLvFatal" },
        LogLvFail      = { link = "LogLvFatal" },
        LogLvFault     = { link = "LogLvFatal" },
        LogLvNack      = { link = "LogLvFatal" },
        LogLvWarning   = { fg = newpaper.todo_warn },
        LogLvBad       = { fg = newpaper.todo_warn },
        -- LogLvNotice         Exception
        LogLvInfo      = { fg = newpaper.todo_info },
        -- LogLvDebug          Debug
        LogLvTrace     = { link = "SpecialChar" },
        LogLvVerbose   = { link = "SpecialChar" },
        LogLvPass      = { fg = newpaper.ok_fg },
        LogLvSuccess   = { fg = newpaper.ok_fg },
        LogGreen       = { fg = newpaper.ok_fg },
        LogBlue        = { fg = newpaper.todo_info },
    }
end

return M
