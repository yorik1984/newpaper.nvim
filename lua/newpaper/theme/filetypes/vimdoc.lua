local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local vimdocSyn  = {}
    vimdocSyn.colors = configColors
    vimdocSyn.style  = configStyle
    local newpaper = vimdocSyn.colors
    local style    = vimdocSyn.style

    vimdocSyn.loadSyntax = function ()
        local syntax = {
            vimdocBacktick       = { fg = newpaper.magenta },
            vimdocSpecial        = { fg = newpaper.magenta },
            vimdocCommand        = { fg = newpaper.regexp_blue },
            vimdocExample        = { fg = newpaper.regexp_blue },
            vimdocHyperTextEntry = { fg = newpaper.keyword, style = style.s_style },
            vimdocHyperTextJump  = { fg = newpaper.link, style = style.s_underline },
            vimdocURL            = { fg = newpaper.string, style = style.link },
        }

        return syntax
    end

    vimdocSyn.loadTreeSitter = function ()

        local treesitter = {
            ["@conceal.vimdoc"]        = { fg = newpaper.magenta },
            ["@label.vimdoc"]          = { fg = newpaper.keyword },
            ["@text.reference.vimdoc"] = { fg = newpaper.link, style = style.underline },
            ["@text.title.vimdoc"]     = { fg = newpaper.keyword, style = style.k_style },
            ["@text.uri.vimdoc"]       = { fg = newpaper.string, style = style.link },
            ["@type.vimdoc"]           = { fg = newpaper.darkgreen, nocombine = true },
        }

        return treesitter
    end

    vimdocSyn.loadPlugins = function()
        local plugins = {
            -- Plugin
        }

        return plugins
    end

    -- stylua: ignore end

    return vimdocSyn
end

return M
