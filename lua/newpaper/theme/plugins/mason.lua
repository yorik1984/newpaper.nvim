local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local masonSyn  = {}
    masonSyn.colors = configColors
    masonSyn.style  = configStyle
    local newpaper  = masonSyn.colors
    local style     = masonSyn.style

    masonSyn.loadPlugins = function()
        local plugins = {
            -- Nvim-lsp-installer ----------------------------------------------
            LspInstallerServerExpanded       = { fg = newpaper.fg,        style = style.b_italic },
            LspInstallerHighlighted          = { fg = newpaper.blue },
            LspInstallerVaderSaber           = { fg = newpaper.redorange, style = style.b_bold },
            LspInstallerHeading              = { fg = newpaper.keyword,   style = style.b_bold },
            LspInstallerOrange               = { fg = newpaper.orange },
            LspInstallerHeader               = { fg = newpaper.orange,    style = style.b_bold },
            LspInstallerMuted                = { fg = newpaper.comment },
            LspInstallerLabel                = { fg = newpaper.fg,        style = style.b_bold },
            LspInstallerGreen                = { fg = newpaper.darkgreen },
            LspInstallerError                = { fg = newpaper.errormsg_fg },
            LspInstallerLink                 = { fg = newpaper.link,      style = style.underline },

            MasonHeader                      = { link = "LspInstallerHeader" },
            MasonHeaderSecondary             = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            MasonHighlight                   = { link = "LspInstallerGreen" },
            MasonHighlightBlock              = { fg = newpaper.fg, bg = newpaper.aqua, },
            MasonHighlightBlockBold          = { fg = newpaper.fg, bg = newpaper.aqua, style = style.b_bold },
            MasonHighlightSecondary          = { link = "LspInstallerOrange"},
            MasonHighlightBlockSecondary     = { fg = newpaper.fg, bg = newpaper.lightorange },
            MasonHighlightBlockBoldSecondary = { fg = newpaper.fg, bg = newpaper.lightorange, style = style.b_bold },
            MasonLink                        = { link = "LspInstallerLink" },
            MasonMuted                       = { link = "LspInstallerMuted"},
            MasonMutedBlock                  = { fg = newpaper.grey, bg = newpaper.lightlightgrey },
            MasonMutedBlockBold              = { fg = newpaper.comment, style = style.b_bold },
            MasonError                       = { link = "LspInstallerError"},
            MasonHeading                     = { link = "LspInstallerHeading"},
        }
        return plugins
    end

    -- stylua: ignore end

    return masonSyn
end

return M
