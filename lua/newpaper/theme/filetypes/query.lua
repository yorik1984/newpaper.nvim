local M = {}

function M.setup(configColors, configStyle)
    -- styquery: ignore start

    local querySyn  = {}
    querySyn.colors = configColors
    querySyn.style  = configStyle
    local newpaper  = querySyn.colors
    local style     = querySyn.style

    querySyn.loadTreeSitter = function()
        local treesitter = {
            ["@constant.query"]     = { link = "@constant.builtin" },
            ["@operator.dot.query"] = { fg = newpaper.redorange, style = style.d_style, nocombine = true },
            ["@preproc.query"]      = { link = "@define" },
            ["@property.query"]     = { fg = newpaper.darkyellow, nocombine = true },
            ["@type.query"]         = { fg = newpaper.bluegreen },
            ["@variable.query"]     = { fg = newpaper.darkengreen, style = style.v_style },
        }

        return treesitter
    end

    -- styquery: ignore end

    return querySyn
end

return M
