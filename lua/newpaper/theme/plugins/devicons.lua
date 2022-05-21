local M = {}

function M.setup(configColors)

    -- stylua: ignore start

    local deviconSyn  = {}
    deviconSyn.colors = configColors
    local newpaper    = deviconSyn.colors

    deviconSyn.loadPlugins = function()
        local plugins = {}
        local devIcons = {
            Rb  = { fg = newpaper.ruby_red },
            Erb = { fg = newpaper.ruby_red },
            Rs  = { fg = newpaper.rust_green },
            Py  = { fg = newpaper.python_blue },
            Pyc = { fg = newpaper.python_blue },
            Pyd = { fg = newpaper.python_blue },
            Pyo = { fg = newpaper.python_blue },
        }
        for key, value in pairs(devIcons) do
            plugins["DevIcon" .. key] = value
        end
        return plugins
    end

    -- stylua: ignore end

    return deviconSyn
end

return M
