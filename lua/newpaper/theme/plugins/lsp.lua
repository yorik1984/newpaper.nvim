local M = {}

function M.setup(configColors, configStyle)
    local lspSyn       = {}
    lspSyn.colors      = configColors
    lspSyn.style       = configStyle
    local newpaper     = lspSyn.colors
    local style        = lspSyn.style

    lspSyn.loadPlugins = function()
        local plugins = {
            LspCodeLens                 = { fg = newpaper.comments, bg = newpaper.lightsilver },
            LspCodeLensSeparator        = { fg = newpaper.comments, bg = newpaper.lightsilver, style = style.b_bold },
            LspReferenceText            = { fg = newpaper.todo_default, bg = newpaper.silver },
            LspReferenceRead            = { fg = newpaper.todo_info, bg = newpaper.silver },
            LspReferenceWrite           = { fg = newpaper.todo_hint, bg = newpaper.silver },
            LspSignatureActiveParameter = { bg = newpaper.search_bg },

            DiagnosticError             = { fg = newpaper.error_fg, bg = newpaper.none },
            DiagnosticFloatingError     = { fg = newpaper.error_fg },
            DiagnosticFloatingHint      = { fg = newpaper.hint_fg },
            DiagnosticFloatingInfo      = { fg = newpaper.info_fg },
            DiagnosticFloatingWarn      = { fg = newpaper.warn_fg },
            DiagnosticFloatingOk        = { fg = newpaper.ok_fg },
            DiagnosticHint              = { fg = newpaper.hint_fg, bg = newpaper.none },
            DiagnosticInfo              = { fg = newpaper.info_fg, bg = newpaper.none },
            DiagnosticOk                = { fg = newpaper.ok_fg, bg = newpaper.none },
            DiagnosticDeprecated        = { fg = newpaper.comments, bg = newpaper.none, style = style.strike },
            DiagnosticUnnecessary       = { fg = newpaper.comments, bg = newpaper.none },
            DiagnosticSignError         = { fg = newpaper.error_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignHint          = { fg = newpaper.hint_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignInfo          = { fg = newpaper.info_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignWarn          = { fg = newpaper.warn_fg, bg = newpaper.linenumber_bg },
            DiagnosticSignOk            = { fg = newpaper.ok_fg, bg = newpaper.linenumber_bg },
            DiagnosticUnderlineError    = { style = style.undercurl, sp = newpaper.error_fg },
            DiagnosticUnderlineHint     = { style = style.undercurl, sp = newpaper.hint_fg },
            DiagnosticUnderlineInfo     = { style = style.undercurl, sp = newpaper.info_fg },
            DiagnosticUnderlineWarn     = { style = style.undercurl, sp = newpaper.warn_fg },
            DiagnosticUnderlineOk       = { style = style.undercurl, sp = newpaper.ok_fg },
            DiagnosticVirtualTextError  = { fg = newpaper.error_fg, bg = newpaper.lsp_error_bg },
            DiagnosticVirtualTextHint   = { fg = newpaper.hint_fg, bg = newpaper.hint_bg },
            DiagnosticVirtualTextInfo   = { fg = newpaper.info_fg, bg = newpaper.info_bg },
            DiagnosticVirtualTextWarn   = { fg = newpaper.warn_fg, bg = newpaper.warn_bg },
            DiagnosticVirtualTextOk     = { fg = newpaper.ok_fg, bg = newpaper.ok_bg },
            DiagnosticWarn              = { fg = newpaper.warn_fg, bg = newpaper.none },
        }
        return plugins
    end

    return lspSyn
end

return M
