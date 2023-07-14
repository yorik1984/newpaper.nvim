local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local packerSyn  = {}
    packerSyn.colors = configColors
    packerSyn.style  = configStyle
    local newpaper   = packerSyn.colors
    local style      = packerSyn.style

    packerSyn.loadPlugins = function()
        local plugins = {
            packerHash         = { fg = newpaper.tag },
            packerOutput       = { fg = newpaper.keyword },
            packerStatus       = { fg = newpaper.teal },
            packerStatusCommit = { fg = newpaper.git_modified },
            packerPackageName  = { fg = newpaper.teal },
            packerWorking      = { fg = newpaper.comment },
            packerProgress     = { fg = newpaper.green, style = style.b_bold },
        }
        return plugins
    end

    -- stylua: ignore end

    return packerSyn
end

return M
