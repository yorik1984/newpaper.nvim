local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constructor.lua"]                         = { fg = newpaper.lua_blue, style = style.br_style },
        ["@function.call.lua"]                       = { fg = newpaper.lua_navy, style = style.f_style },
        ["@variable.lua"]                            = { fg = newpaper.darkengreen, style = style.v_style },

        -- LSP semantic tokens
        ["@lsp.type.class.lua"]                      = { default = true },
        ["@lsp.type.keyword.lua"]                    = { default = true },
        ["@lsp.type.type.lua"]                       = { default = true },
        ["@lsp.type.method.lua"]                     = { link = "@function.call.lua" },
        ["@lsp.type.parameter.lua"]                  = { default = true },
        ["@lsp.type.property.lua"]                   = { default = true },
        ["@lsp.type.variable.lua"]                   = { default = true },
        ["@lsp.typemod.class.declaration.lua"]       = { default = true },
        ["@lsp.typemod.variable.defaultLibrary.lua"] = { link = "@module.builtin" },
    }
end

return M
