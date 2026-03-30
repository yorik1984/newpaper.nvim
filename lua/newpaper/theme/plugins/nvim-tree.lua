local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- Standard
        NvimTreeNormal            = { fg = newpaper.nvimtree_fg, bg = newpaper.nvimtree_bg },
        -- NvimTreeNormalFloat         NormalFloat
        -- NvimTreeNormalNC            NvimTreeNormal

        NvimTreeLineNr            = { bg = newpaper.nvimtree_bg },
        -- NvimTreeWinSeparator        WinSeparator
        -- NvimTreeEndOfBuffer         EndOfBuffer
        -- NvimTreePopup               Normal
        NvimTreeSignColumn        = { bg = newpaper.nvimtree_bg },

        NvimTreeCursorColumn      = { bg = newpaper.nvimtree_bg },
        NvimTreeCursorLine        = { bg = newpaper.aqua },
        NvimTreeCursorLineNr      = { bg = newpaper.nvimtree_bg },

        -- NvimTreeStatusLine          StatusLine
        -- NvimTreeStatusLineNC        StatusLineNC

        -- File Text
        NvimTreeExecFile          = { fg = newpaper.texts },
        NvimTreeImageFile         = { fg = newpaper.orange },
        NvimTreeSpecialFile       = { fg = newpaper.purple },
        NvimTreeSymlink           = { fg = newpaper.links, style = style.links },

        -- Folder Text
        NvimTreeRootFolder        = { fg = newpaper.titles, style = style.b_bold },
        NvimTreeFolderName        = { fg = newpaper.teal },
        NvimTreeEmptyFolderName   = { fg = newpaper.disabled },
        NvimTreeOpenedFolderName  = { fg = newpaper.teal, style = style.b_bold },
        NvimTreeSymlinkFolderName = { fg = newpaper.links, style = style.b_links },

        -- File Icons
        -- NvimTreeFileIcon            NvimTreeNormal
        -- NvimTreeSymlinkIcon         NvimTreeNormal

        -- Folder Icons
        NvimTreeFolderIcon        = { fg = newpaper.teal },
        -- NvimTreeOpenedFolderIcon    NvimTreeFolderIcon
        -- NvimTreeClosedFolderIcon    NvimTreeFolderIcon
        -- NvimTreeFolderArrowClosed   NvimTreeIndentMarker
        -- NvimTreeFolderArrowOpen     NvimTreeIndentMarker

        -- Indent
        NvimTreeIndentMarker      = { fg = newpaper.teal },

        -- Picker
        NvimTreeWindowPicker      = { fg = newpaper.bg, bg = newpaper.accent, style = style.b_bold },

        -- Live Filter
        -- NvimTreeLiveFilterPrefix    PreProc
        -- NvimTreeLiveFilterValue     ModeMsg

        -- Clipboard
        NvimTreeCopiedHL          = { bg = newpaper.difftext },
        NvimTreeCutHL             = { bg = newpaper.diffdelete },

        -- Bookmarks
        NvimTreeBookmarkIcon      = { fg = newpaper.darkgreen },
        NvimTreeBookmarkHL        = { fg = newpaper.green, style = style.b_bold },

        -- Modified
        NvimTreeModifiedIcon      = { style = style.b_bold },
        -- NvimTreeModifiedFileHL      NvimTreeModifiedIcon
        -- NvimTreeModifiedFolderHL    NvimTreeModifiedIcon

        -- Hidden
        -- NvimTreeModifiedIcon        Conceal
        -- NvimTreeModifiedFileHL      NvimTreeHiddenIcon
        -- NvimTreeModifiedFolderHL    NvimTreeHiddenFileHL

        -- Hidden Display
        -- NvimTreeHiddenDisplay       Conceal

        -- Opened
        NvimTreeOpenedHL          = { style = style.b_bold },

        -- Git Icon
        NvimTreeGitDeletedIcon    = { fg = newpaper.git_removed },
        NvimTreeGitDirtyIcon      = { fg = newpaper.git_modified },
        NvimTreeGitIgnoredIcon    = { fg = newpaper.disabled },
        NvimTreeGitMergeIcon      = { fg = newpaper.git_merged },
        NvimTreeGitNewIcon        = { fg = newpaper.git_untracked },
        NvimTreeGitRenamedIcon    = { fg = newpaper.git_modified },
        NvimTreeGitStagedIcon     = { fg = newpaper.git_added },

        -- Git File File Highlight
        -- NvimTreeGitFileDeletedHL    NvimTreeGitDeletedIcon
        -- NvimTreeGitFileDirtyHL      NvimTreeGitDirtyIcon
        -- NvimTreeGitFileIgnoredHL    NvimTreeGitIgnoredIcon
        -- NvimTreeGitFileMergeHL      NvimTreeGitMergeIcon
        -- NvimTreeGitFileNewHL        NvimTreeGitNewIcon
        -- NvimTreeGitFileRenamedHL    NvimTreeGitRenamedIcon
        -- NvimTreeGitFileStagedHL     NvimTreeGitStagedIcon

        -- Git Folder Folder Highlight
        -- NvimTreeGitFolderDeletedHL  NvimTreeGitFileDeletedHL
        -- NvimTreeGitFolderDirtyHL    NvimTreeGitFileDirtyHL
        -- NvimTreeGitFolderIgnoredHL  NvimTreeGitFileIgnoredHL
        -- NvimTreeGitFolderMergeHL    NvimTreeGitFileMergeHL
        -- NvimTreeGitFolderNewHL      NvimTreeGitFileNewHL
        -- NvimTreeGitFolderRenamedHL  NvimTreeGitFileRenamedHL
        -- NvimTreeGitFolderStagedHL   NvimTreeGitFileStagedHL

        -- Diagnostics Icon
        -- NvimTreeDiagnosticErrorIcon         DiagnosticError
        -- NvimTreeDiagnosticWarnIcon          DiagnosticWarn
        -- NvimTreeDiagnosticInfoIcon          DiagnosticInfo
        -- NvimTreeDiagnosticHintIcon          DiagnosticHint

        -- Diagnostics File Highlight
        -- NvimTreeDiagnosticErrorFileHL       DiagnosticUnderlineError
        -- NvimTreeDiagnosticWarnFileHL        DiagnosticUnderlineWarn
        -- NvimTreeDiagnosticInfoFileHL        DiagnosticUnderlineInfo
        -- NvimTreeDiagnosticHintFileHL        DiagnosticUnderlineHint

        -- Diagnostics Folder Highlight
        -- NvimTreeDiagnosticErrorFolderHL     NvimTreeDiagnosticErrorFileHL
        -- NvimTreeDiagnosticWarnFolderHL      NvimTreeDiagnosticWarnFileHL
        -- NvimTreeDiagnosticInfoFolderHL      NvimTreeDiagnosticInfoFileHL
        -- NvimTreeDiagnosticHintFolderHL      NvimTreeDiagnosticHintFileHL
    }
end

return M
