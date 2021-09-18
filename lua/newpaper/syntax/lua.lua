local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local luaSyn   = {}
    luaSyn.colors  = require("newpaper.colors").setup(config)
    luaSyn.style   = require("newpaper.style").setup_style(config)
    local newpaper = luaSyn.colors
    local style    = luaSyn.style

    -- LuaFormatter off

    luaSyn.loadSyntax = function ()

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
            luaFunc         = { fg = newpaper.lua_navy },

        }

        return syntax

    end

    luaSyn.loadTreeSitter = function ()

        local treesitter = {

            luaTSField           = { fg = newpaper.fg },
            luaTSFuncBuiltin     = { fg = newpaper.redorange },
            luaTSLabel           = { fg = newpaper.magenta },
            luaTSPunctBracket    = { fg = newpaper.lua_navy },
            luaTSOperator        = { fg = newpaper.lua_navy, style = style.o_style },
        }

        return treesitter

    end

    luaSyn.loadPlugins = function()

        local plugins = {

            -- vim-lua
            -- NOTE: Some groups from basic syntax include this

            luaParens           = { fg = newpaper.lua_navy },
            luaBraces           = { fg = newpaper.blue },
            luaBrackets         = { fg = newpaper.lua_navy, style = style.o_style },
            luaBuiltIn          = { fg = newpaper.olive },
            -- luaComment          Comment
            -- luaCommentLongTag   luaCommentLong
            -- luaCommentLong      luaComment
            -- luaCommentTodo      Todo
            -- luaCond             Conditional
            luaConstant         = { fg = newpaper.boolean, style = style.k_style },
            luaDocTag           = { fg = newpaper.darkgreen, style = style.c_style },
            luaEllipsis         = { fg = newpaper.orange },
            -- luaElse             Conditional
            -- luaError            Error
            -- luaFloat            Float
            luaFuncArgName      = { fg = newpaper.orange },
            luaFuncCall         = { fg = newpaper.lua_navy },
            -- luaFuncId           Function
            luaFuncName         = { fg = newpaper.darkgreen },
            luaFuncTable        = { fg = newpaper.teal },
            -- luaFuncKeyword      luaFunction
            -- luaFunction         Structure
            luaFuncParens       = { fg = newpaper.blue },
            -- luaGoto             luaStatement
            luaGotoLabel        = { fg = newpaper.magenta },
            -- luaIn               Repeat
            -- luaLabel            Label
            luaLocal            = { fg = newpaper.keyword },
            -- luaNumber           Number
            -- luaSymbolOperator   luaOperator
            luaNotEqOperator    = { fg = newpaper.magenta, style = style.o_style },
            luaOperator         = { fg = newpaper.lua_navy, style = style.o_style },
            -- luaRepeat           Repeat
            -- luaSemiCol          Delimiter
            -- luaSpecialTable     Special
            luaSpecialValue     = { fg = newpaper.redorange },
            -- luaStatement        Statement
            -- luaString           String
            -- luaStringLong       luaString
            -- luaStringSpecial    SpecialChar
            -- luaErrHand          Exception
        }

        return plugins
        -- LuaFormatter on

    end

    return luaSyn

end

return M
