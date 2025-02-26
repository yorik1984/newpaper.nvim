local M = {}

function M.setup(configColors, configStyle)
    local luaSyn          = {}
    luaSyn.colors         = configColors
    luaSyn.style          = configStyle
    local newpaper        = luaSyn.colors
    local style           = luaSyn.style

    luaSyn.loadSyntax     = function()
        local syntax = {
            -- Basic lua groups
            -- NOTE: some basic groups init in plugins part. See below

            -- luaFor          Repeat
            -- luaString2      String
            -- luaTodo         Todo
            -- luaTable        Structure
            -- luaParenError   Error
            -- luaBraceError   Error
            -- luaSpecial      SpecialChar
            luaFunc = { fg = newpaper.lua_navy, style = style.f_style },
        }
        return syntax
    end

    luaSyn.loadTreeSitter = function()
        local treesitter = {
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
        return treesitter
    end

    luaSyn.loadPlugins    = function()
        local plugins = {
            -- vim-lua
            -- NOTE: Some groups from basic syntax include this
            luaParens        = { fg = newpaper.lua_navy },
            luaBraces        = { fg = newpaper.blue },
            luaBrackets      = { fg = newpaper.lua_navy, style = style.br_style },
            luaBuiltIn       = { fg = newpaper.olive, style = style.v_style },
            -- luaComment          Comment
            -- luaCommentLongTag   luaCommentLong
            -- luaCommentLong      luaComment
            -- luaCommentTodo      Todo
            -- luaCond             Conditional
            luaConstant      = { fg = newpaper.booleans, style = style.bool_style },
            luaDocTag        = { fg = newpaper.darkgreen, style = style.c_style },
            luaEllipsis      = { fg = newpaper.orange },
            -- luaElse             Conditional
            -- luaError            Error
            -- luaFloat            Float
            luaFuncArgName   = { fg = newpaper.orange },
            luaFuncCall      = { fg = newpaper.lua_navy },
            -- luaFuncId           Function
            luaFuncName      = { fg = newpaper.darkengreen },
            luaFuncTable     = { fg = newpaper.teal },
            -- luaFuncKeyword      luaFunction
            -- luaFunction         Structure
            luaFuncParens    = { fg = newpaper.blue },
            -- luaGoto             luaStatement
            luaGotoLabel     = { fg = newpaper.redorange },
            -- luaIn               Repeat
            -- luaLabel            Label
            luaLocal         = { fg = newpaper.keywords },
            -- luaNumber           Number
            -- luaSymbolOperator   luaOperator
            luaNotEqOperator = { fg = newpaper.magenta, style = style.o_style },
            luaOperator      = { fg = newpaper.lua_navy, style = style.o_style },
            -- luaRepeat           Repeat
            -- luaSemiCol          Delimiter
            -- luaSpecialTable     Special
            luaSpecialValue  = { fg = newpaper.redorange },
            -- luaStatement        Statement
            -- luaString           String
            -- luaStringLong       luaString
            -- luaStringSpecial    SpecialChar
            -- luaErrHand          Exception
        }
        return plugins
    end

    return luaSyn
end

return M
