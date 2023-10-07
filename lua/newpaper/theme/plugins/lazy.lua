local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local lazySyn  = {}
    lazySyn.colors = configColors
    lazySyn.style  = configStyle
    local newpaper = lazySyn.colors
    local style    = lazySyn.style

    lazySyn.loadPlugins = function()
        local plugins = {
            Bold              = { style = style.b_bold },
            LazyNormal        = { fg = newpaper.texts, bg = newpaper.float_bg },
            LazyH1            = { fg = newpaper.search_fg, bg = newpaper.persimona },
            LazyH2            = { fg = newpaper.keywords, style = style.b_bold },
            LazyCommit        = { fg = newpaper.orange },
            LazyCommitIssue   = { fg = newpaper.git_removed },
            LazyCommitType    = { fg = newpaper.olive },
            LazyCommitScope   = { style = style.b_italic },
            LazyDimmed        = { fg = newpaper.darkgreen },
            LazyProp          = { fg = newpaper.ocean },
            LazyValue         = { fg = newpaper.strings },
            LazyReasonRuntime = { link = "LazyDir" },
            LazyReasonEvent   = { fg = newpaper.magenta},
            LazyReasonKeys    = { fg = newpaper.keywords },
            LazyReasonStart   = { fg = newpaper.green, style = style.b_bold },
            LazyReasonFt      = { fg = newpaper.lua_blue},
            LazyReasonCmd     = { fg = newpaper.lua_navy },
            LazyReasonImport  = { fg = newpaper.darkyellow },
            LazyButton        = { fg = newpaper.gray, bg = newpaper.bg },
            LazyTaskOutput    = { fg = newpaper.tex_verb },
            LazyButtonActive  = { fg = newpaper.texts, bg = newpaper.aqua, style = style.b_bold },
            LazyDir           = { fg = newpaper.teal},
            LazyUrl           = { fg = newpaper.links, style = style.links },
        }
        return plugins
    end

    -- stylua: ignore end

    return lazySyn
end

return M
