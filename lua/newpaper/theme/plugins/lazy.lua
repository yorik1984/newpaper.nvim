local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        Bold              = { style = style.b_bold, nocombine = true },
        LazyNormal        = { fg = newpaper.texts, bg = newpaper.float_bg, nocombine = true },
        LazyH1            = { fg = newpaper.search_fg, bg = newpaper.persimona },
        LazyH2            = { fg = newpaper.keywords, style = style.b_bold },
        LazyCommit        = { fg = newpaper.orange, nocombine = true },
        LazyCommitIssue   = { fg = newpaper.git_removed, nocombine = true },
        LazyCommitType    = { fg = newpaper.olive, nocombine = true },
        LazyCommitScope   = { style = style.b_italic, nocombine = true },
        LazyDimmed        = { fg = newpaper.darkgreen, nocombine = true },
        LazyProp          = { fg = newpaper.ocean, nocombine = true },
        LazyValue         = { fg = newpaper.strings, nocombine = true },
        LazyReasonRuntime = { link = "LazyDir" },
        LazyReasonEvent   = { fg = newpaper.magenta, nocombine = true },
        LazyReasonKeys    = { fg = newpaper.keywords, nocombine = true },
        LazyReasonStart   = { fg = newpaper.green, style = style.b_bold, nocombine = true },
        LazyReasonFt      = { fg = newpaper.lua_blue, nocombine = true },
        LazyReasonCmd     = { fg = newpaper.lua_navy, nocombine = true },
        LazyReasonImport  = { fg = newpaper.darkyellow, nocombine = true },
        LazyButton        = { fg = newpaper.gray, bg = newpaper.bg, nocombine = true },
        LazyTaskOutput    = { fg = newpaper.tex_verb, nocombine = true },
        LazyButtonActive  = { fg = newpaper.texts, bg = newpaper.aqua, style = style.b_bold, nocombine = true },
        LazyDir           = { fg = newpaper.teal, nocombine = true },
        LazyUrl           = { fg = newpaper.links, style = style.links, nocombine = true },
    }
end

return M
