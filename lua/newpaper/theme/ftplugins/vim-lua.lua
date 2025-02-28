local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        luaFunc          = { fg = newpaper.lua_navy, style = style.f_style },

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
end

return M
