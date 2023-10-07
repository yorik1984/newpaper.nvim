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
            CmpItemMenu              = { fg = newpaper.pmenu_fg },
            CmpItemKind              = { fg = newpaper.lightblue },
            CmpItemKindDefault       = { fg = newpaper.maroon },
            CmpItemAbbr              = { fg = newpaper.pmenu_fg },
            CmpItemAbbrDeprecated    = { fg = newpaper.lightgrey },
            CmpItemAbbrMatch         = { fg = newpaper.tag_navy, style = style.b_bold },
            CmpItemAbbrMatchFuzzy    = { fg = newpaper.magenta,  style = style.b_bold },
            CmpItemKindText          = { fg = newpaper.strings },      -- Text          = "󰉿"
            CmpItemKindMethod        = { fg = newpaper.ruby_navy },    -- Method        = "󰆧"
            CmpItemKindFunction      = { fg = newpaper.navy },         -- Function      = "󰊕"
            CmpItemKindConstructor   = { fg = newpaper.lua_blue },     -- Constructor   = ""
            CmpItemKindField         = { fg = newpaper.ocean },        -- Field         = "󰜢"
            CmpItemKindVariable      = { fg = newpaper.darkengreen },  -- Variable      = "󰀫"
            CmpItemKindClass         = { fg = newpaper.ruby_magenta }, -- Class         = "󰠱"
            CmpItemKindInterface     = { fg = newpaper.olive },        -- Interface     = ""
            CmpItemKindModule        = { fg = newpaper.lua_navy },     -- Module        = ""
            CmpItemKindProperty      = { fg = newpaper.bluegreen },    -- Property      = "󰜢"
            CmpItemKindUnit          = { fg = newpaper.darkpurple },   -- Unit          = "󰑭"
            CmpItemKindValue         = { fg = newpaper.numbers },      -- Value         = "󰎠"
            CmpItemKindEnum          = { fg = newpaper.maroon },       -- Enum          = ""
            CmpItemKindKeyword       = { fg = newpaper.keywords },     -- Keyword       = "󰌋"
            CmpItemKindSnippet       = { fg = newpaper.darkpurple },   -- Snippet       = ""
            CmpItemKindColor         = { fg = newpaper.magenta },      -- Color         = "󰏘"
            CmpItemKindFile          = { fg = newpaper.teal },         -- File          = "󰈙"
            CmpItemKindReference     = { fg = newpaper.darkyellow },   -- Reference     = "󰈇"
            CmpItemKindFolder        = { fg = newpaper.teal },         -- Folder        = "󰉋"
            CmpItemKindEnumMember    = { fg = newpaper.redorange },    -- EnumMember    = ""
            CmpItemKindConstant      = { fg = newpaper.darkgreen },    -- Constant      = "󰏿"
            CmpItemKindStruct        = { fg = newpaper.olive },        -- Struct        = "󰙅"
            CmpItemKindEvent         = { fg = newpaper.orange },       -- Event         = ""
            CmpItemKindOperator      = { fg = newpaper.tag_navy },     -- Operator      = "󰆕"
            CmpItemKindTypeParameter = { fg = newpaper.tex_orange },   -- TypeParameter = ""
        }
        return plugins
    end

    -- stylua: ignore end

    return cmpSyn
end

return M
