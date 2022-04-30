local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    -- stylua: ignore start

    local tomlSyn  = {}
    tomlSyn.colors = require("newpaper.colors").setup(config)
    tomlSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = tomlSyn.colors
    local style    = tomlSyn.style


    tomlSyn.loadSyntax = function ()

        -- Toml highlight groups

        local syntax = {

            tomlEscape        = { fg = newpaper.magenta },
            tomlLineEscape    = { fg = newpaper.maroon, style = style.o_style },
            -- tomlString     String
            -- tomlInteger    Number
            -- tomlFloat      Float
            -- tomlBoolean    Boolean
            tomlDate          = { fg = newpaper.maroon },
            tomlKey           = { fg = newpaper.darkengreen, style = style.f_style },
            tomlKeyDq         = { fg = newpaper.tag_navy },
            tomlKeySq         = { fg = newpaper.navy },
            tomlKeyValueArray = { fg = newpaper.operator },
            tomlTable         = { fg = newpaper.keyword,    style = style.k_style },
            tomlTableArray    = { fg = newpaper.darkpurple, style = style.k_style },
            tomlDotInKey      = { fg = newpaper.orange },
            -- tomlTodo       Todo
            -- tomlComment    Comment

        }

        return syntax
    end

    tomlSyn.loadTreeSitter = function ()

        -- Toml treeSitter highlight syntax groups

        local treesitter = {

            -- tomlTSString
            -- tomlTSBoolean
            -- tomlTSComment
            -- tomlTSNumber
            -- tomlTSFloat
            -- tomlTSOperator
            -- tomlTSError
            -- tomlTSStringSpecial
            -- tomlTSPunctDelimiter
            tomlTSPunctBracket   = { fg = newpaper.tag_navy, style = style.o_style },
            tomlTSProperty       = { fg = newpaper.darkengreen, style = style.f_style },

        }

        return treesitter
    end

    tomlSyn.loadPlugins = function()

        -- Toml special plugins highlight groups

        local plugins = {}

        return plugins

    end

    -- stylua: ignore end

    return tomlSyn
end

return M
