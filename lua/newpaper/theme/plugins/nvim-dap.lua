local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        DapBreakpoint          = { fg = newpaper.darkgreen, bg = newpaper.linenumber_bg },
        DapBreakpointCondition = { fg = newpaper.darkyellow, bg = newpaper.linenumber_bg },
        DapBreakpointRejected  = { fg = newpaper.ocean, bg = newpaper.linenumber_bg },
        DapLogPoint            = { fg = newpaper.strings, bg = newpaper.linenumber_bg },
        DapStopped             = { fg = newpaper.red, bg = newpaper.linenumber_bg },
    }
end

return M
