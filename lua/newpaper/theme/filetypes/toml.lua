local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
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
        tomlTable         = { fg = newpaper.keywords, style = style.k_style },
        tomlTableArray    = { fg = newpaper.darkpurple, style = style.k_style },
        tomlDotInKey      = { fg = newpaper.persimona },
        -- tomlTodo       Todo
        -- tomlComment    Comment
    }
end

return M
