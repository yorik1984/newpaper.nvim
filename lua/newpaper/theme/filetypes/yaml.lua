local M = {}

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

            yamlDocumentStart            = { fg = newpaper.persimona, style = style.d_style },
            yamlDocumentEnd              = { link = "yamlDocumentStart" },

            -- yamlDirectiveName            Keyword

            -- yamlTAGDirective             yamlDirectiveName
            -- yamlTagHandle                String
            -- yamlTagPrefix                String

            -- yamlYAMLDirective            yamlDirectiveName
            -- yamlReservedDirective        Error
            yamlYAMLVersion              = { fg = newpaper.red, style = style.o_style },

            yamlString                   = { fg = newpaper.strings, style = style.s_style },
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
            yamlBool                     = { fg = newpaper.booleans, style = style.bool_style },

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

        local treesitter = {
            ["@constant.builtin.yaml"]    = { fg = newpaper.ocean, style = style.k_style },
            ["@property.yaml"]            = { fg = newpaper.ocean, style = style.f_style, nocombine = true },
            ["@punctuation.special.yaml"] = { fg = newpaper.magenta },
        }

        return treesitter
    end

    -- stylua: ignore end

    return yamlSyn
end

return M
