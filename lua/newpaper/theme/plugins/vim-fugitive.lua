local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        fugitiveHelpHeader        = { fg = newpaper.ruby_magenta, style = style.b_bold },
        fugitiveHeader            = { fg = newpaper.tex_blue, style = style.b_bold },
        fugitiveHelpTag           = { fg = newpaper.purple },
        fugitiveHeading           = { fg = newpaper.tex_math, style = style.b_bold },
        fugitiveUntrackedHeading  = { fg = newpaper.git_added, style = style.b_bold },
        fugitiveUnstagedHeading   = { fg = newpaper.git_modified, style = style.b_bold },
        fugitiveStagedHeading     = { fg = newpaper.dark_maroon, style = style.b_bold },
        -- fugitiveModifier          Type
        fugitiveUntrackedModifier = { fg = newpaper.git_added },
        fugitiveUnstagedModifier  = { fg = newpaper.git_modified, style = style.b_bold },
        fugitiveStagedModifier    = { fg = newpaper.maroon },
        fugitiveInstruction       = { fg = newpaper.strings },
        fugitiveStop              = { fg = newpaper.tag_navy },
        fugitiveHash              = { fg = newpaper.orange },
        fugitiveSymbolicRef       = { fg = newpaper.green, style = style.b_bold },
        -- fugitiveCount             Number
    }
end

return M
