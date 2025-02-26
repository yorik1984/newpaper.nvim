local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- Sets the highlight for selected items within the picker
        TelescopeSelection              = { bg = newpaper.aqua },
        TelescopeSelectionCaret         = { fg = newpaper.purple, style = style.b_bold },
        TelescopeMultiSelection         = { fg = newpaper.orange },
        TelescopeMultiIcon              = { fg = newpaper.orange },

        -- Normal in the floating windows created by telescope
        TelescopeNormal                 = { fg = newpaper.telescope_fg, bg = newpaper.telescope_bg },
        -- TelescopePreviewNormal          TelescopeNormal
        -- TelescopePromptNormal           TelescopeNormal
        -- TelescopeResultsNormal          TelescopeNormal

        -- Border highlight groups. Use TelescopeBorder to override the default. Otherwise set them specifically
        -- TelescopeBorder               TelescopeNormal
        TelescopePromptBorder           = { fg = newpaper.blue, bg = newpaper.telescope_bg },
        TelescopeResultsBorder          = { fg = newpaper.purple, bg = newpaper.telescope_bg },
        TelescopePreviewBorder          = { fg = newpaper.green, bg = newpaper.telescope_bg },

        -- Title highlight groups. Use TelescopeTitle to override the default. Otherwise set them specifically
        TelescopeTitle                  = { fg = newpaper.fg, bg = newpaper.telescope_bg, style = style.b_bold },
        TelescopePromptTitle            = { fg = newpaper.teal, bg = newpaper.telescope_bg, style = style.b_bold },
        TelescopeResultsTitle           = { fg = newpaper.purple, bg = newpaper.telescope_bg, style = style.b_bold },
        TelescopePreviewTitle           = { fg = newpaper.darkgreen, bg = newpaper.telescope_bg, style = style.b_bold },
        TelescopePromptCounter          = { fg = newpaper.teal },

        -- Used for highlighting characters that you match.
        TelescopeMatching               = { fg = newpaper.magenta, style = style.b_bold },

        -- Used for the prompt prefix
        TelescopePromptPrefix           = { fg = newpaper.teal },

        -- Used for highlighting the matched line inside Previewer
        -- TelescopePreviewLine            Visual
        -- TelescopePreviewMatch           Search
        TelescopePreviewPipe            = { fg = newpaper.nephritis },
        TelescopePreviewCharDev         = { fg = newpaper.magenta },
        TelescopePreviewDirectory       = { fg = newpaper.teal },
        TelescopePreviewBlock           = { fg = newpaper.red },
        TelescopePreviewLink            = { fg = newpaper.links, style = style.links },
        TelescopePreviewSocket          = { fg = newpaper.darkyellow },
        -- TelescopePreviewNormal          Normal
        TelescopePreviewRead            = { fg = newpaper.darkgreen },
        TelescopePreviewWrite           = { fg = newpaper.maroon },
        TelescopePreviewExecute         = { fg = newpaper.keywords },
        TelescopePreviewHyphen          = { fg = newpaper.blue },
        TelescopePreviewSticky          = { fg = newpaper.orange },
        TelescopePreviewSize            = { fg = newpaper.teal },
        TelescopePreviewUser            = { fg = newpaper.ocean },
        TelescopePreviewGroup           = { fg = newpaper.green },
        TelescopePreviewDate            = { fg = newpaper.strings },
        TelescopePreviewMessage         = { fg = newpaper.strings },
        TelescopePreviewMessageFillchar = { fg = newpaper.strings, style = style.b_bold },

        -- Used for Picker specific Results highlighting
        TelescopeResultsClass           = { fg = newpaper.keywords },
        TelescopeResultsConstant        = { fg = newpaper.darkengreen },
        TelescopeResultsField           = { fg = newpaper.ocean },
        TelescopeResultsFileIcon        = { fg = newpaper.teal },
        TelescopeResultsFunction        = { fg = newpaper.navy },
        TelescopeResultsMethod          = { fg = newpaper.darkpurple },
        TelescopeResultsOperator        = { fg = newpaper.tag_navy, style = style.o_style },
        TelescopeResultsStruct          = { fg = newpaper.keywords },
        TelescopeResultsVariable        = { fg = newpaper.darkengreen },
        TelescopeResultsLineNr          = { fg = newpaper.linenumber_fg },
        TelescopeResultsIdentifier      = { fg = newpaper.teal },
        TelescopeResultsNumber          = { fg = newpaper.red },
        TelescopeResultsComment         = { fg = newpaper.comments, style = style.c_style },
        TelescopeResultsSpecialComment  = { fg = newpaper.comments, style = style.c_title },

        -- Used for git status Results highlighting
        TelescopeResultsDiffChange      = { fg = newpaper.git_modified },
        TelescopeResultsDiffAdd         = { fg = newpaper.git_added },
        TelescopeResultsDiffDelete      = { fg = newpaper.git_removed },
        TelescopeResultsDiffUntracked   = { fg = newpaper.git_added },
    }
end

return M
