local newpaper = {}
if vim.g.newpaper_style == 'light' then

    -- base 16 color palette
    newpaper.black          = '#2B2B2B' -- color00
    newpaper.maroon         = '#AF0001' -- color01
    newpaper.darkgreen      = '#008700' -- color02
    newpaper.olive          = '#5F8700' -- color03
    newpaper.navy           = '#0030AB' -- color04
    newpaper.purple         = '#8700AF' -- color05
    newpaper.teal           = '#005F87' -- color06
    newpaper.silver         = '#E4E4E4' -- color07
    newpaper.gray           = '#585858' -- color08
    newpaper.red            = '#DF0000' -- color09
    newpaper.green          = '#50A14F' -- color10
    newpaper.yellow         = '#E9B96E' -- color11
    newpaper.blue           = '#0087AF' -- color12
    newpaper.magenta        = '#D7005F' -- color13
    newpaper.aqua           = '#AFD7FF' -- color14
    newpaper.white          = '#F1F3F2' -- color15
    newpaper.none           = 'NONE'

    -- Other colors
    newpaper.orange         = '#D75F00'
    newpaper.darkorange     = '#AF5F00'
    newpaper.darkyellow     = '#b99751'
    newpaper.pink           = '#FFEEFF'
    newpaper.lightgray      = '#878787'
    newpaper.lightlightgray = '#D0D0D0'
    newpaper.lightsilver    = '#EEEEEE'
    newpaper.darkgray       = '#444444'
    newpaper.blueviolet     = '#AF87D7'

    -- Git and diff
    newpaper.git_bg         = '#EBEAE2'
    newpaper.git_fg         = '#413932'
    newpaper.git_added      = '#28A745'
    newpaper.git_modified   = '#DBAB09'
    newpaper.git_removed    = '#D73A49'
    newpaper.diffadd_bg     = '#AFFFAF'
    newpaper.diffdelete_bg  = '#FFD7FF'
    newpaper.difftext_bg    = '#FFFFD7'
    newpaper.diffchange_bg  = '#FFD787'

    -- Spell
    newpaper.spellbad       = '#FFAFD7'
    newpaper.spellcap       = '#FFFFAF'
    newpaper.spellrare      = '#AFFF87'
    newpaper.spelllocal     = '#D7D7FF'

    -- Error message
    newpaper.error_fg       = "#db4b4b"
    newpaper.warn_fg        = "#e0af68"
    newpaper.info_fg        = "#0db9d7"
    newpaper.hint_fg        = "#10B981"

elseif vim.g.newpaper_style == 'dark' then
    --TODO: add dark theme
end

-- Optional colors

newpaper.fg                     = newpaper.black
newpaper.bg                     = newpaper.white
newpaper.keywords               = newpaper.purple
newpaper.cursor                 = newpaper.black
newpaper.selection              = newpaper.blue
newpaper.string                 = newpaper.blue
newpaper.accent                 = newpaper.blue
newpaper.comments               = newpaper.lightgray
newpaper.link                   = newpaper.navy
newpaper.tags                   = newpaper.navy
newpaper.highlight              = newpaper.silver
newpaper.disabled               = newpaper.lightlightgray
newpaper.contrast               = newpaper.lightlightgray
newpaper.active                 = newpaper.silver
newpaper.border                 = newpaper.purple
newpaper.text                   = newpaper.darkgray
newpaper.title                  = newpaper.fg

newpaper.folded_fg              = newpaper.blue
newpaper.folded_bg              = newpaper.aqua
newpaper.wildmenu_fg            = newpaper.darkgray

-- Editor
newpaper.wildmenu_bg            = newpaper.yellow
newpaper.cursor_nr_fg           = newpaper.darkorange
newpaper.cursor_nr_bg           = newpaper.lightsilver
newpaper.linenumber_fg          = newpaper.comments
newpaper.linenumber_bg          = newpaper.lightsilver

-- Error message
newpaper.error_bg               = newpaper.pink

-- Tabline
newpaper.tabline_bg             = newpaper.teal
newpaper.tabline_active_fg      = newpaper.darkgray
newpaper.tabline_active_bg      = newpaper.white
newpaper.tabline_inactive_fg    = newpaper.white
newpaper.tabline_inactive_bg    = newpaper.blue

-- Sidebar and float windows
newpaper.sidebar_fg             = newpaper.fg
newpaper.sidebar_bg             = newpaper.bg
newpaper.float_fg               = newpaper.fg
newpaper.float_bg               = newpaper.bg
newpaper.sidebar_fg_alt         = newpaper.fg
newpaper.sidebar_bg_alt         = newpaper.silver
newpaper.float_fg_alt           = newpaper.fg
newpaper.float_bg_alt           = newpaper.silver

if vim.g.newpaper_contrast_float then
    newpaper.float_fg   = newpaper.float_fg_alt
    newpaper.float_bg   = newpaper.float_bg_alt
end

if vim.g.newpaper_contrast_sidebar then
    newpaper.sidebar_fg = newpaper.sidebar_fg_alt
    newpaper.sidebar_bg = newpaper.sidebar_bg_alt
end

-- Enable custom variable colors
if vim.g.newpaper_variable_color == nil then
    newpaper.variable = newpaper.fg
else
    newpaper.variable = vim.g.newpaper_variable_color
end

-- Apply user defined colors

-- Check if vim.g.newpaper_custom_colors = is a table
if type(vim.g.newpaper_custom_colors) == "table" then
	-- Iterate trough the table
	for key, value in pairs(vim.g.newpaper_custom_colors) do
		-- If the key doesn't exist
		if not newpaper[key] then
			error("Color " .. key .. " does not exist")
		end
		-- If it exists and the sting starts with a "#"
		if string.sub(value, 1, 1) == "#" then
			-- Hex override
			newpaper[key] = value
		-- IF it doesn't, dont accept it
		else
			-- Another group
			if not newpaper[value] then
                  error("Color " .. value .. " does not exist")
			end
			newpaper[key] = newpaper[value]
		end
    end
end

return newpaper
