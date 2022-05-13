local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local vimSyn   = {}
    vimSyn.colors  = configColors
    vimSyn.style   = configStyle
    local newpaper = vimSyn.colors
    local style    = vimSyn.style

    vimSyn.loadSyntax = function ()
        local syntax = {
            vimCommentTitle = { fg = newpaper.comment, style = style.comment_title }
        }
        return syntax
    end

    vimSyn.loadTreeSitter = function ()
        local treesitter = {}
        return treesitter
    end

    vimSyn.loadPlugins = function()
        local plugins = {}
        return plugins
    end

    -- stylua: ignore end

    return vimSyn
end

return M
