local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- explorer
        SnacksPickerTree                        = { link = "FloatLineNr" },

        -- git
        SnacksPickerGitIssue                    = { fg = newpaper.git_removed },
        SnacksPickerGitDate                     = { fg = newpaper.strings },
        SnacksPickerGitStatus                   = { fg = newpaper.magenta },
        SnacksPickerGitBranchCurrent            = { fg = newpaper.orange },
        SnacksPickerGitStatusIgnored            = { fg = newpaper.disabled },
        SnacksPickerGitStatusUntracked          = { fg = newpaper.git_untracked },
        SnacksPickerGitDetached                 = { fg = newpaper.git_untracked },
        SnacksPickerGitBreaking                 = { link = "DiagnosticVirtualTextError" },
        SnacksPickerGitStatusStaged             = { fg = newpaper.git_added },
        SnacksPickerGitStatusModified           = { fg = newpaper.git_modified },
        SnacksPickerGitStatusAdded              = { fg = newpaper.git_added },
        SnacksPickerGitStatusUnmerged           = { fg = newpaper.git_merged },
        SnacksPickerGitStatusDeleted            = { fg = newpaper.git_removed },
        SnacksPickerGitType                     = { fg = newpaper.darkgreen, style = style.b_bold },
        SnacksPickerGitBranch                   = { fg = newpaper.teal },
        SnacksPickerGitCommit                   = { fg = newpaper.orange },
        SnacksPickerGitStatusCopied             = { fg = newpaper.darkgreen },
        SnacksPickerGitStatusRenamed            = { fg = newpaper.tex_navy },

        -- icon
        SnacksPickerIconName                    = { fg = newpaper.keywords, nocombine = true },

        -- indent
        SnacksIndent                            = { link = "Whitespace" },
        SnacksIndentScope                       = { fg = newpaper.contextchar },
        SnacksIndentUnderline_SnacksIndentScope = { style = style.underline, sp = newpaper.contextchar },

        -- notifier
        SnacksNotifierHistoryDateTime           = { link = "SnacksPickerTime" },

        -- picker
        SnacksPickerDir                         = { fg = newpaper.teal },
        SnacksPickerMatch                       = { fg = newpaper.magenta, style = style.b_bold },
        SnacksPickerTotals                      = { fg = newpaper.orange },
        SnacksPickerIconFile                    = { fg = newpaper.teal },
        SnacksPickerLink                        = { fg = newpaper.links, style = style.links },
        SnacksPickerCursorLine                  = { bg = newpaper.aqua },
        SnacksPickerListCursorLine              = { link = "SnacksPickerCursorLine" },
        SnacksPickerPreviewCursorLine           = { link = "SnacksPickerCursorLine" },
        SnacksPickerTime                        = { fg = newpaper.strings },
        SnacksPickerPrompt                      = { fg = newpaper.teal },
    }
end

return M
