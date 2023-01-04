local util = require("newpaper.util")
local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local tomlSyn  = {}
    tomlSyn.colors = configColors
    tomlSyn.style  = configStyle
    local newpaper = tomlSyn.colors
    local style    = tomlSyn.style

    tomlSyn.loadSyntax = function()
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
            tomlDotInKey      = { fg = newpaper.persimona },
            -- tomlTodo       Todo
            -- tomlComment    Comment
        }
        return syntax
    end

    tomlSyn.loadTreeSitter = function()

        -- fallback to 0.7
        local treesitterOldKey = {
            ["@punctuation.bracket.toml"] = "tomlTSPunctBracket",
            ["@property.toml"]            = "tomlTSProperty",
            ["@string.special.toml"]      = "tomlTSStringSpecial",
            ["@type.toml"]                = "tomlTSType",
        }

        local treesitter = {
            ["@punctuation.bracket.toml"] = { fg = newpaper.navy, style = style.br_style },
            ["@property.toml"]            = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@string.special.toml"]      = { fg = newpaper.maroon },
            ["@type.toml"]                = { fg = newpaper.keyword, style = style.k_style },
        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
    end

    tomlSyn.loadPlugins = function()
        local plugins = {}
        return plugins
    end

    -- stylua: ignore end

    return tomlSyn
end

return M
