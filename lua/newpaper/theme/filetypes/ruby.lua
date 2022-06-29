local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local rubySyn  = {}
    rubySyn.colors = configColors
    rubySyn.style  = configStyle
    local newpaper = rubySyn.colors
    local style    = rubySyn.style

    rubySyn.loadSyntax = function ()
        local syntax = {
            -- Basic ruby groups
            -- NOTE: basic groups init in plugins part. See below
        }
        return syntax
    end

    rubySyn.loadTreeSitter = function ()
        local treesitter = {
            rubyTSConstructor     = { fg = newpaper.blue, style = style.o_style },
            rubyTSConstBuilin     = { fg = newpaper.ruby_maroon },
            rubyTSFuncMacro       = { fg = newpaper.ruby_maroon, style = style.k_style },
            rubyTSException       = { fg = newpaper.redorange, style = style.k_style },
            rubyTSInclude         = { fg = newpaper.redorange },
            rubyTSKeywordOperator = { fg = newpaper.navy, style = style.k_style },
            rubyTSLabel           = { fg = newpaper.darkengreen },
            rubyTSMath            = { fg = newpaper.tex_math, style = style.o_style },
            rubyTSConstant        = { fg = newpaper.ocean, style = style.k_style },
            rubyTSPunctSpecial    = { fg = newpaper.magenta, style = style.o_style },
            rubyTSStorageClass    = { fg = newpaper.ruby_navy, style = style.k_style },
            rubyTSTypeQualifier   = { fg = newpaper.green, style = style.k_style },
            rubyTSType            = { fg = newpaper.darkgreen },
        }
        return treesitter
    end

    rubySyn.loadPlugins = function()

        local plugins = {
            -- vim-ruby
            -- NOTE: groups from basic syntax include this
            rubyClass                      = { fg = newpaper.ruby_magenta, style = style.k_style },
            rubyModule                     = { fg = newpaper.ruby_purple,  style = style.k_style },
            rubyExceptionHandler2          = { fg = newpaper.redorange,    style = style.k_style },
            rubyDefine                     = { fg = newpaper.darkpurple,   style = style.k_style },
            rubyAccess                     = { fg = newpaper.ruby_maroon,  style = style.k_style },
            rubyAttribute                  = { fg = newpaper.redorange },
            rubyMacro                      = { fg = newpaper.darkpurple, style = style.k_style }, -- rubyMethodName                 rubyFunction rubyFunction                   = { fg = newpaper.navy },
            -- rubyConditional                Conditional
            -- rubyConditionalModifier        rubyConditional
            rubyExceptionHandler           = { fg = newpaper.redorange, style = style.k_style },
            -- rubyRescueModifier             rubyExceptionHandler
            -- rubyRepeat                     Repeat
            -- rubyRepeatModifier             rubyRepeat
            -- rubyOptionalDo                 rubyRepeat
            rubyControl                    = { fg = newpaper.keyword, style = style.k_style },
            rubyInclude                    = { fg = newpaper.redorange },
            -- rubyInteger                    Number
            -- rubyCharacter                  Character
            -- rubyFloat                      Float
            -- rubyBoolean                    Boolean
            rubyException                  = { fg = newpaper.redorange,  style = style.k_style },

            rubyConstant                   = { fg = newpaper.darkgreen },
            rubyClassName                  = { fg = newpaper.ruby_navy, style = style.k_style },
            rubyModuleName                 = { fg = newpaper.blue, style = style.k_style },
            rubySymbol                     = { fg = newpaper.darkyellow },
            -- rubyKeyword                    Keyword


            -- rubyBeginEnd                   Statement
            -- rubyEval                       Statement
            rubyPseudoVariable              = { fg = newpaper.maroon, style = style.v_style },
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
            rubyStringEscape               = { fg = newpaper.redorange },

            rubyInterpolationDelimiter     = { fg = newpaper.darkorange },
            -- rubySharpBang                  PreProc
            rubyStringDelimiter            = { fg = newpaper.string, style = style.s_style },
            -- rubyHeredocDelimiter           rubyStringDelimiter
            -- rubyPercentSymbolDelimiter     rubySymbolDelimiter
            rubySymbolDelimiter            = { fg = newpaper.darkyellow },
            rubyPercentStringDelimiter     = { fg = newpaper.tag_navy,   style = style.o_style },
            -- rubyString                     String
            rubyPercentRegexpDelimiter     = { fg = newpaper.text,        style = style.o_style },
            rubyRegexpDelimiter            = { fg = newpaper.regexp_blue, style = style.o_style },
            rubyRegexpEscape               = { fg = newpaper.regexp_magenta },
            rubyRegexpQuantifier           = { fg = newpaper.regexp_blue,  style = style.o_style },
            rubyRegexpAnchor               = { fg = newpaper.regexp_brown, style = style.o_style },
            rubyRegexpDot                  = { fg = newpaper.regexp_orange },
            rubyRegexpCharClass            = { fg = newpaper.regexp_orange },
            rubyRegexpIntersection         = { fg = newpaper.regexp_brown, style = style.o_style },
            rubyRegexpSpecial              = { fg = newpaper.regexp_green },
            rubyRegexp                     = { fg = newpaper.regexp_blue, style = style.s_style },
            rubyRegexpComment              = { fg = newpaper.comment,     style = style.comment_title },

            -- rubyError                      Error
            -- rubyUselessLineContinuation    rubyError
            -- rubyGlobalVariableError        rubyError
            -- rubySpaceError                 rubyError

            -- rubyDoubleQuoteSymbolDelimiter rubySymbolDelimiter
            -- rubySingleQuoteSymbolDelimiter rubySymbolDelimiter

            -- eruby
            erubyDelimiter = { fg = newpaper.redorange },
        }
        if vim.g.ruby_no_identifiers == 1 then
            plugins.rubyClassVariable          = { fg = newpaper.fg }
            plugins.rubyGlobalVariable         = { fg = newpaper.fg }
            plugins.rubyInstanceVariable       = { fg = newpaper.fg }
            plugins.rubyPredefinedConstant     = { fg = newpaper.fg }
            plugins.rubyPredefinedVariable     = { fg = newpaper.fg }
        else
            plugins.rubyClassVariable          = { fg = newpaper.ocean, style = style.k_style }
            plugins.rubyGlobalVariable         = { fg = newpaper.green, style = style.k_style }
            plugins.rubyInstanceVariable       = { fg = newpaper.darkengreen, style = style.v_style }
            plugins.rubyPredefinedConstant     = { fg = newpaper.ocean, style = style.k_style }
            plugins.rubyPredefinedVariable     = { fg = newpaper.olive, style = style.k_style }
        end
        if vim.g.ruby_operators == 1 then
            plugins.rubyOperator               = { fg = newpaper.navy, style = style.o_style }
            plugins.rubyDefinedOperator        = { fg = newpaper.navy, style = style.k_style }
            plugins.rubyEnglishBooleanOperator = { fg = newpaper.boolean, style = style.o_style }
            plugins.rubyTernaryOperator        = { fg = newpaper.keyword, style = style.o_style }
            plugins.rubyArithmeticOperator     = { fg = newpaper.tex_math, style = style.o_style }
            plugins.rubyComparisonOperator     = { fg = newpaper.blue, style = style.o_style }
            plugins.rubyBitwiseOperator        = { fg = newpaper.redorange, style = style.o_style }
            plugins.rubyBooleanOperator        = { fg = newpaper.boolean,   style = style.o_style }
            plugins.rubyRangeOperator          = { fg = newpaper.keyword, style = style.o_style }
            plugins.rubyAssignmentOperator     = { fg = newpaper.tag_navy, style = style.o_style }
            plugins.rubyEqualityOperator       = { fg = newpaper.magenta,  style = style.o_style }
        else
            plugins.rubyOperator               = { fg = newpaper.fg }
            plugins.rubyDefinedOperator        = { fg = newpaper.fg }
            plugins.rubyEnglishBooleanOperator = { fg = newpaper.fg }
            plugins.rubyTernaryOperator        = { fg = newpaper.fg }
            plugins.rubyArithmeticOperator     = { fg = newpaper.fg }
            plugins.rubyComparisonOperator     = { fg = newpaper.fg }
            plugins.rubyBitwiseOperator        = { fg = newpaper.fg }
            plugins.rubyBooleanOperator        = { fg = newpaper.fg }
            plugins.rubyRangeOperator          = { fg = newpaper.fg }
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
    end

    -- stylua: ignore end

    return rubySyn
end

return M
