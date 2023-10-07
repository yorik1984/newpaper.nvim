local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local noiceSyn  = {}
    noiceSyn.colors = configColors
    noiceSyn.style  = configStyle
    local newpaper  = noiceSyn.colors
    local style     = noiceSyn.style

    noiceSyn.loadPlugins = function()
        local plugins = {
            -- NoiceCmdline                       = { link = "MsgArea" },                            -- Normal for the classic cmdline area at the bottom"
            NoiceCmdlineIcon                   = { fg = newpaper.teal },                             -- Cmdline icon
            NoiceCmdlineIconSearch             = { fg = newpaper.orange },                           -- Cmdline search icon (`/` and `?`)
            NoiceCmdlinePrompt                 = { link = "Normal" },                                -- prompt for input()
            NoiceCmdlinePopup                  = { link = "Normal" },                                -- Normal for the cmdline popup
            NoiceCmdlinePopupBorder            = { fg = newpaper.teal },                             -- Cmdline popup border
            NoiceCmdlinePopupTitle             = { fg = newpaper.teal, style = style.b_bold },       -- Cmdline popup Title
            NoiceCmdlinePopupBorderSearch      = { fg = newpaper.orange },                           -- Cmdline popup border for search
            NoiceConfirm                       = { link = "NormalFloat" },                           -- Normal for the confirm view
            NoiceConfirmBorder                 = { fg = newpaper.info_fg, bg = newpaper.float_bg, style = style.b_bold }, -- Border for the confirm view
            -- NoiceCursor                        = { link = "Cursor" },                             -- Fake Cursor
            -- NoiceMini                          = { link = "MsgArea" },                            -- Normal for mini view
            -- NoicePopup                         = { link = "NormalFloat" },                        -- Normal for popup views
            NoicePopupBorder                   = { fg = newpaper.teal, bg = newpaper.float_bg },     -- Border for popup views
            -- NoicePopupmenu                     = { link = "Pmenu" },                              -- Normal for the popupmenu
            NoicePopupmenuBorder               = { link = "PmenuBorder" },                           -- Popupmenu border
            NoicePopupmenuMatch                = { link = "CmpItemAbbrMatch" },                      -- Part of the item that matches the input
            -- NoicePopupmenuSelected             = { link = "PmenuSel" },                           -- Selected item in the popupmenu
            -- NoiceScrollbar                     = { link = "PmenuSbar" },                          -- Normal for scrollbar
            -- NoiceScrollbarThumb                = { link = "PmenuThumb" },                         -- Scrollbar thumb
            NoiceSplit                         = { link = "Normal" },                                -- Normal for split views
            NoiceSplitBorder                   = { link = "NoicePopupBorder" },                      -- Border for split views
            -- NoiceVirtualText                   = { link = "DiagnosticVirtualTextInfo" },          -- Default hl group for virtualtext views
            -- NoiceFormatProgressDone            = { link = "Search" },                             -- Progress bar done
            -- NoiceFormatProgressTodo            = { link = "CursorLine" },                         -- progress bar todo
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
            -- NoiceLspProgressSpinner            = { link = "Constant" },                  -- Lsp progress spinner
            -- NoiceLspProgressTitle              = { link = "NonText" },                   -- Lsp progress title
            -- NoiceLspProgressClient             = { link = "Title" },                     -- Lsp progress client name
            -- NoiceCompletionItemMenu            = { link = "none" },                      -- Normal for the popupmenu
            -- NoiceCompletionItemWord            = { link = "none" },                      -- Normal for the popupmenu
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

    -- stylua: ignore end

    return noiceSyn
end

return M
