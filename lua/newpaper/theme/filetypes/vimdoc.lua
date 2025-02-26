local M = {}

function M.setup(configColors, configStyle)
    local vimdocSyn          = {}
    vimdocSyn.colors         = configColors
    vimdocSyn.style          = configStyle
    local newpaper           = vimdocSyn.colors
    local style              = vimdocSyn.style

    vimdocSyn.loadSyntax     = function()
        local syntax = {
            helpBacktick       = { fg = newpaper.magenta },
            helpSpecial        = { fg = newpaper.magenta },
            helpCommand        = { fg = newpaper.regexp_blue },
            helpExample        = { fg = newpaper.regexp_blue },
            helpHyperTextEntry = { fg = newpaper.keywords, style = style.s_style },
            helpHyperTextJump  = { fg = newpaper.links, style = style.s_underline },
            helpURL            = { fg = newpaper.strings, style = style.links },
        }
        return syntax
    end

    vimdocSyn.loadTreeSitter = function()
        local treesitter = {
            ["@label.vimdoc"]          = { fg = newpaper.tex_magenta },
            ["@markup.link.vimdoc"]    = { fg = newpaper.links, style = style.underline },
            ["@string.special.vimdoc"] = { fg = newpaper.keywords, nocombine = true },
        }
        return treesitter
    end

    return vimdocSyn
end

return M
