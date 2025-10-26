local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        LspCodeLens                 = { fg = newpaper.comments, bg = newpaper.lightsilver },
        LspCodeLensSeparator        = { fg = newpaper.comments, bg = newpaper.lightsilver, style = style.b_bold },
        LspReferenceText            = { fg = newpaper.todo_default, bg = newpaper.silver },
        LspReferenceTarget          = { fg = newpaper.tex_lightviolet, bg = newpaper.silver },
        LspReferenceRead            = { fg = newpaper.tex_aqua, bg = newpaper.silver },
        LspReferenceWrite           = { fg = newpaper.tex_lightgreen, bg = newpaper.silver },
        LspSignatureActiveParameter = { bg = newpaper.search_bg },

        DiagnosticError             = { fg = newpaper.error_fg },
        DiagnosticFloatingError     = { fg = newpaper.error_fg },
        DiagnosticFloatingHint      = { fg = newpaper.hint_fg },
        DiagnosticFloatingInfo      = { fg = newpaper.info_fg },
        DiagnosticFloatingWarn      = { fg = newpaper.warn_fg },
        DiagnosticFloatingOk        = { fg = newpaper.ok_fg },
        DiagnosticHint              = { fg = newpaper.hint_fg },
        DiagnosticInfo              = { fg = newpaper.info_fg },
        DiagnosticOk                = { fg = newpaper.ok_fg },
        DiagnosticDeprecated        = { fg = newpaper.comments, style = style.strike },
        DiagnosticUnnecessary       = { fg = newpaper.comments },
        DiagnosticSignError         = { fg = newpaper.error_fg },
        DiagnosticSignHint          = { fg = newpaper.hint_fg },
        DiagnosticSignInfo          = { fg = newpaper.info_fg },
        DiagnosticSignWarn          = { fg = newpaper.warn_fg },
        DiagnosticSignOk            = { fg = newpaper.ok_fg },
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
        DiagnosticWarn              = { fg = newpaper.warn_fg },
    }
end

return M
