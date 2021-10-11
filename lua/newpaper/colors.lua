local util         = require("newpaper.util")
local configModule = require("newpaper.config")

local M = {}

function M.setup(config)
    config = config or configModule.config

    -- LuaFormatter off

    local newpaper = {
        black           = '#2B2B2B', -- color00
        maroon          = '#AF0000', -- color01
        darkgreen       = '#008700', -- color02
        olive           = '#5F8700', -- color03
        navy            = '#003399', -- color04
        purple          = '#8700AF', -- color05
        teal            = '#005F87', -- color06
        silver          = '#E4E4E4', -- color07
        gray            = '#585858', -- color08
        red             = '#DF0000', -- color09
        green           = '#50A14F', -- color10
        yellow          = '#FFFF00', -- color11
        blue            = '#0087AF', -- color12
        magenta         = '#D7005F', -- color13
        aqua            = '#AFD7FF', -- color14
        white           = '#F1F3F2', -- color15
        none            = 'NONE',

            -- Other colors
        lightorange     = '#E9B96E',
        orange          = '#DB6F19',
        darkorange      = '#AF5F00',
        darkyellow      = '#A68748',
        pink            = '#FFEEFF',
        darkgray        = '#444444',
        lightgray       = '#878787',
        lightlightgray  = '#C0C0C0',
        lightsilver     = '#EEEEEE',
        blueviolet      = '#AF87D7',
        lightblue       = '#0072C1',
        ocean           = '#25817D',
        nephritis       = '#00A86B',
        darkpurple      = '#5823C7',
        redorange       = '#D1301A',

        -- Git and diff
        git_bg          = '#EBEAE2',
        git_fg          = '#413932',
        git_added       = '#28A745',
        git_modified    = '#DBAB09',
        git_removed     = '#D73A49',
        diffadd_bg      = '#AFFFAF',
        diffdelete_bg   = '#FFD7FF',
        difftext_bg     = '#FFFFD7',
        diffchange_bg   = '#FFD787',

        -- Spell
        spellbad        = '#FFAFD7',
        spellcap        = '#FFFFAF',
        spellrare       = '#AFFF87',
        spelllocal      = '#D7D7FF',

        -- Error message
        error_fg        = '#D75F66',
        warn_fg         = '#D37300',
        info_fg         = '#005FAF',
        hint_fg         = '#0EA674',
        lsp_error_bg    = '#FDF0F0',
        warn_bg         = '#FDF5EC',
        info_bg         = '#EBF0FD',
        hint_bg         = '#E7F8F2',

        -- TeX
        tex_maroon      = '#A2251A',
        tex_green       = '#597B16',
        tex_olive       = '#89802A',
        tex_navy        = '#1E40C2',
        tex_red         = '#D42F2D',
        tex_blue        = '#007BA1',
        tex_magenta     = '#E00051',
        tex_aqua        = '#28A4CE',
        tex_orange      = '#DB6F19',
        tex_darkorange  = '#A75A00',

        tex_lightpurple = '#684D99',
        tex_lightviolet = '#BC93BC',
        tex_pink        = '#D75F66',
        tex_lightgreen  = '#009D55',

        tex_math        = '#008000',
        tex_keyword     = '#7F2DC2',
        tex_verb        = '#3A3A3A',

        tex_group_error      = '#EBF2FF',
        tex_minipage_error   = '#FBE5CC',
        tex_math_error       = '#CCE5CC',
        tex_math_delim_error = '#E0DBEA',
        tex_parbox_opt_error = '#F0D4D1',
        tex_only_math_error  = '#EAE8D5',

        -- Ruby
        ruby_maroon     = '#880000',
        ruby_navy       = '#3251C5',
        ruby_purple     = '#6838CC',
        ruby_red        = '#CC342D',
        ruby_green      = '#00AF2F',
        ruby_blue       = '#3A72ED',
        ruby_magenta    = '#AF0080',

        -- Lua
        lua_navy        = '#030380',

        -- Jinja
        jinja_red       = '#b80000',
    }

    if config.style == 'light' then

        -- Default fg and bg
        newpaper.fg     = newpaper.black
        newpaper.bg     = newpaper.white

    elseif config.style == 'dark' then

        newpaper.black           = '#2B2B2B' -- color00
        newpaper.maroon          = '#CC5555' -- color01
        newpaper.darkgreen       = '#5FAF5F' -- color02
        newpaper.olive           = '#A4A400' -- color03
        newpaper.navy            = '#8195E7' -- color04
        newpaper.purple          = '#AF87D7' -- color05
        newpaper.teal            = '#5F8787' -- color06
        newpaper.silver          = '#3A3A3A' -- color07
        newpaper.gray            = '#808080' -- color08
        newpaper.red             = '#FF3333' -- color09
        newpaper.green           = '#00875F' -- color10
        newpaper.yellow          = '#AFD700' -- color11
        newpaper.blue            = '#5FAFD7' -- color12
        newpaper.magenta         = '#D75FAF' -- color13
        newpaper.aqua            = '#5C6370' -- color14
        newpaper.white           = '#F1F3F2' -- color15
        newpaper.none            = 'NONE'

        -- Other colors
        newpaper.lightorange     = '#413932'
        newpaper.orange          = '#FF8700'
        newpaper.darkorange      = '#AF5F00'
        newpaper.darkyellow      = '#D7AF5F'
        newpaper.pink            = '#5F0000'
        newpaper.darkgray        = '#BCBCBC'
        newpaper.lightgray       = '#787878'
        newpaper.lightlightgray  = '#4E4E4E'
        newpaper.lightsilver     = '#303030'
        newpaper.blueviolet      = '#5F005F'
        newpaper.lightblue       = '#8BC5ED'
        newpaper.ocean           = '#92C0BE'
        newpaper.nephritis       = '#66CAA6'
        newpaper.darkpurple      = '#945EEF'
        newpaper.redorange       = '#FE7967'

        -- Git and diff
        newpaper.git_fg          = '#EBEAE2'
        newpaper.git_bg          = '#303030'
        newpaper.git_added       = '#28A745'
        newpaper.git_modified    = '#DBAB09'
        newpaper.git_removed     = '#D73A49'
        newpaper.diffadd_bg      = '#005F00'
        newpaper.diffdelete_bg   = '#5F0000'
        newpaper.difftext_bg     = '#008787'
        newpaper.diffchange_bg   = '#005F5F'

        -- Spell
        newpaper.spellbad        = '#5F0000'
        newpaper.spellcap        = '#5F005F'
        newpaper.spellrare       = '#005F00'
        newpaper.spelllocal      = '#00005F'

        -- Error message
        newpaper.error_fg        = '#DB4B4B'
        newpaper.warn_fg         = '#E0AF68'
        newpaper.info_fg         = '#0DB9D7'
        newpaper.hint_fg         = '#10B981'
        newpaper.lsp_error_bg    = '#362C3D'
        newpaper.warn_bg         = '#373640'
        newpaper.info_bg         = '#22374B'
        newpaper.hint_bg         = '#233745'

        -- TeX
        newpaper.tex_maroon      = '#C9655C'
        newpaper.tex_green       = '#5FAF00'
        newpaper.tex_olive       = '#BCB677'
        newpaper.tex_navy        = '#738AE5'
        newpaper.tex_red         = '#EF5D5B'
        newpaper.tex_blue        = '#5FC9EE'
        newpaper.tex_magenta     = '#FF5FAF'
        newpaper.tex_aqua        = '#00FFFF'
        newpaper.tex_orange      = '#FF8700'
        newpaper.tex_darkorange  = '#E5871A'

        newpaper.tex_lightpurple = '#A494C1'
        newpaper.tex_lightviolet = '#D0B2D0'
        newpaper.tex_pink        = '#EF6A72'
        newpaper.tex_lightgreen  = '#00E1A4'

        newpaper.tex_math        = '#5FAF5F'
        newpaper.tex_keyword     = '#9D79C1'
        newpaper.tex_verb        = '#BCBCBC'

        newpaper.tex_group_error      = '#39404C'
        newpaper.tex_minipage_error   = '#310012'
        newpaper.tex_math_error       = '#003300'
        newpaper.tex_math_delim_error = '#34264C'
        newpaper.tex_parbox_opt_error = '#462600'
        newpaper.tex_only_math_error  = '#3D3912'

        -- Ruby
        newpaper.ruby_maroon     = '#BE7575'
        newpaper.ruby_navy       = '#6A82D9'
        newpaper.ruby_purple     = '#8959A8'
        newpaper.ruby_red        = '#C2534D'
        newpaper.ruby_green      = '#94D780'
        newpaper.ruby_blue       = '#00AFAF'
        newpaper.ruby_magenta    = '#B34495'

        -- Lua
        newpaper.lua_navy        = '#9191C7'

            -- Jinja
        newpaper.jinja_red       = '#D05858'

        -- Default fg and bg
        newpaper.fg              = newpaper.white
        newpaper.bg              = newpaper.black


    end

    -- Optional colors
    newpaper.keyword             = newpaper.purple
    newpaper.cursor              = newpaper.black
    newpaper.selection           = newpaper.blue
    newpaper.string              = newpaper.lightblue
    newpaper.accent              = newpaper.blue
    newpaper.comment             = newpaper.lightgray
    newpaper.link                = newpaper.navy
    newpaper.tag                 = newpaper.navy
    newpaper.boolean             = newpaper.nephritis
    newpaper.highlight           = newpaper.silver
    newpaper.disabled            = newpaper.lightlightgray
    newpaper.contrast            = newpaper.lightlightgray
    newpaper.active              = newpaper.silver
    newpaper.border              = newpaper.purple
    newpaper.text                = newpaper.darkgray
    newpaper.title               = newpaper.fg
    newpaper.variable            = newpaper.fg

    -- Editor
    newpaper.folded_fg           = newpaper.blue
    newpaper.folded_bg           = newpaper.aqua
    newpaper.wildmenu_bg         = newpaper.yellow
    newpaper.wildmenu_fg         = newpaper.darkgray
    newpaper.cursor_nr_fg        = newpaper.darkorange
    newpaper.cursor_nr_bg        = newpaper.lightsilver
    newpaper.linenumber_fg       = newpaper.comment
    newpaper.linenumber_bg       = newpaper.lightsilver
    newpaper.msgarea_fg          = newpaper.fg
    newpaper.msgarea_bg          = newpaper.bg

    -- Search
    newpaper.search_fg           = newpaper.black
    newpaper.search_bg           = newpaper.yellow

    -- Error message
    newpaper.error_bg            = newpaper.pink

    -- Tabline
    newpaper.tabline_bg          = newpaper.lightlightgray
    newpaper.tabline_active_fg   = newpaper.fg
    newpaper.tabline_active_bg   = newpaper.bg
    newpaper.tabline_inactive_fg = newpaper.lightgray
    newpaper.tabline_inactive_bg = newpaper.silver

    -- Sidebar and float windows
    newpaper.sidebar_fg          = newpaper.fg
    newpaper.sidebar_bg          = newpaper.bg
    newpaper.float_fg            = newpaper.fg
    newpaper.float_bg            = newpaper.bg
    newpaper.telescope_fg        = newpaper.fg
    newpaper.telescope_bg        = newpaper.bg
    newpaper.sidebar_fg_alt      = newpaper.fg
    newpaper.sidebar_bg_alt      = newpaper.silver
    newpaper.float_fg_alt        = newpaper.fg
    newpaper.float_bg_alt        = newpaper.silver
    newpaper.telescope_fg_alt    = newpaper.fg
    newpaper.telescope_bg_alt    = newpaper.silver

    -- LuaFormatter on

    if config.contrast_float then
        newpaper.float_fg = newpaper.float_fg_alt
        newpaper.float_bg = newpaper.float_bg_alt
    end

    if config.contrast_telescope then
        newpaper.telescope_fg = newpaper.telescope_fg_alt
        newpaper.telescope_bg = newpaper.telescope_bg_alt
    end

    if config.contrast_sidebar then
        newpaper.sidebar_fg = newpaper.sidebar_fg_alt
        newpaper.sidebar_bg = newpaper.sidebar_bg_alt
    end

    util.color_overrides(newpaper, config)

    return newpaper

    end

return M
