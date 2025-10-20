local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        TroubleBasename          = { link = "TroubleFilename" },
        TroubleCode              = { fg = newpaper.trouble_fg, bg = newpaper.none },
        TroubleCount             = { fg = newpaper.orange, bg = newpaper.none, style = style.b_bold },
        TroubleDirectory         = { fg = newpaper.teal, bg = newpaper.none },
        TroubleFilename          = { fg = newpaper.teal, bg = newpaper.none },

        -- TroubleIconArray         = { link = "@punctuation.bracket" },
        -- TroubleIconBoolean       = { link = "@boolean" },
        -- TroubleIconClass         = { link = "@type" },
        -- TroubleIconConstant      = { link = "@constant" },
        -- TroubleIconConstructor   = { link = "@constructor" },
        TroubleIconDirectory     = { fg = newpaper.teal, bg = newpaper.none },
        -- TroubleIconEnum          = { link = "@lsp.type.enum" },
        -- TroubleIconEnumMember    = { link = "@lsp.type.enumMember" },
        -- TroubleIconEvent         = { link = "Special" },
        -- TroubleIconField         = { link = "@variable.member" },
        TroubleIconFile          = { fg = newpaper.teal, bg = newpaper.none },
        -- TroubleIconFunction      = { link = "@function" },
        -- TroubleIconInterface     = { link = "@lsp.type.interface" },
        -- TroubleIconKey           = { link = "@lsp.type.keyword" },
        -- TroubleIconMethod        = { link = "@function.method" },
        -- TroubleIconModule        = { link = "@module" },
        -- TroubleIconNamespace     = { link = "@module" },
        -- TroubleIconNull          = { link = "@constant.builtin" },
        -- TroubleIconNumber        = { link = "@number" },
        -- TroubleIconObject        = { link = "@constant" },
        -- TroubleIconOperator      = { link = "@operator" },
        -- TroubleIconPackage       = { link = "@module" },
        -- TroubleIconProperty      = { link = "@property" },
        -- TroubleIconString        = { link = "@string" },
        -- TroubleIconStruct        = { link = "@lsp.type.struct" },
        -- TroubleIconTypeParameter = { link = "@lsp.type.typeParameter" },
        -- TroubleIconVariable      = { link = "@variable" },

        TroubleIndent            = { fg = newpaper.linenumber_fg, bg = newpaper.none },
        TroubleIndentFoldClosed  = { fg = newpaper.cursor_nr_fg, bg = newpaper.none },
        TroubleIndentFoldOpen    = { link = "TroubleIndent" },
        TroubleIndentLast        = { link = "TroubleIndent" },
        TroubleIndentMiddle      = { link = "TroubleIndent" },
        TroubleIndentTop         = { link = "TroubleIndent" },
        TroubleIndentWs          = { link = "TroubleIndent" },
        TroubleNormal            = { fg = newpaper.trouble_fg, bg = newpaper.trouble_bg },
        TroubleNormalNC          = { fg = newpaper.trouble_fg, bg = newpaper.trouble_bg },
        TroublePos               = { fg = newpaper.linenumber_fg, bg = newpaper.none },
        TroublePreview           = { bg = newpaper.aqua },
    }
end

return M
