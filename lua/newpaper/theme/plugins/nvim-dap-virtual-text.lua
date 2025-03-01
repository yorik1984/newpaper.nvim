local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        NvimDapVirtualText        = { fg = newpaper.grey, style = style.c_style },
        NvimDapVirtualTextChanged = { fg = newpaper.warn_fg, style = style.c_style },
        NvimDapVirtualTextError   = { fg = newpaper.error_fg, style = style.c_style },
        NvimDapVirtualTextInfo    = { fg = newpaper.info_fg, style = style.c_style },
    }
end

return M
