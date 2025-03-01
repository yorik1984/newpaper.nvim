local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- STATUS BUFFER
        NeogitBranch               = { fg = newpaper.orange, style = style.b_bold },
        NeogitRemote               = { fg = newpaper.green, style = style.b_bold },
        NeogitObjectId             = { fg = newpaper.orange },
        -- NeogitStash                = { link = "Comment" },
        NeogitFold                 = { fg = newpaper.none, bg = newpaper.none },
        -- NeogitRebaseDone           = { link = "Comment" },
        NeogitTagName              = { fg = newpaper.tag_navy },
        NeogitTagDistance          = { fg = newpaper.navy },

        -- STATUS BUFFER SECTION HEADERS
        NeogitSectionHeader        = { fg = newpaper.dark_maroon, style = style.b_bold },
        -- NeogitUnpushedTo           = { link = "NeogitSectionHeader" },
        NeogitUnmergedInto         = { fg = newpaper.tex_math, style = style.b_bold },
        NeogitUnpulledFrom         = { fg = newpaper.darkpurple, style = style.b_bold },
        NeogitUntrackedfiles       = { fg = newpaper.tex_red, style = style.b_bold },
        NeogitUnstagedchanges      = { fg = newpaper.ruby_purple, style = style.b_bold },
        NeogitUnmergedchanges      = { fg = newpaper.tex_part_title, style = style.b_bold },
        NeogitUnpulledchanges      = { fg = newpaper.tex_olive, style = style.b_bold },
        NeogitRecentcommits        = { fg = newpaper.ruby_magenta, style = style.b_bold },
        NeogitStagedchanges        = { fg = newpaper.tex_lightpurple, style = style.b_bold },
        NeogitStashes              = { fg = newpaper.tex_blue, style = style.b_bold },
        NeogitRebasing             = { fg = newpaper.navy, style = style.b_bold },
        -- NeogitReverting
        -- NeogitPicking

        -- STATUS BUFFER FILE
        NeogitChangeModified       = { fg = newpaper.tag_navy, style = style.b_bold },
        NeogitChangeAdded          = { fg = newpaper.git_added, style = style.b_bold },
        NeogitChangeDeleted        = { fg = newpaper.maroon, style = style.b_bold },
        NeogitChangeRenamed        = { fg = newpaper.tex_redorange, style = style.b_bold },
        NeogitChangeUpdated        = { fg = newpaper.darkorange, style = style.b_bold },
        NeogitChangeCopied         = { fg = newpaper.teal, style = style.b_bold },
        NeogitChangeBothModified   = { fg = newpaper.darkyellow, style = style.b_bold },
        NeogitChangeNewFile        = { fg = newpaper.darkgreen, style = style.b_bold },

        -- SIGNS FOR LINE HIGHLIGHTING
        NeogitHunkHeader           = { fg = newpaper.git_fg, bg = newpaper.silver, style = style.b_bold },
        NeogitDiffContext          = { fg = newpaper.git_fg, bg = newpaper.lightsilver },
        NeogitDiffAdd              = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
        NeogitDiffDelete           = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
        NeogitDiffHeader           = { fg = newpaper.lightblue, bg = newpaper.silver, style = style.b_bold },

        -- SIGNS FOR LINE HIGHLIGHTING CURRENT CONTEXT
        NeogitHunkHeaderHighlight  = { fg = newpaper.git_fg, bg = newpaper.aqua, style = style.b_bold },
        NeogitDiffContextHighlight = { fg = newpaper.git_fg, bg = newpaper.bg },
        NeogitDiffAddHighlight     = { fg = newpaper.git_added },
        NeogitDiffDeleteHighlight  = { fg = newpaper.git_removed },
        NeogitDiffHeaderHighlight  = { fg = newpaper.ruby_orange, bg = newpaper.aqua, style = style.b_bold },
        NeogitCursorLine           = { link = "CursorLine" },

        -- COMMIT BUFFER
        NeogitFilePath             = { fg = newpaper.teal },
        NeogitCommitViewHeader     = { fg = newpaper.navy, bg = newpaper.aqua },

        -- LOG VIEW BUFFER
        NeogitGraphAuthor          = { fg = newpaper.navy },
        NeogitGraphBlack           = { fg = newpaper.black },
        NeogitGraphBoldBlack       = { fg = newpaper.black, style = style.b_bold },
        NeogitGraphRed             = { fg = newpaper.red },
        NeogitGraphBoldRed         = { fg = newpaper.red, style = style.b_bold },
        NeogitGraphGreen           = { fg = newpaper.green },
        NeogitGraphBoldGreen       = { fg = newpaper.green, style = style.b_bold },
        NeogitGraphYellow          = { fg = newpaper.lightorange },
        NeogitGraphBoldYellow      = { fg = newpaper.lightorange, style = style.b_bold },
        NeogitGraphBlue            = { fg = newpaper.blue },
        NeogitGraphBoldBlue        = { fg = newpaper.blue, style = style.b_bold },
        NeogitGraphPurple          = { fg = newpaper.purple },
        NeogitGraphBoldPurple      = { fg = newpaper.purple, style = style.b_bold },
        NeogitGraphCyan            = { fg = newpaper.lightmagenta },
        NeogitGraphBoldCyan        = { fg = newpaper.lightmagenta, style = style.b_bold },
        NeogitGraphWhite           = { fg = newpaper.white },
        NeogitGraphBoldWhite       = { fg = newpaper.white, style = style.b_bold },
        NeogitGraphGray            = { fg = newpaper.grey },
        NeogitGraphBoldGray        = { fg = newpaper.grey, style = style.b_bold },
        NeogitGraphOrange          = { fg = newpaper.orange },
        NeogitGraphBoldOrange      = { fg = newpaper.orange, style = style.b_bold },
        -- NeogitSignatureGood
        -- NeogitSignatureBad
        -- NeogitSignatureMissing
        -- NeogitSignatureNone
        -- NeogitSignatureGoodUnknown
        -- NeogitSignatureGoodExpired
        -- NeogitSignatureGoodExpiredKey
        -- NeogitSignatureGoodRevokedKey

        -- POPUPS
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

        -- COMMAND HISTORY BUFFER
        NeogitCommandText          = { fg = newpaper.tex_navy },
        NeogitCommandTime          = { fg = newpaper.green },
        -- NeogitCommandCodeNormal    = { link = "String" },
        -- NeogitCommandCodeError     = { link = "Error" },
    }
end

return M
