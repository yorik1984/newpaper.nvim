local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        NotifyERRORBorder = { fg = newpaper.error_fg },
        NotifyWARNBorder  = { fg = newpaper.warn_fg },
        NotifyINFOBorder  = { fg = newpaper.info_fg },
        NotifyDEBUGBorder = { fg = newpaper.texts },
        NotifyTRACEBorder = { fg = newpaper.purple },
        NotifyERRORIcon   = { fg = newpaper.error_fg },
        NotifyWARNIcon    = { fg = newpaper.warn_fg },
        NotifyINFOIcon    = { fg = newpaper.info_fg },
        NotifyDEBUGIcon   = { fg = newpaper.texts },
        NotifyTRACEIcon   = { fg = newpaper.purple },
        NotifyERRORTitle  = { fg = newpaper.error_fg, style = style.b_bold },
        NotifyWARNTitle   = { fg = newpaper.warn_fg, style = style.b_bold },
        NotifyINFOTitle   = { fg = newpaper.info_fg, style = style.b_bold },
        NotifyDEBUGTitle  = { fg = newpaper.texts, style = style.b_bold },
        NotifyTRACETitle  = { fg = newpaper.purple, style = style.b_bold },
        NotifyERRORBody   = { fg = newpaper.float_fg },
        NotifyWARNBody    = { fg = newpaper.float_fg },
        NotifyINFOBody    = { fg = newpaper.float_fg },
        NotifyDEBUGBody   = { fg = newpaper.float_fg },
        NotifyTRACEBody   = { fg = newpaper.float_fg },
    }
end

return M
