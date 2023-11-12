local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local luauSyn   = {}
    luauSyn.colors  = configColors
    luauSyn.style   = configStyle
    local newpaper  = luauSyn.colors
    local style     = luauSyn.style

    luauSyn.loadTreeSitter = function()

        local treesitter = {
            ["@constructor.luau"]         = { fg = newpaper.lua_blue, style = style.br_style },
            ["@punctuation.bracket.luau"] = { fg = newpaper.lua_navy, style = style.br_style },
            ["@variable.luau"]            = { fg = newpaper.darkengreen, style = style.v_style },

            -- LSP semantic tokens
            ["@lsp.type.variable.luau"]                   = { link = "@variable.luau" },
            ["@lsp.type.property.luau"]                   = { link = "@definition.field" },
            ["@lsp.type.method.luau"]                     = { link = "@function.call" },
            ["@lsp.type.parameter.luau"]                  = { link = "@definition.parameter" },
            ["@lsp.typemod.variable.defaultLibrary.luau"] = { link = "@namespace.builtin" },
        }

        return treesitter
    end

    -- stylua: ignore end

    return luauSyn
end

return M
