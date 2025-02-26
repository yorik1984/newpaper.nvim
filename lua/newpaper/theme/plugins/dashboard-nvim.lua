local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        DashboardDesc             = { fg = newpaper.strings },
        DashboardFiles            = { fg = newpaper.teal },
        DashboardFooter           = { fg = newpaper.green, style = style.b_italic },
        DashboardHeader           = { fg = newpaper.blue },
        DashboardIcon             = { fg = newpaper.darkgreen },
        DashboardKey              = { fg = newpaper.keywords },
        DashboardMruIcon          = { fg = newpaper.tex_lightpurple },
        DashboardMruTitle         = { fg = newpaper.tex_lightpurple, style = style.b_bold },
        DashboardProjectIcon      = { fg = newpaper.orange },
        DashboardProjectTitle     = { fg = newpaper.tex_part_title, style = style.b_bold },
        DashboardProjectTitleIcon = { fg = newpaper.tex_part_title },
        DashboardShortCut         = { fg = newpaper.keywords },
        DashboardShortCutIcon     = { fg = newpaper.blueviolet },
    }
end

return M
