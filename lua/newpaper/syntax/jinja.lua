local M = {}

function M.setup(config)
	config = config or require("newpaper.config").config

    -- stylua: ignore start

    local jinjaSyn  = {}
    jinjaSyn.colors = require("newpaper.colors").setup(config)
    jinjaSyn.style  = require("newpaper.style").setup_style(config)
    local newpaper  = jinjaSyn.colors
    local style     = jinjaSyn.style

    jinjaSyn.loadPlugins = function()

        local plugins = {

            -- Vim-Jinja2-Syntax

            jinjaPunctuation  = { fg = newpaper.blueviolet },
            jinjaAttribute    = { fg = newpaper.darkengreen },
            jinjaFunction     = { fg = newpaper.navy, style = style.f_style },

            -- jinjaTagDelim     jinjaTagBlock
            -- jinjaVarDelim     jinjaVarBlock
            -- jinjaCommentDelim jinjaComment
            jinjaRawDelim     = { fg = newpaper.darkgrey, style = style.o_style },

            jinjaSpecial      = { fg = newpaper.darkgreen, style = style.o_style },
            jinjaOperator     = { fg = newpaper.navy, style = style.o_style },
            jinjaRaw          = { fg = newpaper.darkgrey },
            jinjaTagBlock     = { fg = newpaper.jinja_red },
            jinjaVarBlock     = { fg = newpaper.jinja_red },
            -- jinjaStatement    Statement
            jinjaFilter       = { fg = newpaper.blue, style = style.f_style },
            jinjaBlockName    = { fg = newpaper.teal },
            -- jinjaVariable     Identifier
            jinjaString       = { fg = newpaper.string, style = style.s_style },
            jinjaNumber       = { fg = newpaper.red },
            -- jinjaComment      Comment

        }

        return plugins
    end

	-- stylua: ignore end

	return jinjaSyn
end

return M
