local M = {}

function M.setup(configColors, configStyle)
    local newpaper       = configColors
    local style          = configStyle

    return {
        BufferLineInfoDiagnosticSelected    = { fg = newpaper.info_fg, style = style.b_bold_i },
        BufferLineHintDiagnosticSelected    = { fg = newpaper.hint_fg, style = style.b_bold_i },
        BufferLineWarningDiagnosticSelected = { fg = newpaper.warn_fg, style = style.b_bold_i },
        BufferLineErrorDiagnosticSelected   = { fg = newpaper.error_fg, style = style.b_bold_i },
        BufferLineInfoSelected              = { fg = newpaper.info_fg, style = style.b_bold_i },
        BufferLineHintSelected              = { fg = newpaper.hint_fg, style = style.b_bold_i },
        BufferLineWarningSelected           = { fg = newpaper.warn_fg, style = style.b_bold_i },
        BufferLineErrorSelected             = { fg = newpaper.error_fg, style = style.b_bold_i },
        BufferLineModifiedSelected          = { fg = newpaper.regexp_blue },
    }

end

return M
