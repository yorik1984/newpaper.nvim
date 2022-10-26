local util = require("newpaper.util")
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
            helpCommand        = { fg = newpaper.teal },
            helpExample        = { fg = newpaper.string, style = style.s_style },
            helpHyperTextEntry = { fg = newpaper.keyword, style = style.s_style },
            helpHyperTextJump  = { fg = newpaper.link, style = style.s_underline },
            helpURL            = { fg = newpaper.string, style = style.link },
        }

        return syntax
    end

    helpSyn.loadTreeSitter = function ()

        -- fallback to 0.7
        local treesitterOldKey = {
            ["@conceal.help"]        = "helpTSConceal",
            ["@label.help"]          = "helpTSLabel",
            ["@parameter.help"]      = "helpTSParameter",
            ["@string.help"]         = "helpTSString",
            ["@text.literal.help"]   = "helpTSTextLiteral",
            ["@text.reference.help"] = "helpTSTextReference",
            ["@text.title.help"]     = "helpTSTitle",
        }

        local treesitter = {
            ["@conceal.help"]        = { fg = newpaper.magenta },
            ["@label.help"]          = { fg = newpaper.keyword, style = style.s_style },
            ["@parameter.help"]      = { fg = newpaper.magenta },
            ["@string.help"]         = { fg = newpaper.teal },
            ["@text.literal.help"]   = { fg = newpaper.darkengreen },
            ["@text.reference.help"] = { fg = newpaper.link, style = style.s_underline },
            ["@text.title.help"]     = { fg = newpaper.keyword, style = style.k_style },
        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
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
