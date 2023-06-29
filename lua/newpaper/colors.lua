local util = require("newpaper.util")

local M = {}

function M.setup(config)

    -- stylua: ignore start

    local newpaper = {}

    if config.style == "light" then
        newpaper = {
            black                = "#2B2B2B", -- color00
            maroon               = "#AF0000", -- color01
            darkgreen            = "#008700", -- color02
            darkorange           = "#AF5F00", -- color03
            navy                 = "#27408B", -- color04
            purple               = "#8700AF", -- color05
            teal                 = "#005F87", -- color06
            darkgrey             = "#444444", -- color08
            red                  = "#E14133", -- color09
            green                = "#50A14F", -- color10
            orange               = "#D75F00", -- color11
            lightblue            = "#0072C1", -- color12
            lightmagenta         = "#E563BA", -- color13
            blue                 = "#0087AF", -- color14
            white                = "#F1F3F2",

            -- Default fg and bg
            fg                   = "#2B2B2B", -- color15
            bg                   = "#F1F3F2", -- color07

            -- Other colors
            dark_maroon          = "#8C1919",
            redorange            = "#E12D23",
            pink                 = "#FFEEFF",
            lightorange          = "#E4C07A",
            persimona            = "#F48F5F",
            yellow               = "#FFFF00",
            darkyellow           = "#C18301",
            olive                = "#5F8700",
            darkengreen          = "#007200",
            ocean                = "#2E8B57",
            nephritis            = "#00AB66",
            bluegreen            = "#1B7F82",
            aqua                 = "#C0D9F2",
            aqualight            = "#DFE4EB",
            lightviolet          = "#E5D9F2",
            blueviolet           = "#AF87D7",
            violet               = "#957CC6",
            darkpurple           = "#5823C7",
            magenta              = "#D7005F",
            grey                 = "#585858",
            lightgrey            = "#878787",
            lightlightgrey       = "#C0C0C0",
            silver               = "#E4E4E4",
            lightsilver          = "#EEEEEE",

            codeblock            = "#DEDEDE",
            disabled             = "#CCCCCC",

            regexp_blue          = "#3A72ED",
            regexp_green         = "#00AA00",
            regexp_orange        = "#DD7700",
            regexp_magenta       = "#E64BE1",
            regexp_brown         = "#884400",

            -- Git and diff
            git_fg               = "#413932",
            git_bg               = "#EBEAE2",
            git_added            = "#28A745",
            git_modified         = "#DBAB09",
            git_removed          = "#D73A49",
            diffadd_bg           = "#AFFFAF",
            diffdelete_bg        = "#FFD7FF",
            difftext_bg          = "#FFFFD7",
            diffchange_bg        = "#FFD787",

            -- Spell
            spellbad             = "#FFF4FF",
            spellcap             = "#E7E7FF",
            spellrare            = "#FFFFDF",
            spelllocal           = "#E3FFD5",

            -- LSP message
            error_fg             = "#D75F66",
            warn_fg              = "#D37300",
            info_fg              = "#005FAF",
            hint_fg              = "#0EA674",
            lsp_error_bg         = "#FDF0F0",
            warn_bg              = "#FDF5EC",
            info_bg              = "#EBF0FD",
            hint_bg              = "#E7F8F2",

            -- Todo
            todo_error           = "#DF0000",
            todo_warn            = "#D75F00",
            todo_info            = "#3A72ED",
            todo_hint            = "#199319",
            todo_default         = "#894DEE",

            -- TeX
            tex_maroon           = "#A2251A",
            tex_olive            = "#89802B",
            tex_navy             = "#1E40C2",
            tex_red              = "#D84342",
            tex_blue             = "#0089B3",
            tex_teal             = "#005579",
            tex_magenta          = "#E00050",
            tex_aqua             = "#14B9C4",
            tex_orange           = "#D37300",
            tex_redorange        = "#F3752D",
            tex_darkorange       = "#BA6400",

            tex_lightpurple      = "#684D99",
            tex_lightviolet      = "#B777B7",
            tex_pink             = "#D75F66",
            tex_lightgreen       = "#20A93E",

            tex_math             = "#008000",
            tex_math_delim       = "#349279",
            tex_part_title       = "#5F8A00",
            tex_ch_brown         = "#8C1919",
            tex_ch_orange        = "#E5740B",
            tex_ch_green         = "#19A665",
            tex_ch_red           = "#E04A4A",
            tex_ch_blue          = "#394892",
            tex_keyword          = "#7F2DC2",
            tex_verb             = "#4E5B5F",
            tex_string           = "#007FD7",
            tex_tikz_purple      = "#635F8C",
            tex_tikz_green       = "#568355",
            tex_tikz_orange      = "#AB915E",
            tex_tikz_navy        = "#4654C0",
            tex_tikz_verb        = "#535362",
            tex_quotes           = "#003399",
            tex_SI_purple        = "#523891",
            tex_SI_orange        = "#D55C1F",
            tex_SI_red           = "#D83851",
            tex_SI_navy          = "#0B5394",
            tex_SI_green         = "#589927",
            tex_SI_magenta       = "#BC5AA2",
            tex_SI_yellow        = "#C88900",

            tex_group_error      = "#EBF2FF",
            tex_math_error       = "#CCE5CC",
            tex_math_delim_error = "#FBE5CC",
            tex_parbox_opt_error = "#F0D4D1",
            tex_only_math_error  = "#EAE8D5",

            -- Ruby
            ruby_maroon          = "#880000",
            ruby_navy            = "#09529B",
            ruby_purple          = "#6838CC",
            ruby_magenta         = "#A626A4",
            ruby_orange          = "#BF5019",

            -- Lua
            lua_navy             = "#030380",
            lua_blue             = "#128897",

            -- Jinja
            jinja_red            = "#b80000",

            -- Python
            python_blue          = "#336D9E",

            --Rust
            rust_green           = "#0B7261",

            -- HTML
            tag_navy             = "#0044AA",
        }
    elseif config.style == "dark" then
        newpaper = {
            black                = "#2B2B2B", -- color00
            maroon               = "#CC5555", -- color01
            darkgreen            = "#75B680", -- color02
            darkorange           = "#C57A30", -- color03
            navy                 = "#8195E7", -- color04
            purple               = "#A274D1", -- color05
            teal                 = "#72AEB3", -- color06
            darkgrey             = "#BCBCBC", -- color08
            red                  = "#DC5761", -- color09
            green                = "#5FAF5F", -- color10
            orange               = "#F5824B", -- color11
            lightblue            = "#7DB1D5", -- color12
            lightmagenta         = "#E878D8", -- color13
            blue                 = "#5FAFD7", -- color14
            white                = "#C6C8CD",

            -- Default fg and bg
            fg                   = "#C6C8CD", -- color15
            bg                   = "#303030", -- color07

            -- Other colors
            dark_maroon          = "#A64C4C",
            redorange            = "#E56755",
            pink                 = "#2E2323",
            lightorange          = "#443924",
            persimona            = "#E59400",
            yellow               = "#D8E24F",
            darkyellow           = "#C6A863",
            olive                = "#8B9240",
            darkengreen          = "#589A58",
            ocean                = "#43A68A",
            nephritis            = "#36C692",
            bluegreen            = "#4BB5B1",
            aqua                 = "#34495E",
            aqualight            = "#2E3032",
            lightviolet          = "#473954",
            blueviolet           = "#3c2846",
            violet               = "#9A6EB7",
            darkpurple           = "#9A7BDD",
            magenta              = "#D75FAF",
            grey                 = "#808080",
            lightgrey            = "#787878",
            lightlightgrey       = "#4E4E4E",
            silver               = "#3A3A3A",
            lightsilver          = "#303030",

            codeblock            = "#343434",
            disabled             = "#3E3E3E",

            regexp_blue          = "#618EF0",
            regexp_green         = "#46C146",
            regexp_orange        = "#E39232",
            regexp_magenta       = "#FA50E4",
            regexp_brown         = "#A5767D",

            -- Git and diff
            git_fg               = "#EBEAE2",
            git_bg               = "#303030",
            git_added            = "#28A745",
            git_modified         = "#DBAB09",
            git_removed          = "#D73A49",
            diffadd_bg           = "#005F00",
            diffdelete_bg        = "#5F0000",
            difftext_bg          = "#008787",
            diffchange_bg        = "#005F5F",

            -- Spell
            spellbad             = "#330000",
            spellcap             = "#000042",
            spellrare            = "#332C00",
            spelllocal           = "#003B00",

            -- LSP message
            error_fg             = "#DB4B4B",
            warn_fg              = "#E0AF68",
            info_fg              = "#0DB9D7",
            hint_fg              = "#10B981",
            lsp_error_bg         = "#362C3D",
            warn_bg              = "#373640",
            info_bg              = "#2C2C41",
            hint_bg              = "#2E3130",

            -- Todo
            todo_error           = "#D75F66",
            todo_warn            = "#DF7E32",
            todo_info            = "#5082EF",
            todo_hint            = "#4CAB4C",
            todo_default         = "#A070F1",

            -- TeX
            tex_maroon           = "#C9655C",
            tex_olive            = "#BCB677",
            tex_navy             = "#738AE5",
            tex_red              = "#EF5D5B",
            tex_blue             = "#6DA6CF",
            tex_teal             = "#709CAD",
            tex_magenta          = "#E5559D",
            tex_aqua             = "#14BCCF",
            tex_orange           = "#DA854A",
            tex_redorange        = "#F09479",
            tex_darkorange       = "#D28F3F",

            tex_lightpurple      = "#A494C1",
            tex_lightviolet      = "#D7AFC1",
            tex_pink             = "#EF6A72",
            tex_lightgreen       = "#00CA93",

            tex_math             = "#5FAF5F",
            tex_math_delim       = "#BBE67E",
            tex_part_title       = "#9FB866",
            tex_ch_brown         = "#AA7477",
            tex_ch_orange        = "#FFB142",
            tex_ch_green         = "#8CC63E",
            tex_ch_red           = "#F76B68",
            tex_ch_blue          = "#34ACE0",
            tex_keyword          = "#9D79C1",
            tex_verb             = "#94AEAE",
            tex_string           = "#73CEF4",
            tex_tikz_purple      = "#AAA3CD",
            tex_tikz_green       = "#78E08F",
            tex_tikz_orange      = "#E49B5D",
            tex_tikz_navy        = "#9AAAEC",
            tex_tikz_verb        = "#ACACAC",
            tex_quotes           = "#6684C1",
            tex_SI_purple        = "#9787BD",
            tex_SI_orange        = "#E0895D",
            tex_SI_red           = "#DF5F73",
            tex_SI_navy          = "#709DCC",
            tex_SI_green         = "#78E08F",
            tex_SI_magenta       = "#D69CC7",
            tex_SI_yellow        = "#E3C78A",

            tex_group_error      = "#39404C",
            tex_math_error       = "#003300",
            tex_math_delim_error = "#341C00",
            tex_parbox_opt_error = "#462600",
            tex_only_math_error  = "#3D3912",

            -- Ruby
            ruby_maroon          = "#B35257",
            ruby_navy            = "#6A82D9",
            ruby_purple          = "#C596CA",
            ruby_magenta         = "#BE62BD",
            ruby_orange          = "#E6855F",

            -- Lua
            lua_navy             = "#8080BE",
            lua_blue             = "#5DA6D2",

            -- Jinja
            jinja_red            = "#D05858",

            -- Python
            python_blue          = "#3E76A3",

            -- Rust
            rust_green           = "#6CAAA0",

            -- HTML
            tag_navy             = "#668ECC",
        }
    end

    util.colorOverrides(newpaper, config.colors)

    -- Advanced colors
    -- Optional colors
    newpaper.keyword             = newpaper.purple
    newpaper.class               = newpaper.ruby_navy
    newpaper.string              = newpaper.lightblue
    newpaper.accent              = newpaper.blue
    newpaper.comment             = newpaper.lightgrey
    newpaper.doc_comment         = newpaper.tex_verb
    newpaper.link                = newpaper.tag_navy
    newpaper.tag                 = newpaper.tag_navy
    newpaper.boolean             = newpaper.nephritis
    newpaper.text                = newpaper.darkgrey
    newpaper.variable            = newpaper.fg
    newpaper.number              = newpaper.tex_ch_red
    newpaper.none                = "NONE"

    -- Editor
    newpaper.normal_fg           = newpaper.fg
    newpaper.normal_bg           = newpaper.bg
    newpaper.folded_fg           = newpaper.blue
    newpaper.folded_bg           = newpaper.aqua
    newpaper.wildmenu_fg         = newpaper.darkgrey
    newpaper.wildmenu_bg         = newpaper.yellow
    newpaper.pmenu_fg            = newpaper.darkgrey
    newpaper.pmenu_bg            = newpaper.lightlightgrey
    newpaper.selection           = newpaper.blue
    newpaper.cursor              = newpaper.fg
    newpaper.cursor_nr_fg        = newpaper.darkorange
    newpaper.cursor_nr_bg        = newpaper.lightsilver
    newpaper.linenumber_fg       = newpaper.comment
    newpaper.linenumber_bg       = newpaper.lightsilver
    newpaper.msgarea_fg          = newpaper.fg
    newpaper.msgarea_bg          = newpaper.bg
    newpaper.colorcolumn         = newpaper.disabled
    newpaper.border              = newpaper.purple
    newpaper.win_border          = newpaper.grey
    newpaper.win_act_border      = newpaper.violet
    newpaper.highlight           = newpaper.silver
    newpaper.contrast            = newpaper.lightlightgrey
    newpaper.active              = newpaper.silver
    newpaper.title               = newpaper.fg
    newpaper.eob                 = newpaper.disabled
    newpaper.winbar_fg           = newpaper.grey
    newpaper.winbar_bg           = newpaper.bg

    -- Search
    newpaper.search_bg           = newpaper.yellow
    newpaper.search_fg           = newpaper.black

    -- Error message
    newpaper.errormsg_fg         = newpaper.red
    newpaper.errormsg_bg         = newpaper.pink

    -- Tabline
    newpaper.tabline_bg          = newpaper.lightlightgrey
    newpaper.tabline_active_fg   = newpaper.fg
    newpaper.tabline_active_bg   = newpaper.bg
    newpaper.tabline_inactive_fg = newpaper.lightgrey
    newpaper.tabline_inactive_bg = newpaper.silver

    -- Sidebar and float windows
    newpaper.sb_fg               = newpaper.fg
    newpaper.sb_bg               = newpaper.bg
    newpaper.sb_contrast_fg      = newpaper.fg
    newpaper.sb_contrast_bg      = newpaper.silver
    newpaper.float_fg            = newpaper.fg
    newpaper.float_bg            = newpaper.bg
    newpaper.git_sign_bg         = newpaper.git_bg
    newpaper.telescope_fg        = newpaper.fg
    newpaper.telescope_bg        = newpaper.bg
    newpaper.float_contrast      = newpaper.silver
    newpaper.telescope_contrast  = newpaper.silver

    -- Ternminal
    newpaper.term_fg             = newpaper.fg
    newpaper.term_bg             = newpaper.bg
    newpaper.term_fl_fg          = newpaper.fg
    newpaper.term_fl_bg          = newpaper.bg
    newpaper.term_contrast_fg    = newpaper.fg
    newpaper.term_contrast_bg    = newpaper.silver
    newpaper.term_contrast_fl_bg = newpaper.silver
    local term_color = {
        bg                  = { fg = newpaper.normal_fg, bg = newpaper.normal_bg },
        contrast            = { fg = newpaper.term_contrast_fg, bg = newpaper.term_contrast_bg },
        inverse             = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
        inverse_transparent = { fg = newpaper.normal_bg, bg = newpaper.none },
    }
    if config.terminal ~= nil then
        newpaper.term_fg         = term_color[config.terminal].fg
        newpaper.term_bg         = term_color[config.terminal].bg
        newpaper.term_fl_fg      = term_color[config.terminal].fg
        newpaper.term_fl_bg      = term_color[config.terminal].bg
    end

    -- IndentBlankline
    newpaper.contextchar         = newpaper.violet

    -- Sidebars ----------------------------------------------------------------
    newpaper.nvimtree_fg         = newpaper.sb_fg
    newpaper.nvimtree_bg         = newpaper.sb_bg
    newpaper.trouble_fg          = newpaper.sb_fg
    newpaper.trouble_bg          = newpaper.sb_bg
    -- NvimTree
    if util.contains(config.sidebars_contrast, "NvimTree") then
        newpaper.nvimtree_fg     = newpaper.sb_contrast_fg
        newpaper.nvimtree_bg     = newpaper.aqualight
    end
    -- Troule
    if util.contains(config.sidebars_contrast, "Trouble") then
        newpaper.trouble_fg      = newpaper.sb_contrast_fg
        newpaper.trouble_bg      = newpaper.sb_contrast_bg
    end
    ----------------------------------------------------------------------------

    -- Float
    if config.contrast_float then
        newpaper.float_bg        = newpaper.float_contrast
    end

    -- Telescope
    if config.contrast_telescope then
        newpaper.telescope_bg    = newpaper.telescope_contrast
    end

    -- Set transparent background
    if config.disable_background then
        newpaper.normal_bg       = newpaper.none
        newpaper.sb_bg           = newpaper.none
        newpaper.linenumber_bg   = newpaper.none
        newpaper.git_sign_bg     = newpaper.none
        newpaper.msgarea_bg      = newpaper.none
    end

    -- Remove window split borders
    if not config.borders then
        newpaper.win_border = newpaper.bg
    end

    -- Set End of Buffer lines (~)
    if config.hide_eob then
        newpaper.eob = newpaper.bg
    end

    if not config.lsp_virtual_text_bg then
        newpaper.lsp_error_bg = newpaper.none
        newpaper.warn_bg      = newpaper.none
        newpaper.info_bg      = newpaper.none
        newpaper.hint_bg      = newpaper.none
    end

    if config.error_highlight ~= "both" and config.error_highlight ~= "bg" then
        newpaper.spellbad             = newpaper.none
        newpaper.spellcap             = newpaper.none
        newpaper.spelllocal           = newpaper.none
        newpaper.spellrare            = newpaper.none
        newpaper.tex_group_error      = newpaper.none
        newpaper.tex_math_error       = newpaper.none
        newpaper.tex_math_delim_error = newpaper.none
        newpaper.tex_parbox_opt_error = newpaper.none
        newpaper.tex_only_math_error  = newpaper.none
    end

    -- stylua: ignore end

    util.colorOverrides(newpaper, config.colors_advanced)

    return newpaper
end

return M
