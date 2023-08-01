local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local fugitiveSyn  = {}
    fugitiveSyn.colors = configColors
    fugitiveSyn.style  = configStyle
    local newpaper     = fugitiveSyn.colors
    local style        = fugitiveSyn.style
    fugitiveSyn.loadPlugins = function()
        local plugins = {
            fugitiveHelpHeader        = { fg = newpaper.ruby_magenta, style = style.b_bold },
            fugitiveHeader            = { fg = newpaper.tex_blue, style = style.b_bold },
            fugitiveHelpTag           = { fg = newpaper.purple },
            fugitiveHeading           = { fg = newpaper.tex_math, style = style.b_bold },
            fugitiveUntrackedHeading  = { fg = newpaper.tex_red, style = style.b_bold },
            fugitiveUnstagedHeading   = { fg = newpaper.ruby_purple, style = style.b_bold },
            fugitiveStagedHeading     = { fg = newpaper.dark_maroon, style = style.b_bold },
            -- fugitiveModifier          Type
            fugitiveUntrackedModifier = { fg = newpaper.git_added },
            fugitiveUnstagedModifier  = { fg = newpaper.git_modified, style = style.b_bold },
            fugitiveStagedModifier    = { fg = newpaper.maroon },
            fugitiveInstruction       = { fg = newpaper.string },
            fugitiveStop              = { fg = newpaper.tag_navy },
            fugitiveHash              = { fg = newpaper.orange },
            fugitiveSymbolicRef       = { fg = newpaper.green, style = style.b_bold },
            -- fugitiveCount             Number
        }
        return plugins
    end

    -- stylua: ignore end

    return fugitiveSyn
end

return M
