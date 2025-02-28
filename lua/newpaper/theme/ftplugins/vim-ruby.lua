local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    local hlGroups = {
        rubyClass                  = { fg = newpaper.ruby_magenta, style = style.k_style },
        rubyModule                 = { fg = newpaper.ruby_purple, style = style.k_style },
        rubyExceptionHandler2      = { fg = newpaper.redorange, style = style.k_style },
        rubyDefine                 = { fg = newpaper.darkpurple, style = style.k_style },
        rubyAccess                 = { fg = newpaper.ruby_maroon, style = style.k_style },
        rubyAttribute              = { fg = newpaper.redorange },
        rubyMacro                  = { fg = newpaper.darkpurple, style = style.k_style },
        -- rubyMethodName                 rubyFunction
        rubyFunction               = { fg = newpaper.navy },
        -- rubyConditional                Conditional
        -- rubyConditionalModifier        rubyConditional
        rubyExceptionHandler       = { fg = newpaper.redorange, style = style.k_style },
        -- rubyRescueModifier             rubyExceptionHandler
        -- rubyRepeat                     Repeat
        -- rubyRepeatModifier             rubyRepeat
        -- rubyOptionalDo                 rubyRepeat
        rubyControl                = { fg = newpaper.keywords, style = style.k_style },
        rubyInclude                = { fg = newpaper.redorange },
        -- rubyInteger                    Number
        -- rubyCharacter                  Character
        -- rubyFloat                      Float
        -- rubyBoolean                    Boolean
        rubyException              = { fg = newpaper.redorange, style = style.k_style },

        rubyConstant               = { fg = newpaper.darkgreen },
        rubyClassName              = { fg = newpaper.ruby_navy, style = style.k_style },
        rubyModuleName             = { fg = newpaper.blue, style = style.k_style },
        rubySymbol                 = { fg = newpaper.darkyellow },
        -- rubyKeyword                    Keyword

        -- rubyBeginEnd                   Statement
        -- rubyEval                       Statement
        rubyPseudoVariable         = { fg = newpaper.maroon, style = style.v_style },
        rubyCapitalizedMethod      = { style = style.k_style },

        -- rubyComment                    Comment
        rubyEncoding               = { fg = newpaper.maroon },
        rubyMagicComment           = { fg = newpaper.comments, style = style.c_title },
        -- rubyData                       Comment
        -- rubyDataDirective              Delimiter
        -- rubyDocumentation              Comment
        -- rubyTodo                       Todo

        -- rubyBackslashEscape            rubyStringEscape
        -- rubyQuoteEscape                rubyStringEscape
        -- rubySpaceEscape                rubyStringEscape
        -- rubyParenthesisEscape          rubyStringEscape
        -- rubyCurlyBraceEscape           rubyStringEscape
        -- rubyAngleBracketEscape         rubyStringEscape
        -- rubySquareBracketEscape        rubyStringEscape
        rubyStringEscape           = { fg = newpaper.maroon },

        rubyInterpolationDelimiter = { fg = newpaper.redorange, nocombine = true },
        -- rubySharpBang                  PreProc
        rubyStringDelimiter        = { fg = newpaper.strings, style = style.s_style },
        -- rubyHeredocDelimiter           rubyStringDelimiter
        -- rubyPercentSymbolDelimiter     rubySymbolDelimiter
        rubySymbolDelimiter        = { fg = newpaper.darkyellow, style = style.d_style },
        rubyPercentStringDelimiter = { fg = newpaper.tag_navy, style = style.br_style },
        rubyCurlyBlockDelimiter    = { fg = newpaper.ruby_navy, style = style.br_style },
        rubyArrayDelimiter         = { fg = newpaper.ruby_navy, style = style.br_style },
        -- rubyString                     String
        rubyPercentRegexpDelimiter = { fg = newpaper.texts, style = style.o_style },
        rubyRegexpDelimiter        = { fg = newpaper.regexp_blue, style = style.d_style },
        rubyRegexpEscape           = { fg = newpaper.regexp_magenta },
        rubyRegexpQuantifier       = { fg = newpaper.regexp_blue, style = style.o_style },
        rubyRegexpAnchor           = { fg = newpaper.regexp_brown, style = style.o_style },
        rubyRegexpDot              = { fg = newpaper.regexp_orange },
        rubyRegexpCharClass        = { fg = newpaper.regexp_orange },
        rubyRegexpIntersection     = { fg = newpaper.regexp_brown, style = style.o_style },
        rubyRegexpSpecial          = { fg = newpaper.regexp_green },
        rubyRegexp                 = { fg = newpaper.regexp_blue, style = style.s_style },
        rubyRegexpComment          = { fg = newpaper.comments, style = style.c_title },

        -- rubyError                      Error
        -- rubyUselessLineContinuation    rubyError
        -- rubyGlobalVariableError        rubyError
        -- rubySpaceError                 rubyError

        -- rubyDoubleQuoteSymbolDelimiter rubySymbolDelimiter
        -- rubySingleQuoteSymbolDelimiter rubySymbolDelimiter

        -- eruby
        erubyDelimiter             = { fg = newpaper.redorange, style = style.d_style },
    }
    ---@diagnostic disable-next-line inject-field
    if vim.g.ruby_no_identifiers == 1 then
        hlGroups.rubyClassVariable      = { fg = newpaper.fg }
        hlGroups.rubyGlobalVariable     = { fg = newpaper.fg }
        hlGroups.rubyInstanceVariable   = { fg = newpaper.fg }
        hlGroups.rubyPredefinedConstant = { fg = newpaper.fg }
        hlGroups.rubyPredefinedVariable = { fg = newpaper.fg }
    else
        hlGroups.rubyClassVariable      = { fg = newpaper.ocean, style = style.k_style }
        hlGroups.rubyGlobalVariable     = { fg = newpaper.green, style = style.k_style }
        hlGroups.rubyInstanceVariable   = { fg = newpaper.darkengreen, style = style.v_style }
        hlGroups.rubyPredefinedConstant = { fg = newpaper.ocean, style = style.k_style }
        hlGroups.rubyPredefinedVariable = { fg = newpaper.olive, style = style.k_style }
    end
    ---@diagnostic disable-next-line inject-field
    if vim.g.ruby_operators == 1 then
        hlGroups.rubyOperator               = { fg = newpaper.navy, style = style.o_style }
        hlGroups.rubyDefinedOperator        = { fg = newpaper.navy, style = style.k_style }
        hlGroups.rubyEnglishBooleanOperator = { fg = newpaper.booleans, style = style.bool_style }
        hlGroups.rubyTernaryOperator        = { fg = newpaper.keywords, style = style.o_style }
        hlGroups.rubyArithmeticOperator     = { fg = newpaper.tex_math, style = style.o_style }
        hlGroups.rubyComparisonOperator     = { fg = newpaper.blue, style = style.o_style }
        hlGroups.rubyBitwiseOperator        = { fg = newpaper.redorange, style = style.o_style }
        hlGroups.rubyBooleanOperator        = { fg = newpaper.booleans, style = style.bool_style }
        hlGroups.rubyRangeOperator          = { fg = newpaper.tex_math, style = style.o_style }
        hlGroups.rubyAssignmentOperator     = { fg = newpaper.tag_navy, style = style.o_style }
        hlGroups.rubyEqualityOperator       = { fg = newpaper.lightmagenta, style = style.o_style }
    else
        hlGroups.rubyOperator               = { fg = newpaper.fg }
        hlGroups.rubyDefinedOperator        = { fg = newpaper.fg }
        hlGroups.rubyEnglishBooleanOperator = { fg = newpaper.fg }
        hlGroups.rubyTernaryOperator        = { fg = newpaper.fg }
        hlGroups.rubyArithmeticOperator     = { fg = newpaper.fg }
        hlGroups.rubyComparisonOperator     = { fg = newpaper.fg }
        hlGroups.rubyBitwiseOperator        = { fg = newpaper.fg }
        hlGroups.rubyBooleanOperator        = { fg = newpaper.fg }
        hlGroups.rubyRangeOperator          = { fg = newpaper.fg }
        hlGroups.rubyAssignmentOperator     = { fg = newpaper.fg }
        hlGroups.rubyEqualityOperator       = { fg = newpaper.fg }
    end
    ---@diagnostic disable-next-line inject-field
    if vim.g.ruby_pseudo_operators == 1 then
        hlGroups.rubyPseudoOperator      = { fg = newpaper.orange, style = style.o_style }
        hlGroups.rubyDotOperator         = { fg = newpaper.redorange, nocombine = true }
        hlGroups.rubyScopeOperator       = { fg = newpaper.redorange, nocombine = true }
        hlGroups.rubySuperClassOperator  = { fg = newpaper.lua_navy, style = style.o_style }
        hlGroups.rubyEigenClassOperator  = { fg = newpaper.ruby_maroon, style = style.o_style }
        hlGroups.rubyLambdaOperator      = { fg = newpaper.persimona, style = style.o_style }
        hlGroups.rubyDoubleSplatOperator = { fg = newpaper.red, style = style.o_style }
        hlGroups.rubySplatOperator       = { fg = newpaper.red, style = style.o_style }
        hlGroups.rubyProcOperator        = { fg = newpaper.persimona, style = style.o_style }
    else
        hlGroups.rubyPseudoOperator = { fg = newpaper.fg }
    end

    return hlGroups
end

return M
