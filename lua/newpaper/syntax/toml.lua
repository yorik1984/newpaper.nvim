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

        -- Toml highlight groups
        -- Neovim >=0.6.0 include basic toml syntax

        local syntax = {

            tomlEscape        = { fg = newpaper.magenta },
            tomlLineEscape    = { fg = newpaper.maroon, style = style.o_style },
            -- tomlString     String
            -- tomlInteger    Number
            -- tomlFloat      Float
            -- tomlBoolean    Boolean
            -- tomlDate       Constant
            tomlKey           = { fg = newpaper.navy },
            tomlKeyDq         = { fg = newpaper.navy },
            tomlKeySq         = { fg = newpaper.navy },
            tomlTable         = { fg = newpaper.keyword, style = style.k_style },
            tomlTableArray    = { fg = newpaper.darkpurple, style = style.k_style },
            tomlDotInKey      = { fg = newpaper.orange },
            -- tomlTodo       Todo
            -- tomlComment    Comment
--
        }

        return syntax

    end

    tomlSyn.loadTreeSitter = function ()

        -- Toml treeSitter highlight syntax groups

        local treesitter = {

            tomlTSConstBuiltin = { fg = newpaper.darkgreen, style = style.o_style },
            tomlTSTypeBuiltin  = { fg = newpaper.keyword, style = style.k_style },
            tomlTSProperty     = { fg = newpaper.navy },

        }

        return treesitter

    end

    tomlSyn.loadPlugins = function()

        -- Toml special plugins highlight groups

        local plugins = {}

        return plugins
        -- LuaFormatter on

    end

    return tomlSyn

end

return M
