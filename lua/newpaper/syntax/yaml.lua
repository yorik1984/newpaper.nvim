local M = {}

function M.setup(config)
    config = config or require("newpaper.config").config

    local yamlSyn  = {}
    yamlSyn.colors = require("newpaper.colors").setup(config)
    yamlSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper = yamlSyn.colors
    local style    = yamlSyn.style

    -- LuaFormatter off

    yamlSyn.loadSyntax = function ()

        -- yaml highlight groups
        -- Neovim >=0.6.0 include basic yaml syntax

        local syntax = {

            -- yamlTodo                     Todo
            -- yamlComment                  Comment

            yamlDocumentStart            = { fg = newpaper.magenta },
            yamlDocumentEnd              = { fg = newpaper.magenta },

            -- yamlDirectiveName            Keyword

            -- yamlTAGDirective             yamlDirectiveName
            -- yamlTagHandle                String
            -- yamlTagPrefix                String

            -- yamlYAMLDirective            yamlDirectiveName
            -- yamlReservedDirective        Error
            yamlYAMLVersion              = { fg = newpaper.number, style = style.o_style },

            yamlString                   = { fg = newpaper.string, style = style.s_style },
            -- yamlFlowString               yamlString
            -- yamlFlowStringDelimiter      yamlString
            yamlEscape                   = { fg = newpaper.magenta },
            yamlSingleEscape             = { fg = newpaper.magenta },

            yamlBlockCollectionItemStart = { fg = newpaper.orange },
            yamlBlockMappingKey          = { fg = newpaper.ocean, style = style.f_style },
            -- yamlBlockMappingMerge        Special
            --
            yamlFlowMappingKey           = { fg = newpaper.navy, style = style.f_style },
            -- yamlFlowMappingMerge         Special

            yamlMappingKeyStart          = { fg = newpaper.orange },
            yamlFlowIndicator            = { fg = newpaper.keyword, style = style.o_style },
            yamlKeyValueDelimiter        = { fg = newpaper.orange },

            yamlConstant                 = { fg = newpaper.darkengreen, style = style.k_style  },

            yamlNull                     = { fg = newpaper.maroon,  style = style.k_style },
            yamlBool                     = { fg = newpaper.boolean, style = style.k_style },

            -- yamlAnchor                   Type
            -- yamlAlias                    Type
            -- yamlNodeTag                  Type
            --
            -- yamlInteger                  Number
            -- yamlFloat                    Float
            yamlTimestamp                = { fg = newpaper.maroon },

        }

        return syntax

    end

    yamlSyn.loadTreeSitter = function ()

        -- yaml treeSitter highlight syntax groups

        local treesitter = {

            -- yamlTSBoolean
            -- yamlTSNumber
            -- yamlTSComment
            -- yamlTSKeyword
            -- yamlTSError
            -- yamlTSPunctDelimiter
            -- yamlTSConstBuiltin
            yamlTSStringEscape   = { fg = newpaper.magenta },
            -- yamlTSType
            yamlTSString         = { fg = newpaper.string,  style = style.s_style },
            yamlTSPunctSpecial   = { fg = newpaper.magenta },
            yamlTSField          = { fg = newpaper.ocean,   style = style.f_style },
            yamlTSPunctBracket   = { fg = newpaper.keyword, style = style.o_style },

        }

        return treesitter

    end

    yamlSyn.loadPlugins = function()

        -- yaml special plugins highlight groups

        local plugins = {}

        return plugins
        -- LuaFormatter on

    end

    return yamlSyn

end

return M
