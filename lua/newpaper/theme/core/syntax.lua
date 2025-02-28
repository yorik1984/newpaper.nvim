local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        Boolean        = { fg = newpaper.booleans, style = style.bool_style },
        Character      = { fg = newpaper.orange, style = style.o_style },
        Conditional    = { fg = newpaper.keywords, style = style.k_style },
        Constant       = { fg = newpaper.darkgreen },
        Debug          = { fg = newpaper.red },
        Define         = { fg = newpaper.magenta },
        Delimiter      = { fg = newpaper.persimona, style = style.d_style },
        Error          = { fg = newpaper.errormsg_fg, bg = newpaper.errormsg_bg },
        Exception      = { fg = newpaper.redorange },
        Float          = { fg = newpaper.magenta },
        Function       = { fg = newpaper.lua_navy, style = style.f_style },
        Identifier     = { fg = newpaper.variables, style = style.v_style },
        Ignore         = { fg = newpaper.disabled },
        Include        = { fg = newpaper.maroon },
        Keyword        = { fg = newpaper.keywords, style = style.k_style },
        Label          = { fg = newpaper.magenta },
        Macro          = { fg = newpaper.magenta },
        Method         = { fg = newpaper.ruby_navy, style = style.f_style },
        Noise          = { link = "Delimiter" },
        Number         = { fg = newpaper.numbers },
        Operator       = { fg = newpaper.navy, style = style.o_style },
        PreCondit      = { fg = newpaper.magenta, style = style.k_style },
        PreProc        = { fg = newpaper.navy },
        Quote          = { link = "String" },
        Repeat         = { fg = newpaper.keywords, style = style.k_style },
        Special        = { fg = newpaper.dark_maroon },
        SpecialChar    = { fg = newpaper.maroon },
        SpecialComment = { fg = newpaper.comments, style = style.k_style },
        Statement      = { fg = newpaper.keywords, style = style.k_style },
        StorageClass   = { fg = newpaper.lua_navy, style = style.k_style },
        String         = { fg = newpaper.strings, style = style.s_style },
        Structure      = { fg = newpaper.darkpurple, style = style.k_style },
        Tag            = { fg = newpaper.tags, style = style.tags_style },
        Todo           = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
        Type           = { fg = newpaper.darkengreen },
        Typedef        = { fg = newpaper.maroon },
        Underlined     = { fg = newpaper.links, style = style.underline },

        Added          = { fg = newpaper.git_added, bg = newpaper.diffadd_bg },
        Changed        = { fg = newpaper.texts, bg = newpaper.diffchange_bg },
        Removed        = { fg = newpaper.git_removed, bg = newpaper.diffdelete_bg },
    }
end

return M
