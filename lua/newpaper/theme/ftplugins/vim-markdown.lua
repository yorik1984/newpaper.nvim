local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        -- mkdString        String
        mkdCode          = { fg = newpaper.strings },
        mkdCodeDelimiter = { fg = newpaper.regexp_blue },
        mkdCodeStart     = { fg = newpaper.regexp_blue },
        mkdCodeEnd       = { fg = newpaper.regexp_blue },
        mkdFootnote      = { fg = newpaper.grey },
        mkdBlockquote    = { fg = newpaper.tex_quotes, style = style.s_style },
        mkdListItem      = { fg = newpaper.keywords },
        mkdRule          = { fg = newpaper.darkpurple },
        mkdLineBreak     = { bg = newpaper.aqua },
        mkdFootnotes     = { fg = newpaper.links, style = style.k_style },
        mkdURL           = { fg = newpaper.tex_string, style = style.links },
        mkdLink          = { fg = newpaper.links, style = style.underline },
        mkdInlineURL     = { fg = newpaper.links, style = style.underline },
        mkdID            = { fg = newpaper.maroon },
        mkdLinkDef       = { fg = newpaper.tex_maroon, style = style.k_style },
        mkdLinkDefTarget = { fg = newpaper.links, style = style.links },
        mkdLinkTitle     = { fg = newpaper.regexp_blue },
        mkdDelimiter     = { fg = newpaper.persimona, style = style.d_style },
    }
end

return M
