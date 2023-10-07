local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local vimSyn   = {}
    vimSyn.colors  = configColors
    vimSyn.style   = configStyle
    local newpaper = vimSyn.colors
    local style    = vimSyn.style

    vimSyn.loadSyntax = function()
        local syntax = {
            vimCommentTitle = { fg = newpaper.comments, style = style.c_title }
        }
        return syntax
    end

    -- stylua: ignore end

    return vimSyn
end

return M
