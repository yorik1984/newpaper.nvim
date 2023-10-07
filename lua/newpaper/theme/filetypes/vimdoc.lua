local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local vimdocSyn  = {}
    vimdocSyn.colors = configColors
    vimdocSyn.style  = configStyle
    local newpaper   = vimdocSyn.colors
    local style      = vimdocSyn.style

    vimdocSyn.loadSyntax = function()
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
            ["@conceal.vimdoc"]        = { fg = newpaper.magenta },
            ["@label.vimdoc"]          = { fg = newpaper.bluegreen },
            ["@string.special.vimdoc"] = { fg = newpaper.keywords, nocombine = true },
            ["@text.reference.vimdoc"] = { fg = newpaper.links, style = style.underline },
            ["@text.uri.vimdoc"]       = { fg = newpaper.strings, style = style.links },
            ["@type.vimdoc"]           = { fg = newpaper.tex_red, nocombine = true },
        }

        return treesitter
    end

    -- stylua: ignore end

    return vimdocSyn
end

return M
