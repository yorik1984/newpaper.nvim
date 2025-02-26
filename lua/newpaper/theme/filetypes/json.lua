local M = {}

function M.setup(configColors, configStyle)
    local jsonSyn          = {}
    jsonSyn.colors         = configColors
    jsonSyn.style          = configStyle
    local newpaper         = jsonSyn.colors
    local style            = jsonSyn.style

    jsonSyn.loadSyntax     = function()
        local syntax = {
            jsonKeyword = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        }
        return syntax
    end

    jsonSyn.loadTreeSitter = function()
        local treesitter = {
            ["@label.json"]    = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@label.hjson"]   = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@label.jsonnet"] = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        }
        return treesitter
    end

    return jsonSyn
end

return M
