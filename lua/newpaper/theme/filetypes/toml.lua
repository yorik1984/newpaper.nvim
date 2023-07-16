local M = {}

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

        local treesitter = {
            ["@property.toml"]            = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@string.special.toml"]      = { fg = newpaper.maroon },
            ["@type.toml"]                = { fg = newpaper.keyword, style = style.k_style },
        }

        return treesitter
    end

    -- stylua: ignore end

    return tomlSyn
end

return M
