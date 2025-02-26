local M = {}

function M.setup(configColors, configStyle)
    local bufferlineSyn       = {}
    bufferlineSyn.colors      = configColors
    bufferlineSyn.style       = configStyle
    local newpaper            = bufferlineSyn.colors
    local style               = bufferlineSyn.style

    bufferlineSyn.loadPlugins = function()
        local plugins = {
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
        return plugins
    end

    return bufferlineSyn
end

return M
