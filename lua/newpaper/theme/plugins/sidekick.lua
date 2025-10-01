local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        SidekickSign        = { fg = newpaper.ok_fg },
        SidekickDiffAdd     = { bg = newpaper.diffadd_bg },
        -- SidekickChat        = { link = "NormalFloat" },
        SidekickDiffDelete  = { bg = newpaper.diffdelete_bg },
        SidekickDiffContext = { bg = newpaper.ok_bg },
    }
end

return M
