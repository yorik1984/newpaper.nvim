local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local vimSyn = {}
    vimSyn.colors   = require("newpaper.colors").setup(config)
    vimSyn.style    = require("newpaper.style").setup_style(config)
    local newpaper  = vimSyn.colors
    local style     = vimSyn.style

    -- LuaFormatter off

    vimSyn.loadSyntax = function ()

        -- Vim syntax highlight groups

        local syntax = {

            vimCommentTitle = { fg = newpaper.comment, style = style.comment_title }

        }

        return syntax

    end

    vimSyn.loadTreeSitter = function ()

        -- Vim treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    vimSyn.loadPlugins = function()

        -- Vim special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
        -- LuaFormatter on

    end

    return vimSyn

end

return M