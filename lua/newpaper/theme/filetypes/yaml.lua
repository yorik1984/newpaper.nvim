local util = require("newpaper.util")
local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local yamlSyn  = {}
    yamlSyn.colors = configColors
    yamlSyn.style  = configStyle
    local newpaper = yamlSyn.colors
    local style    = yamlSyn.style

    yamlSyn.loadSyntax = function()
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
            yamlYAMLVersion              = { fg = newpaper.red, style = style.o_style },

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
            yamlFlowIndicator            = { fg = newpaper.tag_navy, style = style.br_style },
            yamlKeyValueDelimiter        = { fg = newpaper.persimona, style = style.d_style },

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

    yamlSyn.loadTreeSitter = function()

        -- fallback to 0.7
        local treesitterOldKey = {
            ["@constant.builtin.yaml"]    = "yamlTSConstBuiltin",
            ["@field.yaml"]               = "yamlTSField",
            ["@punctuation.bracket.yaml"] = "yamlTSPunctBracket",
            ["@punctuation.special.yaml"] = "yamlTSPunctSpecial",
            ["@string.escape.yaml"]       = "yamlTSStringEscape",
        }

        local treesitter = {
            ["@constant.builtin.yaml"]    = { fg = newpaper.ocean, style = style.k_style },
            ["@field.yaml"]               = { fg = newpaper.ocean, style = style.f_style, nocombine = true },
            ["@punctuation.bracket.yaml"] = { fg = newpaper.tag_navy, style = style.br_style },
            ["@punctuation.special.yaml"] = { fg = newpaper.magenta },
            ["@string.escape.yaml"]       = { fg = newpaper.magenta },
        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
    end

    yamlSyn.loadPlugins = function()
        local plugins = {}
        return plugins
    end

    -- stylua: ignore end

    return yamlSyn
end

return M
