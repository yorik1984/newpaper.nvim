local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local rubySyn  = {}
    rubySyn.colors = require("newpaper.colors").setup(config)
    rubySyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = rubySyn.colors
    local style    = rubySyn.style

    -- LuaFormatter off

    rubySyn.loadSyntax = function ()

        -- Language syntax highlight groups

        local syntax = {

            -- rubyClass                      rubyDefine
            -- rubyModule                     rubyDefine
            -- rubyExceptionHandler2          rubyDefine
            -- rubyDefine                     Define
            -- rubyAccess                     rubyMacro
            -- rubyAttribute                  rubyMacro
            -- rubyMacro                      Macro
            -- rubyMethodName                 rubyFunction
            -- rubyFunction                   Function
            -- rubyConditional                Conditional
            -- rubyConditionalModifier        rubyConditional
            -- rubyExceptionHandler           rubyConditional
            -- rubyRescueModifier             rubyExceptionHandler
            -- rubyRepeat                     Repeat
            -- rubyRepeatModifier             rubyRepeat
            -- rubyOptionalDo                 rubyRepeat
            -- rubyControl                    Statement
            -- rubyInclude                    Include
            -- rubyInteger                    Number
            -- rubyCharacter                  Character
            -- rubyFloat                      Float
            -- rubyBoolean                    Boolean
            -- rubyException                  Exception

            -- Ruby identifiers
            -- rubyIdentifier                 Identifier
            -- rubyClassVariable              rubyIdentifier
            -- rubyConstant                   Type
            -- rubyClassName                  rubyConstant
            -- rubyModuleName                 rubyConstant
            -- rubyGlobalVariable             rubyIdentifier
            -- rubyInstanceVariable           rubyIdentifier
            -- rubyPredefinedIdentifier       rubyIdentifier
            -- rubyPredefinedConstant         rubyPredefinedIdentifier
            -- rubyPredefinedVariable         rubyPredefinedIdentifier
            -- rubySymbol                     Constant
            -- rubyKeyword                    Keyword

            -- Ruby operators
            -- rubyOperator                   Operator
            -- rubyDefinedOperator            rubyOperator
            -- rubyEnglishBooleanOperator     rubyOperator

            -- rubyTernaryOperator            rubyOperator
            -- rubyArithmeticOperator         rubyOperator
            -- rubyComparisonOperator         rubyOperator
            -- rubyBitwiseOperator            rubyOperator
            -- rubyBooleanOperator            rubyOperator
            -- rubyRangeOperator              rubyOperator
            -- rubyAssignmentOperator         rubyOperator
            -- rubyEqualityOperator           rubyOperator

            -- rubyPseudoOperator             Special
            -- rubyDotOperator                rubyPseudoOperator
            -- rubyScopeOperator              rubyPseudoOperator
            -- rubySuperClassOperator         rubyPseudoOperator
            -- rubyEigenClassOperator         rubyPseudoOperator
            -- rubyLambdaOperator             rubyPseudoOperator
            -- rubyDoubleSplatOperator        rubyPseudoOperator
            -- rubySplatOperator              rubyPseudoOperator
            -- rubyProcOperator               rubyPseudoOperator

            -- rubyBeginEnd                   Statement
            -- rubyEval                       Statement
            -- rubyPseudoVariable             Constant
            -- rubyCapitalizedMethod          NONE

            -- rubyComment                    Comment
            -- rubyEncoding                   Constant
            -- rubyMagicComment               SpecialComment
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
            -- rubyStringEscape               Special

            -- rubyInterpolationDelimiter     Delimiter
            -- rubySharpBang                  PreProc
            -- rubyStringDelimiter            Delimiter
            -- rubyHeredocDelimiter           rubyStringDelimiter
            -- rubyPercentRegexpDelimiter     rubyRegexpDelimiter
            -- rubyPercentStringDelimiter     rubyStringDelimiter
            -- rubyPercentSymbolDelimiter     rubySymbolDelimiter
            -- rubyRegexpDelimiter            rubyStringDelimiter
            -- rubySymbolDelimiter            rubySymbol
            -- rubyString                     String
            -- rubyRegexpEscape               rubyRegexpSpecial
            -- rubyRegexpQuantifier           rubyRegexpSpecial
            -- rubyRegexpAnchor               rubyRegexpSpecial
            -- rubyRegexpDot                  rubyRegexpCharClass
            -- rubyRegexpCharClass            rubyRegexpSpecial
            -- rubyRegexpIntersection         rubyRegexpSpecial
            -- rubyRegexpSpecial              Special
            -- rubyRegexpComment              Comment
            -- rubyRegexp                     rubyString

            -- rubyError                      Error
            -- rubyUselessLineContinuation    rubyError
            -- rubyGlobalVariableError        rubyError
            -- rubySpaceError                 rubyError

            -- eruby
            erubyDelimiter = { fg = newpaper.ruby_red },

        }

        return syntax

    end

    rubySyn.loadTreeSitter = function ()

        -- Language treeSitter highlight syntax groups

        local treesitter = {



        }

        return treesitter

    end

    rubySyn.loadPlugins = function()

        -- Language special plugins highlight groups

        local plugins = {

            -- vim-ruby

            -- rubyDoubleQuoteSymbolDelimiter rubySymbolDelimiter
            -- rubySingleQuoteSymbolDelimiter rubySymbolDelimiter

        }

        return plugins
        -- LuaFormatter on

    end

    return rubySyn

end

return M
