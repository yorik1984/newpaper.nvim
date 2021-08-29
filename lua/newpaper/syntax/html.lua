local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local htmlSyn  = {}
    htmlSyn.colors = require("newpaper.colors").setup(config)
    htmlSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = htmlSyn.colors
    local style    = htmlSyn.style

    -- LuaFormatter off

    htmlSyn.loadSyntax = function ()
        -- TODO: Add syntax
        -- HTML syntax highlight groups

        local syntax = {

            htmlLink = { fg = newpaper.link,       style = 'underline' },
            htmlH1   = { fg = newpaper.darkgreen,  style = style.tag_style },
            htmlH2   = { fg = newpaper.blue,       style = style.tag_style },
            htmlH3   = { fg = newpaper.purple,     style = style.tag_style },
            htmlH4   = { fg = newpaper.orange,     style = style.tag_style },
            htmlH5   = { fg = newpaper.darkyellow, style = style.tag_style },
            htmlH6   = { fg = newpaper.olive,      style = style.tag_style },

        }

        return syntax

    end

    htmlSyn.loadTreeSitter = function ()

        -- HTML treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    htmlSyn.loadPlugins = function()

        -- HTML special plugins highlight groups

        local plugins = {

            -- Plugin

        }

        return plugins
        -- LuaFormatter on

    end

    return htmlSyn

end

return M
