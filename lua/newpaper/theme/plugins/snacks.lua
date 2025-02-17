local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local snacksSyn  = {}
    snacksSyn.colors = configColors
    snacksSyn.style  = configStyle
    local newpaper   = snacksSyn.colors
    local style      = snacksSyn.style

    snacksSyn.loadPlugins = function()
        local plugins = {
            -- git
            SnacksPickerGitIssue                    = { fg = newpaper.git_removed },
            SnacksPickerGitDate                     = { fg = newpaper.strings },
            SnacksPickerGitStatus                   = { fg = newpaper.magenta },
            SnacksPickerGitBranchCurrent            = { fg = newpaper.orange },
            SnacksPickerGitStatusIgnored            = { fg = newpaper.comments },
            SnacksPickerGitStatusUntracked          = { fg = newpaper.comments },
            SnacksPickerGitDetached                 = { fg = newpaper.comments, style = style.b_bold },
            SnacksPickerGitBreaking                 = { link = "DiagnosticVirtualTextError" },
            SnacksPickerGitStatusStaged             = { fg = newpaper.git_added },
            SnacksPickerGitStatusModified           = { fg = newpaper.git_modified, style = style.b_bold },
            SnacksPickerGitStatusAdded              = { fg = newpaper.git_added, style = style.b_bold },
            SnacksPickerGitStatusUnmerged           = { fg = newpaper.git_removed },
            SnacksPickerGitStatusDeleted            = { fg = newpaper.git_removed, style = style.b_bold },
            SnacksPickerGitType                     = { fg = newpaper.darkgreen, style = style.b_bold },
            SnacksPickerGitBranch                   = { fg = newpaper.teal },
            SnacksPickerGitCommit                   = { fg = newpaper.orange },
            SnacksPickerGitStatusCopied             = { fg = newpaper.darkgreen },
            SnacksPickerGitStatusRenamed            = { fg = newpaper.navy },

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
        return plugins
    end

    -- stylua: ignore end

    return snacksSyn
end

return M
