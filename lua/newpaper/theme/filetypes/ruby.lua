local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local rubySyn  = {}
    rubySyn.colors = configColors
    rubySyn.style  = configStyle
    local newpaper = rubySyn.colors
    local style    = rubySyn.style

    rubySyn.loadSyntax = function()
        local syntax = {
            -- Basic ruby groups
            -- NOTE: basic groups init in plugins part. See below
        }
        return syntax
    end

    rubySyn.loadTreeSitter = function()
        local treesitter = {
            ["@constant.builtin.ruby"]         = { fg = newpaper.ruby_maroon, nocombine = true },
            ["@constant.predef.ruby"]          = { fg = newpaper.ocean, style = style.k_style, nocombine = true},
            ["@constructor.ruby"]              = { fg = newpaper.blue, style = style.o_style },
            ["@function.call.ruby"]            = { fg = newpaper.ruby_navy, style = style.f_style },
            ["@label.ruby"]                    = { fg = newpaper.tex_magenta, style = style.doc_style, nocombine = true },
            ["@local.definition.var.ruby"]     = { fg = newpaper.ruby_orange, style = style.v_style },
            ["@markup.italic.ruby"]            = { style = style.none, nocombine = true },
            ["@type.ruby"]                     = { fg = newpaper.darkgreen, nocombine = true },
            ["@variable.global.predef.ruby"]   = { fg = newpaper.olive, style = style.k_style, nocombine = true },
            ["@variable.member.instance.ruby"] = { fg = newpaper.darkengreen, nocombine = true },
            ["@variable.member.ruby"]          = { fg = newpaper.ocean, style = style.k_style, nocombine = true },

            ["@local.definition.type.super.ruby"] = { fg = newpaper.navy, style = style.k_style },

            -- LSP semantic tokens
            ["@lsp.type.method.ruby"]               = { default = true },
            ["@lsp.type.namespace.ruby"]            = { default = true },
            ["@lsp.typemod.class.declaration.ruby"] = { link = "@local.definition.type" },

            -- embedded template
            ["@keyword.embedded_template"] = { fg = newpaper.redorange, nocombine = true },
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
            rubyControl                    = { fg = newpaper.keywords, style = style.k_style },
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
            rubyMagicComment               = { fg = newpaper.comments, style = style.c_title },
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
            rubyStringEscape               = { fg = newpaper.maroon },

            rubyInterpolationDelimiter     = { fg = newpaper.redorange, nocombine = true },
            -- rubySharpBang                  PreProc
            rubyStringDelimiter            = { fg = newpaper.strings, style = style.s_style },
            -- rubyHeredocDelimiter           rubyStringDelimiter
            -- rubyPercentSymbolDelimiter     rubySymbolDelimiter
            rubySymbolDelimiter            = { fg = newpaper.darkyellow, style = style.d_style },
            rubyPercentStringDelimiter     = { fg = newpaper.tag_navy, style = style.br_style },
            rubyCurlyBlockDelimiter        = { fg = newpaper.ruby_navy, style = style.br_style },
            rubyArrayDelimiter             = { fg = newpaper.ruby_navy, style = style.br_style },
            -- rubyString                     String
            rubyPercentRegexpDelimiter     = { fg = newpaper.texts, style = style.o_style },
            rubyRegexpDelimiter            = { fg = newpaper.regexp_blue, style = style.d_style },
            rubyRegexpEscape               = { fg = newpaper.regexp_magenta },
            rubyRegexpQuantifier           = { fg = newpaper.regexp_blue, style = style.o_style },
            rubyRegexpAnchor               = { fg = newpaper.regexp_brown, style = style.o_style },
            rubyRegexpDot                  = { fg = newpaper.regexp_orange },
            rubyRegexpCharClass            = { fg = newpaper.regexp_orange },
            rubyRegexpIntersection         = { fg = newpaper.regexp_brown, style = style.o_style },
            rubyRegexpSpecial              = { fg = newpaper.regexp_green },
            rubyRegexp                     = { fg = newpaper.regexp_blue, style = style.s_style },
            rubyRegexpComment              = { fg = newpaper.comments, style = style.c_title },

            -- rubyError                      Error
            -- rubyUselessLineContinuation    rubyError
            -- rubyGlobalVariableError        rubyError
            -- rubySpaceError                 rubyError

            -- rubyDoubleQuoteSymbolDelimiter rubySymbolDelimiter
            -- rubySingleQuoteSymbolDelimiter rubySymbolDelimiter

            -- eruby
            erubyDelimiter = { fg = newpaper.redorange, style = style.d_style },
        }
        ---@diagnostic disable-next-line inject-field
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
        ---@diagnostic disable-next-line inject-field
        if vim.g.ruby_operators == 1 then
            plugins.rubyOperator               = { fg = newpaper.navy, style = style.o_style }
            plugins.rubyDefinedOperator        = { fg = newpaper.navy, style = style.k_style }
            plugins.rubyEnglishBooleanOperator = { fg = newpaper.booleans, style = style.bool_style }
            plugins.rubyTernaryOperator        = { fg = newpaper.keywords, style = style.o_style }
            plugins.rubyArithmeticOperator     = { fg = newpaper.tex_math, style = style.o_style }
            plugins.rubyComparisonOperator     = { fg = newpaper.blue, style = style.o_style }
            plugins.rubyBitwiseOperator        = { fg = newpaper.redorange, style = style.o_style }
            plugins.rubyBooleanOperator        = { fg = newpaper.booleans,   style = style.bool_style }
            plugins.rubyRangeOperator          = { fg = newpaper.tex_math, style = style.o_style }
            plugins.rubyAssignmentOperator     = { fg = newpaper.tag_navy, style = style.o_style }
            plugins.rubyEqualityOperator       = { fg = newpaper.lightmagenta, style = style.o_style }
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
        ---@diagnostic disable-next-line inject-field
        if vim.g.ruby_pseudo_operators == 1 then
            plugins.rubyPseudoOperator         = { fg = newpaper.orange, style = style.o_style }
            plugins.rubyDotOperator            = { fg = newpaper.redorange, nocombine = true }
            plugins.rubyScopeOperator          = { fg = newpaper.redorange, nocombine = true }
            plugins.rubySuperClassOperator     = { fg = newpaper.lua_navy, style = style.o_style }
            plugins.rubyEigenClassOperator     = { fg = newpaper.ruby_maroon, style = style.o_style }
            plugins.rubyLambdaOperator         = { fg = newpaper.persimona, style = style.o_style }
            plugins.rubyDoubleSplatOperator    = { fg = newpaper.red, style = style.o_style }
            plugins.rubySplatOperator          = { fg = newpaper.red, style = style.o_style }
            plugins.rubyProcOperator           = { fg = newpaper.persimona, style = style.o_style }
        else
            plugins.rubyPseudoOperator = { fg = newpaper.fg }
        end
        return plugins
    end

    -- stylua: ignore end

    return rubySyn
end

return M
