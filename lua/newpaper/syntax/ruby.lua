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

        local syntax = {

            -- Basic ruby groups
            -- NOTE: basic groups init in plugins part. See below

        }

        return syntax

    end

    rubySyn.loadTreeSitter = function ()

        local treesitter = {

            rubyTSConstBuiltin    = { fg = newpaper.maroon },
            rubyTSException       = { fg = newpaper.ruby_red, style = style.k_style },
            rubyTSInclude         = { fg = newpaper.ruby_red },
            rubyTSKeywordOperator = { fg = newpaper.boolean, style = style.o_style },
            rubyTSLabel           = { fg = newpaper.darkgreen },
            rubyTSType            = { fg = newpaper.teal, style = style.k_style },
            rubyTSVariableBuiltin = { fg = newpaper.maroon },

        }

        return treesitter

    end

    rubySyn.loadPlugins = function()

        local plugins = {

            -- vim-ruby
            -- NOTE: groups from basic syntax include this

            rubyClass                      = { fg = newpaper.ruby_magenta, style = style.k_style },
            rubyModule                     = { fg = newpaper.ruby_purple, style = style.k_style },
            rubyExceptionHandler2          = { fg = newpaper.ruby_red, style = style.k_style },
            rubyDefine                     = { fg = newpaper.keyword, style = style.k_style },
            rubyAccess                     = { fg = newpaper.ruby_maroon, style = style.k_style },
            rubyAttribute                  = { fg = newpaper.magenta },
            rubyMacro                      = { fg = newpaper.magenta, style = style.k_style },
            -- rubyMethodName                 rubyFunction
            -- rubyFunction                   Function
            -- rubyConditional                Conditional
            -- rubyConditionalModifier        rubyConditional
            rubyExceptionHandler           = { fg = newpaper.ruby_red, style = style.k_style },
            -- rubyRescueModifier             rubyExceptionHandler
            -- rubyRepeat                     Repeat
            -- rubyRepeatModifier             rubyRepeat
            -- rubyOptionalDo                 rubyRepeat
            rubyControl                    = { fg = newpaper.keyword, style = style.k_style },
            rubyInclude                    = { fg = newpaper.ruby_red },
            -- rubyInteger                    Number
            -- rubyCharacter                  Character
            -- rubyFloat                      Float
            -- rubyBoolean                    Boolean
            rubyException                  = { fg = newpaper.ruby_red, style = style.k_style },

            rubyConstant                   = { fg = newpaper.teal, style = style.k_style },
            rubyClassName                  = { fg = newpaper.ruby_navy, style = style.k_style },
            rubyModuleName                 = { fg = newpaper.ocean, style = style.k_style },
            rubySymbol                     = { fg = newpaper.darkyellow },
            -- rubyKeyword                    Keyword


            -- rubyBeginEnd                   Statement
            -- rubyEval                       Statement
            rubyPseudoVariable              = { fg = newpaper.maroon },
            rubyCapitalizedMethod           = { style = style.k_style },

            -- rubyComment                    Comment
            rubyEncoding                   = { fg = newpaper.maroon },
            rubyMagicComment               = { fg = newpaper.comment, style = style.comment_title },
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
            rubyStringEscape               = { fg = newpaper.ruby_red },

            rubyInterpolationDelimiter     = { fg = newpaper.darkorange },
            -- rubySharpBang                  PreProc
            rubyStringDelimiter            = { fg = newpaper.string, style = style.s_style },
            -- rubyHeredocDelimiter           rubyStringDelimiter
            -- rubyPercentRegexpDelimiter     rubyRegexpDelimiter
            rubyPercentStringDelimiter     = { fg = newpaper.navy, style = style.o_style },
            -- rubyPercentSymbolDelimiter     rubySymbolDelimiter
            rubyRegexpDelimiter            = { fg = newpaper.ruby_blue, style = style.o_style },
            rubySymbolDelimiter            = { fg = newpaper.darkyellow, style = style.o_style },
            -- rubyString                     String
            -- rubyRegexpEscape               rubyRegexpSpecial
            -- rubyRegexpQuantifier           rubyRegexpSpecial
            -- rubyRegexpAnchor               rubyRegexpSpecial
            -- rubyRegexpDot                  rubyRegexpCharClass
            -- rubyRegexpCharClass            rubyRegexpSpecial
            -- rubyRegexpIntersection         rubyRegexpSpecial
            rubyRegexpSpecial              = { fg = newpaper.olive },
            rubyRegexpComment              = { fg = newpaper.comment, style = style.comment_title },
            rubyRegexp                     = { fg = newpaper.ruby_blue, style = style.s_style },

            -- rubyError                      Error
            -- rubyUselessLineContinuation    rubyError
            -- rubyGlobalVariableError        rubyError
            -- rubySpaceError                 rubyError

            -- rubyDoubleQuoteSymbolDelimiter rubySymbolDelimiter
            -- rubySingleQuoteSymbolDelimiter rubySymbolDelimiter

            -- eruby
            erubyDelimiter = { fg = newpaper.ruby_red },

        }

        if vim.g.ruby_no_identifiers == 1 then
            plugins.rubyClassVariable          = { fg = newpaper.fg }
            plugins.rubyGlobalVariable         = { fg = newpaper.fg }
            plugins.rubyInstanceVariable       = { fg = newpaper.fg }
            plugins.rubyPredefinedConstant     = { fg = newpaper.fg }
            plugins.rubyPredefinedVariable     = { fg = newpaper.fg }
        else
            plugins.rubyClassVariable          = { fg = newpaper.darkgreen, style = style.k_style  }
            plugins.rubyGlobalVariable         = { fg = newpaper.green, style = style.k_style }
            plugins.rubyInstanceVariable       = { fg = newpaper.darkgreen }
            plugins.rubyPredefinedConstant     = { fg = newpaper.ruby_green }
            plugins.rubyPredefinedVariable     = { fg = newpaper.ruby_green, style = style.k_style }
        end

        if vim.g.ruby_operators == 1 then
            plugins.rubyOperator               = { fg = newpaper.navy, style = style.o_style }
            -- rubyDefinedOperator               rubyOperator
            plugins.rubyEnglishBooleanOperator = { fg = newpaper.boolean, style = style.o_style }
            plugins.rubyTernaryOperator        = { fg = newpaper.keyword, style = style.o_style }
            -- rubyArithmeticOperator            rubyOperator
            plugins.rubyComparisonOperator     = { fg = newpaper.teal, style = style.o_style }
            plugins.rubyBitwiseOperator        = { fg = newpaper.redorange, style = style.o_style }
            plugins.rubyBooleanOperator        = { fg = newpaper.boolean, style = style.o_style }
            -- rubyRangeOperator                 rubyOperator
            plugins.rubyAssignmentOperator     = { fg = newpaper.navy, style = style.o_style }
            plugins.rubyEqualityOperator       = { fg = newpaper.magenta, style = style.o_style }
        else
            plugins.rubyOperator               = { fg = newpaper.fg }
            plugins.rubyEnglishBooleanOperator = { fg = newpaper.fg }
            plugins.rubyTernaryOperator        = { fg = newpaper.fg }
            plugins.rubyComparisonOperator     = { fg = newpaper.fg }
            plugins.rubyBitwiseOperator        = { fg = newpaper.fg }
            plugins.rubyBooleanOperator        = { fg = newpaper.fg }
            plugins.rubyAssignmentOperator     = { fg = newpaper.fg }
            plugins.rubyEqualityOperator       = { fg = newpaper.fg }
        end

        if vim.g.ruby_pseudo_operators == 1 then
            plugins.rubyPseudoOperator = { fg = newpaper.orange }
            -- rubyDotOperator                rubyPseudoOperator
            -- rubyScopeOperator              rubyPseudoOperator
            -- rubySuperClassOperator         rubyPseudoOperator
            -- rubyEigenClassOperator         rubyPseudoOperator
            -- rubyLambdaOperator             rubyPseudoOperator
            -- rubyDoubleSplatOperator        rubyPseudoOperator
            -- rubySplatOperator              rubyPseudoOperator
            -- rubyProcOperator               rubyPseudoOperator
        else
            plugins.rubyPseudoOperator = { fg = newpaper.fg }
        end

        return plugins
        -- LuaFormatter on

    end

    return rubySyn

end

return M
