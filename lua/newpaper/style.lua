local configModule = require("newpaper.config")

local M = {}

function M.setup_style(config)
	config = config or configModule.config

	local style = {

		none          = "NONE", -- editor style NONE
		b_bold        = "NONE", -- editor style bold
		b_italic      = "NONE", -- editor style italic
		b_bold_i      = "NONE", -- editor style bold italic
		b_bold_u      = "NONE", -- editor style bold underline
		c_style       = "NONE", -- coments style
		o_style       = "NONE", -- operators style
		s_style       = "NONE", -- strings style
		v_style       = "NONE", -- variables style
		f_style       = "NONE", -- functions style
		comment_title = "NONE", -- magic and tittle comments in VimL, Ruby and others

		-- HTML tag styles
		tag_style = config.tags,
		link      = "italic,underline",
		b_link    = "bold,underline",

		-- Make keywords bold or italic
		k_style = config.keywords,

		-- Tex settings
		tex_m_style = config.tex_major,
		tex_k_style = config.tex_keywords,
		tex_z_style = config.tex_zone,
		tex_a_style = config.tex_arg,
		tex_o_style = "NONE", -- operators style

		-- Spell style
		error = "NONE",
	}

	-- Make bold or italic style for editor groups
	if config.editor_better_view then
		style.b_bold   = "bold"
		style.b_italic = "italic"
		style.b_bold_i = "bold,italic"
		style.b_bold_u = "bold,underline"
	end

	if config.operators_bold then
		style.o_style = "bold"
	end

	-- Tex settings
	if config.tex_operators_bold then
		style.tex_o_style = "bold"
	end

	-- Error style
	if config.error_highlight == "undercurl" or config.error_highlight == "both" then
		style.error = "undercurl"
	end

	-- Make italic strings
	if config.italic_strings then
		style.s_style = "italic"
	end

	-- Make italic comments
	if config.italic_comments then
		style.c_style = "italic"
	end

	-- Make italic functions
	if config.italic_functions then
		style.f_style = "italic"
	end

	-- Make italic variable
	if config.italic_variables then
		style.v_style = "italic"
	end

	-- comment for VimL
	if config.italic_comments and config.keywords then
		style.comment_title = "bold,italic"
	elseif config.keywords then
		style.comment_title = style.k_style
	else
		style.comment_title = style.c_style
	end

	return style
end

return M
