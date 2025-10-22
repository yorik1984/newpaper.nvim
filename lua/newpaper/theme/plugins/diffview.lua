local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        DiffviewStatusAdded         = { fg = newpaper.git_added },
        DiffviewStatusUntracked     = { fg = newpaper.git_untracked, style = style.b_bold },
        DiffviewStatusModified      = { fg = newpaper.git_modified },
        DiffviewStatusRenamed       = { fg = newpaper.git_modified },
        DiffviewStatusCopied        = { fg = newpaper.git_modified },
        DiffviewStatusTypeChanged   = { fg = newpaper.git_modified },
        DiffviewStatusUnmerged      = { fg = newpaper.git_merged },
        DiffviewStatusUnknown       = { fg = newpaper.git_removed },
        DiffviewStatusDeleted       = { fg = newpaper.git_removed },
        DiffviewStatusBroken        = { fg = newpaper.git_removed },
        DiffviewStatusIgnored       = { fg = newpaper.comments, style = style.b_bold },

        DiffviewFilePanelInsertions = { fg = newpaper.git_added },
        DiffviewFilePanelDeletions  = { fg = newpaper.git_removed },
        DiffviewFolderSign          = { link = "Directory" },
        DiffviewFilePanelPath       = { fg = newpaper.doc_comments },
    }
end

return M
