local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        TocLevel        = { fg = newpaper.linenumber_fg },
        TocMarkerClosed = { fg = newpaper.teal },
        TocMarkerOpen   = { fg = newpaper.teal, style = style.b_bold },
        TocH1           = { link = "markdownH1" },
        TocH2           = { link = "markdownH2" },
        TocH3           = { link = "markdownH3" },
        TocH4           = { link = "markdownH4" },
        TocH5           = { link = "markdownH5" },
        TocH6           = { link = "markdownH6" },
    }
end

return M
