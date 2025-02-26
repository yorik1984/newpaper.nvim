local M = {}

function M.setup(configColors, configStyle)
    local cmpSyn       = {}
    cmpSyn.colors      = configColors
    cmpSyn.style       = configStyle
    local newpaper     = cmpSyn.colors
    local style        = cmpSyn.style

    cmpSyn.loadPlugins = function()
        local plugins = {
            CmpItemMenu              = { fg = newpaper.pmenu_fg, nocombine = true },
            CmpItemKind              = { fg = newpaper.lightblue, nocombine = true },
            CmpItemKindDefault       = { fg = newpaper.maroon, nocombine = true },
            CmpItemAbbr              = { fg = newpaper.pmenu_fg, nocombine = true },
            CmpItemAbbrDeprecated    = { fg = newpaper.lightgrey, nocombine = true },
            CmpItemAbbrMatch         = { fg = newpaper.tag_navy, style = style.b_bold, nocombine = true },
            CmpItemAbbrMatchFuzzy    = { fg = newpaper.magenta, style = style.b_bold, nocombine = true },
            CmpItemKindText          = { fg = newpaper.strings, nocombine = true },      -- Text          = "󰉿"
            CmpItemKindMethod        = { fg = newpaper.ruby_navy, nocombine = true },    -- Method        = "󰆧"
            CmpItemKindFunction      = { fg = newpaper.navy, nocombine = true },         -- Function      = "󰊕"
            CmpItemKindConstructor   = { fg = newpaper.lua_blue, nocombine = true },     -- Constructor   = ""
            CmpItemKindField         = { fg = newpaper.ocean, nocombine = true },        -- Field         = "󰜢"
            CmpItemKindVariable      = { fg = newpaper.darkengreen, nocombine = true },  -- Variable      = "󰀫"
            CmpItemKindClass         = { fg = newpaper.ruby_magenta, nocombine = true }, -- Class         = "󰠱"
            CmpItemKindInterface     = { fg = newpaper.olive, nocombine = true },        -- Interface     = ""
            CmpItemKindModule        = { fg = newpaper.lua_navy, nocombine = true },     -- Module        = ""
            CmpItemKindProperty      = { fg = newpaper.bluegreen, nocombine = true },    -- Property      = "󰜢"
            CmpItemKindUnit          = { fg = newpaper.darkpurple, nocombine = true },   -- Unit          = "󰑭"
            CmpItemKindValue         = { fg = newpaper.numbers, nocombine = true },      -- Value         = "󰎠"
            CmpItemKindEnum          = { fg = newpaper.maroon, nocombine = true },       -- Enum          = ""
            CmpItemKindKeyword       = { fg = newpaper.keywords, nocombine = true },     -- Keyword       = "󰌋"
            CmpItemKindSnippet       = { fg = newpaper.darkpurple, nocombine = true },   -- Snippet       = ""
            CmpItemKindColor         = { fg = newpaper.magenta, nocombine = true },      -- Color         = "󰏘"
            CmpItemKindFile          = { fg = newpaper.teal, nocombine = true },         -- File          = "󰈙"
            CmpItemKindReference     = { fg = newpaper.darkyellow, nocombine = true },   -- Reference     = "󰈇"
            CmpItemKindFolder        = { fg = newpaper.teal, nocombine = true },         -- Folder        = "󰉋"
            CmpItemKindEnumMember    = { fg = newpaper.redorange, nocombine = true },    -- EnumMember    = ""
            CmpItemKindConstant      = { fg = newpaper.darkgreen, nocombine = true },    -- Constant      = "󰏿"
            CmpItemKindStruct        = { fg = newpaper.olive, nocombine = true },        -- Struct        = "󰙅"
            CmpItemKindEvent         = { fg = newpaper.orange, nocombine = true },       -- Event         = ""
            CmpItemKindOperator      = { fg = newpaper.tag_navy, nocombine = true },     -- Operator      = "󰆕"
            CmpItemKindTypeParameter = { fg = newpaper.tex_orange, nocombine = true },   -- TypeParameter = ""

            -- https://github.com/xzbdmw/colorful-menu.nvim
            CmpItemAbbrMatchCM       = { style = style.b_bold },
        }
        return plugins
    end

    return cmpSyn
end

return M
