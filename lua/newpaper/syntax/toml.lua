local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local tomlSyn  = {}
    tomlSyn.colors = require("newpaper.colors").setup(config)
    tomlSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = tomlSyn.colors
    local style    = tomlSyn.style

    -- LuaFormatter off

    tomlSyn.loadSyntax = function ()

        -- Language syntax highlight groups

        local syntax = {

        }

        return syntax

    end

    tomlSyn.loadTreeSitter = function ()

        -- Language treeSitter highlight syntax groups

        local treesitter = {

            tomlTSConstBuiltin = { fg = newpaper.darkgreen, style = style.o_style },
            tomlTSTypeBuiltin  = { fg = newpaper.keyword, style = style.k_style },
            tomlTSProperty     = { fg = newpaper.navy },

        }

        return treesitter

    end

    tomlSyn.loadPlugins = function()

        -- Language special plugins highlight groups

        local plugins = {

            -- Plugin vim-toml

            tomlEscape        = { fg = newpaper.darkgreen, style = style.o_style },
            tomlLineEscape    = { fg = newpaper.darkgreen, style = style.o_style },
            -- tomlString     String
            -- tomlInteger    Number
            -- tomlFloat      Float
            -- tomlBoolean    Boolean
            -- tomlDate       Constant
            tomlKey           = { fg = newpaper.navy },
            tomlKeyDq         = { fg = newpaper.navy },
            tomlKeySq         = { fg = newpaper.navy },
            tomlTable         = { fg = newpaper.keyword, style = style.k_style },
            tomlTableArray    = { fg = newpaper.blueviolet, style = style.k_style },

            -- tomlTodo       Todo
            -- tomlComment    Comment

        }

        return plugins
        -- LuaFormatter on

    end

    return tomlSyn

end

return M
