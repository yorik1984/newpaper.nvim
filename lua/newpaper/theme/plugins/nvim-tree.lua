local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local nvimTreeSyn  = {}
    nvimTreeSyn.colors = configColors
    nvimTreeSyn.style  = configStyle
    local newpaper     = nvimTreeSyn.colors
    local style        = nvimTreeSyn.style

    nvimTreeSyn.loadPlugins = function()
        local plugins = {
            NvimTreeNormal            = { fg = newpaper.nvimtree_fg, bg = newpaper.nvimtree_bg },
            NvimTreeLineNr            = { bg = newpaper.nvimtree_bg },
            NvimTreeCursorLine        = { bg = newpaper.aqua },
            NvimTreeCursorLineNr      = { bg = newpaper.aqua },
            NvimTreeCursorColumn      = { bg = newpaper.aqua },
            NvimTreeSignColumn        = { bg = newpaper.nvimtree_bg },
            NvimTreeSymlink           = { fg = newpaper.accent, style = style.links },
            NvimTreeFolderName        = { fg = newpaper.teal },
            NvimTreeFolderIcon        = { fg = newpaper.teal },
            NvimTreeOpenedFolderName  = { fg = newpaper.teal,   style = style.b_bold },
            NvimTreeRootFolder        = { fg = newpaper.titles, style = style.b_bold },
            NvimTreeEmptyFolderName   = { fg = newpaper.disabled },
            NvimTreeIndentMarker      = { fg = newpaper.teal },
            NvimTreeGitDirty          = { fg = newpaper.git_modified },
            NvimTreeGitNew            = { fg = newpaper.git_added },
            NvimTreeGitStaged         = { fg = newpaper.comments },
            NvimTreeGitDeleted        = { fg = newpaper.git_removed },
            NvimTreeGitMerge          = { fg = newpaper.git_removed },
            NvimTreeGitRenamed        = { fg = newpaper.git_modified },
            NvimTreeLicenseIcon       = { fg = newpaper.navy },
            NvimTreeGitignoreIcon     = { fg = newpaper.git_fg },
            NvimTreeOpenedFile        = { fg = newpaper.magenta },
            NvimTreeImageFile         = { fg = newpaper.orange },
            NvimTreeMarkdownFile      = { fg = newpaper.strings },
            NvimTreeExecFile          = { fg = newpaper.texts },
            NvimTreeSpecialFile       = { fg = newpaper.purple, style = style.underline },
            NvimTreeCopiedHL          = { bg = newpaper.difftext_bg },
            NvimTreeCutHL             = { bg = newpaper.diffdelete_bg },
            NvimTreeBookmark          = { fg = newpaper.darkgreen },
            NvimTreeBookmarkHL        = { fg = newpaper.green, style = style.b_bold },
            LspDiagnosticsError       = { fg = newpaper.error_fg },
            LspDiagnosticsWarning     = { fg = newpaper.warn_fg },
            LspDiagnosticsInformation = { fg = newpaper.info_fg },
            LspDiagnosticsHint        = { fg = newpaper.hint_fg },
        }
        return plugins
    end

    -- stylua: ignore end

    return nvimTreeSyn
end

return M
