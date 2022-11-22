local util = require("newpaper.util")
local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local luaSyn   = {}
    luaSyn.colors  = configColors
    luaSyn.style   = configStyle
    local newpaper = luaSyn.colors
    local style    = luaSyn.style

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

        -- fallback to 0.7
        local treesitterOldKey = {
            ["@constructor.lua"]           = "luaTSConstructor",
            ["@field.lua"]                 = "luaTSField",
            ["@function.builtin.lua"]      = "luaTSFuncBuiltin",
            ["@keyword.return.lua"]        = "luaTSKeywordReturn",
            ["@label.lua"]                 = "luaTSLabel",
            ["@operator.lua"]              = "luaTSOperator",
            ["@punctuation.bracket.lua"]   = "luaTSPunctBracket",
            ["@variable.lua"]              = "luaTSVariable",
        }

        local treesitter = {
            ["@constructor.lua"]           = { fg = newpaper.lua_blue, style = style.k_style },
            ["@field.lua"]                 = { fg = newpaper.fg },
            ["@function.builtin.lua"]      = { fg = newpaper.redorange },
            ["@keyword.return.lua"]        = { fg = newpaper.tex_keyword, style = style.o_style },
            ["@label.lua"]                 = { fg = newpaper.magenta },
            ["@operator.lua"]              = { fg = newpaper.lua_navy,    style = style.o_style },
            ["@punctuation.bracket.lua"]   = { fg = newpaper.tag_navy },
            ["@variable.lua"]              = { fg = newpaper.darkengreen, style = style.v_style },
        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
    end

    luaSyn.loadPlugins = function()
        local plugins = {
            -- vim-lua
            -- NOTE: Some groups from basic syntax include this
            luaParens           = { fg = newpaper.lua_navy },
            luaBraces           = { fg = newpaper.blue },
            luaBrackets         = { fg = newpaper.lua_navy, style = style.o_style },
            luaBuiltIn          = { fg = newpaper.ocean, style = style.v_style },
            -- luaComment          Comment
            -- luaCommentLongTag   luaCommentLong
            -- luaCommentLong      luaComment
            -- luaCommentTodo      Todo
            -- luaCond             Conditional
            luaConstant         = { fg = newpaper.boolean,   style = style.k_style },
            luaDocTag           = { fg = newpaper.darkgreen, style = style.c_style },
            luaEllipsis         = { fg = newpaper.orange },
            -- luaElse             Conditional
            -- luaError            Error
            -- luaFloat            Float
            luaFuncArgName      = { fg = newpaper.orange },
            luaFuncCall         = { fg = newpaper.lua_navy },
            -- luaFuncId           Function
            luaFuncName         = { fg = newpaper.darkengreen },
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
            luaNotEqOperator    = { fg = newpaper.magenta,  style = style.o_style },
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
    end

    -- stylua: ignore end

    return luaSyn
end

return M
