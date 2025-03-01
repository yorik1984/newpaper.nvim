local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        LuaLineDiffAdd         = { fg = newpaper.git_added, bg = newpaper.git_sign_bg },
        LuaLineDiffChang       = { fg = newpaper.git_modified, bg = newpaper.git_sign_bg },
        LuaLineDiffDelete      = { fg = newpaper.git_removed, bg = newpaper.git_sign_bg },
        LualineDiagnosticError = { fg = newpaper.error_fg, bg = newpaper.silver },
        LualineDiagnosticWarn  = { fg = newpaper.warn_fg, bg = newpaper.silver },
        LualineDiagnosticInfo  = { fg = newpaper.info_fg, bg = newpaper.silver },
        LualineDiagnosticHint  = { fg = newpaper.hint_fg, bg = newpaper.silver },
    }
end

return M
