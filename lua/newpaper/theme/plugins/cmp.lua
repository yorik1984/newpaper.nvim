local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local cmpSyn   = {}
    cmpSyn.colors  = configColors
    cmpSyn.style   = configStyle
    local newpaper = cmpSyn.colors
    local style    = cmpSyn.style

    cmpSyn.loadPlugins = function()
        local plugins = {
            CmpDocumentation         = { fg = newpaper.float_fg, bg = newpaper.float_bg },
            CmpDocumentationBorder   = { fg = newpaper.border, bg = newpaper.float_bg },
            CmpItemMenu              = { fg = newpaper.pmenu_fg, bg = newpaper.pmenu_bg },
            CmpItemKind              = { fg = newpaper.lightblue },
            CmpItemAbbr              = { fg = newpaper.pmenu_fg },
            CmpItemAbbrDeprecated    = { fg = newpaper.lightgrey },
            CmpItemAbbrMatch         = { fg = newpaper.navy, style = style.b_bold },
            CmpItemAbbrMatchFuzzy    = { fg = newpaper.magenta, style = style.b_bold },
            CmpItemKindText          = { fg = newpaper.string },       -- Text          = ""
            CmpItemKindMethod        = { fg = newpaper.bluegreen },    -- Method        = ""
            CmpItemKindFunction      = { fg = newpaper.navy },         -- Function      = ""
            CmpItemKindConstructor   = { fg = newpaper.bluegreen },    -- Constructor   = ""
            CmpItemKindField         = { fg = newpaper.ocean },        -- Field         = "ﰠ"
            CmpItemKindVariable      = { fg = newpaper.darkengreen },  -- Variable      = ""
            CmpItemKindClass         = { fg = newpaper.ruby_magenta }, -- Class         = "ﴯ"
            CmpItemKindInterface     = { fg = newpaper.olive },        -- Interface     = ""
            CmpItemKindModule        = { fg = newpaper.darkyellow },   -- Module        = ""
            CmpItemKindProperty      = { fg = newpaper.bluegreen },    -- Property      = "ﰠ"
            CmpItemKindUnit          = { fg = newpaper.darkpurple },   -- Unit          = "塞"
            CmpItemKindValue         = { fg = newpaper.naamber },      -- Value         = ""
            CmpItemKindEnum          = { fg = newpaper.green },        -- Enum          = ""
            CmpItemKindKeyword       = { fg = newpaper.keyword },      -- Keyword       = ""
            CmpItemKindSnippet       = { fg = newpaper.darkpurple },   -- Snippet       = ""
            CmpItemKindColor         = { fg = newpaper.magenta },      -- Color         = ""
            CmpItemKindFile          = { fg = newpaper.teal },         -- File          = ""
            CmpItemKindReference     = { fg = newpaper.darkyellow },   -- Reference     = ""
            CmpItemKindFolder        = { fg = newpaper.teal },         -- Folder        = ""
            CmpItemKindEnumMember    = { fg = newpaper.green },        -- EnumMember    = ""
            CmpItemKindConstant      = { fg = newpaper.darkengreen },  -- Constant      = ""
            CmpItemKindStruct        = { fg = newpaper.olive },        -- Struct        = "פּ"
            CmpItemKindEvent         = { fg = newpaper.orange },       -- Event         = ""
            CmpItemKindOperator      = { fg = newpaper.tag_navy },     -- Operator      = ""
            CmpItemKindTypeParameter = { fg = newpaper.orange },       -- TypeParameter = " "
        }
        return plugins
    end

    -- stylua: ignore end

    return cmpSyn
end

return M
