local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local liteeSyn  = {}
    liteeSyn.colors = configColors
    liteeSyn.style  = configStyle
    local newpaper  = liteeSyn.colors
    local style     = liteeSyn.style

    liteeSyn.loadPlugins = function()
        local plugins = {
            LTBoolean            = { fg = newpaper.booleans, style = style.bool_style },
            LTConstant           = { fg = newpaper.darkengreen },
            LTConstructor        = { fg = newpaper.bluegreen },
            LTField              = { fg = newpaper.ocean },
            LTFunction           = { fg = newpaper.navy },
            LTMethod             = { fg = newpaper.ruby_navy },
            LTNamespace          = { fg = newpaper.darkyellow },
            LTNumber             = { fg = newpaper.red },
            LTOperator           = { fg = newpaper.teal },
            LTParameter          = { fg = newpaper.orange },
            LTParameterReference = { fg = newpaper.olive },
            LTString             = { fg = newpaper.strings, style = style.s_style },
            LTSymbol             = { fg = newpaper.teal, style = style.underline },
            LTSymbolDetail       = { fg = newpaper.darkgreen, style = style.b_italic },
            LTSymbolJump         = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            LTSymbolJumpRefs     = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
            LTType               = { fg = newpaper.keywords },
            LTURI                = { fg = newpaper.links, style = style.links },
            LTIndentGuide        = { fg = newpaper.comments },
            LTExpandedGuide      = { fg = newpaper.comments, style = style.b_bold },
            LTCollapsedGuide     = { fg = newpaper.comments },
            LTSelectFiletree     = { fg = newpaper.strings },
            LTNormalSB           = { fg = newpaper.fg, bg = newpaper.bg },
        }
        return plugins
    end

    -- stylua: ignore end

    return liteeSyn
end

return M
