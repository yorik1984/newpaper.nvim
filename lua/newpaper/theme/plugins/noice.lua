local M = {}

function M.setup(configColors, configStyle)
    local noiceSyn       = {}
    noiceSyn.colors      = configColors
    noiceSyn.style       = configStyle
    local newpaper       = noiceSyn.colors
    local style          = noiceSyn.style

    noiceSyn.loadPlugins = function()
        local plugins = {
            -- NoiceCmdline                       = { link = "MsgArea" },
            NoiceCmdlineIcon                   = { fg = newpaper.teal },
            NoiceCmdlineIconSearch             = { fg = newpaper.orange },
            NoiceCmdlinePrompt                 = { link = "Normal" },
            NoiceCmdlinePopup                  = { link = "Normal" },
            NoiceCmdlinePopupBorder            = { fg = newpaper.teal },
            NoiceCmdlinePopupTitle             = { fg = newpaper.teal, style = style.b_bold },
            NoiceCmdlinePopupBorderSearch      = { fg = newpaper.orange },
            NoiceConfirm                       = { link = "NormalFloat" },
            NoiceConfirmBorder                 = { fg = newpaper.info_fg, bg = newpaper.float_bg, style = style.b_bold },
            -- NoiceCursor                        = { link = "Cursor" },
            -- NoiceMini                          = { link = "MsgArea" },
            -- NoicePopup                         = { link = "NormalFloat" },
            NoicePopupBorder                   = { fg = newpaper.teal, bg = newpaper.float_bg },
            -- NoicePopupmenu                     = { link = "Pmenu" },
            NoicePopupmenuBorder               = { link = "PmenuBorder" },
            NoicePopupmenuMatch                = { link = "CmpItemAbbrMatch" },
            -- NoicePopupmenuSelected             = { link = "PmenuSel" },
            -- NoiceScrollbar                     = { link = "PmenuSbar" },
            -- NoiceScrollbarThumb                = { link = "PmenuThumb" },
            NoiceSplit                         = { link = "Normal" },
            NoiceSplitBorder                   = { link = "NoicePopupBorder" },
            -- NoiceVirtualText                   = { link = "DiagnosticVirtualTextInfo" },
            -- NoiceFormatProgressDone            = { link = "Search" },
            -- NoiceFormatProgressTodo            = { link = "CursorLine" },
            -- NoiceFormatEvent                   = { link = "NonText" },
            -- NoiceFormatKind                    = { link = "NonText" },
            -- NoiceFormatDate                    = { link = "Special" },
            NoiceFormatConfirm                 = { fg = newpaper.gray, bg = newpaper.bg },
            NoiceFormatConfirmDefault          = { fg = newpaper.texts, bg = newpaper.aqua, style = style.b_bold },
            NoiceFormatTitle                   = { link = "Title" },
            -- NoiceFormatLevelDebug              = { link = "NonText" },
            -- NoiceFormatLevelTrace              = { link = "NonText" },
            -- NoiceFormatLevelOff                = { link = "NonText" },
            -- NoiceFormatLevelInfo               = { link = "DiagnosticVirtualTextInfo" },
            -- NoiceFormatLevelWarn               = { link = "DiagnosticVirtualTextWarn" },
            -- NoiceFormatLevelError              = { link = "DiagnosticVirtualTextError" },
            -- NoiceLspProgressSpinner            = { link = "Constant" },
            -- NoiceLspProgressTitle              = { link = "NonText" },
            -- NoiceLspProgressClient             = { link = "Title" },
            -- NoiceCompletionItemMenu            = { link = "none" },
            -- NoiceCompletionItemWord            = { link = "none" },
            NoiceCompletionItemKindDefault     = { link = "CmpItemKindDefault" },
            NoiceCompletionItemKindColor       = { link = "CmpItemKindColor" },
            NoiceCompletionItemKindFunction    = { link = "CmpItemKindFunction" },
            NoiceCompletionItemKindClass       = { link = "CmpItemKindClass" },
            NoiceCompletionItemKindMethod      = { link = "CmpItemKindMethod" },
            NoiceCompletionItemKindConstructor = { link = "CmpItemKindConstructor" },
            NoiceCompletionItemKindInterface   = { link = "CmpItemKindInterface" },
            NoiceCompletionItemKindModule      = { link = "CmpItemKindModule" },
            NoiceCompletionItemKindStruct      = { link = "CmpItemKindStruct" },
            NoiceCompletionItemKindKeyword     = { link = "CmpItemKindKeyword" },
            NoiceCompletionItemKindValue       = { link = "CmpItemKindValue" },
            NoiceCompletionItemKindProperty    = { link = "CmpItemKindProperty" },
            NoiceCompletionItemKindConstant    = { link = "CmpItemKindConstant" },
            NoiceCompletionItemKindSnippet     = { link = "CmpItemKindSnippet" },
            NoiceCompletionItemKindFolder      = { link = "CmpItemKindFolder" },
            NoiceCompletionItemKindText        = { link = "CmpItemKindText" },
            NoiceCompletionItemKindEnumMember  = { link = "CmpItemKindEnumMember" },
            NoiceCompletionItemKindUnit        = { link = "CmpItemKindUnit" },
            NoiceCompletionItemKindField       = { link = "CmpItemKindField" },
            NoiceCompletionItemKindFile        = { link = "CmpItemKindFile" },
            NoiceCompletionItemKindVariable    = { link = "CmpItemKindVariable" },
            NoiceCompletionItemKindEnum        = { link = "CmpItemKindEnum" },
        }
        return plugins
    end

    return noiceSyn
end

return M
