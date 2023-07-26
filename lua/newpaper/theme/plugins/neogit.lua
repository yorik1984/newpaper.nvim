local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local neogitSyn  = {}
    neogitSyn.colors = configColors
    neogitSyn.style  = configStyle
    local newpaper   = neogitSyn.colors
    local style      = neogitSyn.style
    neogitSyn.loadPlugins = function()
        local plugins = {
            NeogitGraphRed             = { fg = newpaper.red },
            NeogitGraphWhite           = { fg = newpaper.white },
            NeogitGraphOrange          = { fg = newpaper.orange },
            NeogitGraphYellow          = { fg = newpaper.lightorange },
            NeogitGraphGreen           = { fg = newpaper.green },
            NeogitGraphCyan            = { fg = newpaper.lightmagenta },
            NeogitGraphBlue            = { fg = newpaper.blue },
            NeogitGraphPurple          = { fg = newpaper.purple },
            NeogitGraphGray            = { fg = newpaper.grey },
            NeogitGraphBoldRed         = { fg = newpaper.red,         style = style.b_bold },
            NeogitGraphBoldWhite       = { fg = newpaper.white,       style = style.b_bold },
            NeogitGraphBoldOrange      = { fg = newpaper.orange,      style = style.b_bold },
            NeogitGraphBoldYellow      = { fg = newpaper.lightorange, style = style.b_bold },
            NeogitGraphBoldGreen       = { fg = newpaper.green,       style = style.b_bold },
            NeogitGraphBoldCyan        = { fg = newpaper.lightmagenta,   style = style.b_bold },
            NeogitGraphBoldBlue        = { fg = newpaper.blue,        style = style.b_bold },
            NeogitGraphBoldPurple      = { fg = newpaper.purple,      style = style.b_bold },
            NeogitGraphBoldGray        = { fg = newpaper.grey,        style = style.b_bold },
            NeogitHunkHeader           = { fg = newpaper.git_fg,    bg = newpaper.silver, style = style.b_bold },
            NeogitHunkHeaderHighlight  = { fg = newpaper.git_fg,    bg = newpaper.aqua, style = style.b_bold },
            NeogitDiffContext          = { fg = newpaper.git_fg,    bg = newpaper.lightsilver },
            NeogitDiffContextHighlight = { fg = newpaper.git_fg,    bg = newpaper.bg },
            NeogitDiffAdd              = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
            NeogitDiffAddHighlight     = { fg = newpaper.git_added },
            NeogitDiffDelete           = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
            NeogitDiffDeleteHighlight  = { fg = newpaper.git_removed },
            NeogitPopupSectionTitle    = { fg = newpaper.teal, style = style.b_bold },
            -- NeogitPopupBranchName      = { link = "String" },
            NeogitPopupBold            = { style = style.b_bold },
            NeogitPopupSwitchKey       = { fg = newpaper.purple },
            NeogitPopupSwitchEnabled   = { link = "NeogitGraphOrange" },
            -- NeogitPopupSwitchDisabled  = { link = "Comment" },
            NeogitPopupOptionKey       = { fg = newpaper.purple },
            NeogitPopupOptionEnabled   = { link = "NeogitGraphOrange" },
            -- NeogitPopupOptionDisabled  = { link = "Comment" },
            NeogitPopupConfigKey       = { fg = newpaper.purple },
            NeogitPopupConfigEnabled   = { link = "NeogitGraphOrange" },
            -- NeogitPopupConfigDisabled  = { link = "Comment" },
            NeogitPopupActionKey       = { fg = newpaper.purple },
            -- NeogitPopupActionDisabled  = { link = "Comment" },
            NeogitFilePath             = { fg = newpaper.teal },
            NeogitCommitViewHeader     = { fg = newpaper.navy, bg = newpaper.aqua,  },
            NeogitDiffHeader           = { fg = newpaper.lightblue, bg = newpaper.silver, style = style.b_bold },
            NeogitDiffHeaderHighlight  = { fg = newpaper.ruby_orange,    bg = newpaper.aqua,   style = style.b_bold },
            -- NeogitNotificationInfo     = { link = "DiagnosticInfo" },
            -- NeogitNotificationWarning  = { link = "DiagnosticWarn" },
            -- NeogitNotificationError    = { link = "DiagnosticError" },
            NeogitCommandText          = { fg = newpaper.tex_navy },
            NeogitCommandTime          = { fg = newpaper.green },
            -- NeogitCommandCodeNormal    = { link = "String" },
            -- NeogitCommandCodeError     = { link = "Error" },
            NeogitBranch               = { fg = newpaper.orange,     style = style.b_bold },
            NeogitRemote               = { fg = newpaper.green,      style = style.b_bold },
            NeogitUnmergedInto         = { fg = newpaper.tex_math, style = style.b_bold },
            NeogitUnpulledFrom         = { fg = newpaper.darkpurple, style = style.b_bold },
            NeogitObjectId             = { fg = newpaper.orange },
            -- NeogitStash                = { link = "Comment" },
            -- NeogitRebaseDone           = { link = "Comment" },
            NeogitCursorLine           = { link = "CursorLine" },
            NeogitFold                 = { fg = newpaper.none, bg = newpaper.none },
            NeogitChangeModified       = { fg = newpaper.tag_navy,   style = style.b_bold_i },
            NeogitChangeAdded          = { fg = newpaper.git_added,  style = style.b_bold_i },
            NeogitChangeDeleted        = { fg = newpaper.maroon,     style = style.b_bold_i },
            NeogitChangeRenamed        = { fg = newpaper.tex_redorange, style = style.b_bold_i },
            NeogitChangeUpdated        = { fg = newpaper.darkorange, style = style.b_bold_i },
            NeogitChangeCopied         = { fg = newpaper.teal,       style = style.b_bold_i },
            NeogitChangeBothModified   = { fg = newpaper.darkyellow, style = style.b_bold_i },
            NeogitChangeNewFile        = { fg = newpaper.darkgreen,  style = style.b_bold_i },
            NeogitUntrackedfiles       = { fg = newpaper.tex_red, style = style.b_bold },
            NeogitUnstagedchanges      = { fg = newpaper.ruby_purple, style = style.b_bold },
            NeogitUnmergedchanges      = { fg = newpaper.tex_part_title, style = style.b_bold },
            NeogitUnpulledchanges      = { fg = newpaper.tex_olive, style = style.b_bold },
            NeogitRecentcommits        = { fg = newpaper.ruby_magenta, style = style.b_bold },
            NeogitStagedchanges        = { fg = newpaper.tex_lightpurple, style = style.b_bold },
            NeogitStashes              = { fg = newpaper.tex_blue, style = style.b_bold },
            NeogitRebasing             = { fg = newpaper.navy, style = style.b_bold },
        }
        return plugins
    end

    -- stylua: ignore end

    return neogitSyn
end

return M
