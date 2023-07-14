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
            LTBoolean            = { fg = newpaper.boolean, style = style.bool_style },
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
            LTString             = { fg = newpaper.string, style = style.s_style },
            LTSymbol             = { fg = newpaper.teal, style = style.underline },
            LTSymbolDetail       = { fg = newpaper.darkgreen, style = style.b_italic },
            LTSymbolJump         = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            LTSymbolJumpRefs     = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
            LTType               = { fg = newpaper.keyword },
            LTURI                = { fg = newpaper.link, style = style.link },
            LTIndentGuide        = { fg = newpaper.comment },
            LTExpandedGuide      = { fg = newpaper.comment, style = style.b_bold },
            LTCollapsedGuide     = { fg = newpaper.comment },
            LTSelectFiletree     = { fg = newpaper.string },
            LTNormalSB           = { fg = newpaper.fg, bg = newpaper.bg },
        }
        return plugins
    end

    -- stylua: ignore end

    return liteeSyn
end

return M
