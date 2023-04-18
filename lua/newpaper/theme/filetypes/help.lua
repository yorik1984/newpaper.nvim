local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local helpSyn  = {}
    helpSyn.colors = configColors
    helpSyn.style  = configStyle
    local newpaper = helpSyn.colors
    local style    = helpSyn.style

    helpSyn.loadSyntax = function ()
        local syntax = {
            helpBacktick       = { fg = newpaper.magenta },
            helpSpecial        = { fg = newpaper.magenta },
            helpCommand        = { fg = newpaper.regexp_blue },
            helpExample        = { fg = newpaper.regexp_blue },
            helpHyperTextEntry = { fg = newpaper.keyword, style = style.s_style },
            helpHyperTextJump  = { fg = newpaper.link, style = style.s_underline },
            helpURL            = { fg = newpaper.string, style = style.link },
        }

        return syntax
    end

    helpSyn.loadTreeSitter = function ()

        local treesitter = {
            ["@conceal.help"]        = { fg = newpaper.magenta },
            ["@label.help"]          = { fg = newpaper.keyword, style = style.s_style },
            ["@parameter.help"]      = { fg = newpaper.magenta },
            ["@text.reference.help"] = { fg = newpaper.link, style = style.s_underline },
            ["@text.title.help"]     = { fg = newpaper.keyword, style = style.k_style },
            ["@text.uri.help"]       = { fg = newpaper.string, style = style.link },
            ["@type.help"]           = { fg = newpaper.darkengreen, style = style.link },
        }

        return treesitter
    end

    helpSyn.loadPlugins = function()
        local plugins = {
            -- Plugin
        }

        return plugins
    end

    -- stylua: ignore end

    return helpSyn
end

return M
