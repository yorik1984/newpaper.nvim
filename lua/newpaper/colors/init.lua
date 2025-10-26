local util         = require("newpaper.colors.util")
local check        = require("newpaper.check")
local configModule = require("newpaper.config")
local M            = {}

function M.setup(config)
    local newpaper = {}

    if config.style == "light" then
        newpaper = {
            black                = "#2F2A3D", -- color00
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
            fg                   = "#2F2A3D", -- color15
            bg                   = "#F1F3F2", -- color07

            -- Other colors
            dark_maroon          = "#8C1919",
            redorange            = "#E12D23",
            pink                 = "#FFEEFF",
            lightorange          = "#E4C07A",
            persimona            = "#EF7932",
            yellow               = "#FFFF66",
            darkyellow           = "#C18301",
            olive                = "#5F8700",
            darkengreen          = "#007200",
            ocean                = "#2E8B57",
            nephritis            = "#00AB66",
            bluegreen            = "#1B7F82",
            aqua                 = "#BFD5EC",
            aquadark             = "#AFD7FF",
            aqualight            = "#DFE4EB",
            lightviolet          = "#E5D9F2",
            blueviolet           = "#AF87D7",
            violet               = "#957CC6",
            darkpurple           = "#5823C7",
            magenta              = "#D7005F",
            magenta_bg           = "#FFBBFF",
            grey                 = "#585858",
            lightgrey            = "#878787",
            lightlightgrey       = "#D4D4D4",
            silver               = "#E4E4E4",
            lightsilver          = "#EEEEEE",
            match                = "#E4E4E4",

            codeblock            = "#DEDEDE",
            disabled             = "#C3C3C3",

            regexp_blue          = "#5588FF",
            regexp_brown         = "#884400",
            regexp_green         = "#00AA00",
            regexp_magenta       = "#CC00CC",
            regexp_orange        = "#DD7700",
            regexp_green_bg      = "#E1F0E1",
            regexp_orange_bg     = "#F0F0C8",

            -- Git and diff
            git_fg               = "#413932",
            git_bg               = "#EBEAE2",
            git_added            = "#28A745",
            git_modified         = "#DBAB09",
            git_removed          = "#D73A49",
            git_merged           = "#00909A",
            git_untracked        = "#8F8F8B",
            github_added         = "#1A4D1A",
            github_removed       = "#6B1F1F",
            diffadd              = "#DAFBE1",
            diffadd_accent       = "#ACEEBB",
            diffdelete           = "#FFEBE9",
            diffdelete_accent    = "#FFCECB",
            diffchange           = "#FFE7B7",
            difftext             = "#FFFFD7",

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
            ok_fg                = "#0EA628",
            lsp_error_bg         = "#FDF0F0",
            warn_bg              = "#FDF5EC",
            info_bg              = "#EBF0FD",
            hint_bg              = "#E7F8F2",
            ok_bg                = "#E6F6E9",

            -- Todo
            todo_error           = "#DF0000",
            todo_warn            = "#D75F00",
            todo_info            = "#3A72ED",
            todo_hint            = "#199319",
            todo_default         = "#894DEE",
            todo_test            = "#B748B7",

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
            tex_math_cmd         = "#636D1D",
            tex_math_delim       = "#349279",
            tex_operator         = "#09529B",
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
            jinja_red            = "#B80000",

            -- Python
            python_blue          = "#336D9E",

            --Rust
            rust_green           = "#0B7261",

            -- HTML
            tag_navy             = "#0044AA",

            rainbowred           = "#FF0000",
            rainbowyellow        = "#FDA135",
            rainbowblue          = "#0041FF",
            rainboworange        = "#FF6A00",
            rainbowgreen         = "#28CE00",
            rainbowviolet        = "#7D00E5",
            rainbowcyan          = "#E500E5",

            -- Neovim
            neovim_green         = "#54A23D",

            -- Presets
            text_fg              = "#404040",
            text_bg              = "#F4F4F2",
            text_cursor          = "#E4E4E4",
            text_visual          = "#C2E8FF",
            task_fg              = "#2F2A3D",
            task_bg              = "#F3EEC3",
            task_cursor          = "#F2E3A2",
            task_visual          = "#D9CC91",
        }
    elseif config.style == "dark" then
        newpaper = {
            black                = "#2F2A3D", -- color00
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
            pink                 = "#411616",
            lightorange          = "#443924",
            persimona            = "#E59400",
            yellow               = "#E5E500",
            darkyellow           = "#C6A863",
            olive                = "#8B9240",
            darkengreen          = "#589A58",
            ocean                = "#43A68A",
            nephritis            = "#36C692",
            bluegreen            = "#4BB5B1",
            aqua                 = "#374655",
            aquadark             = "#3C4b64",
            aqualight            = "#2E3032",
            lightviolet          = "#473954",
            blueviolet           = "#3c2846",
            violet               = "#9A6EB7",
            darkpurple           = "#9A7BDD",
            magenta              = "#D75FAF",
            magenta_bg           = "#E5006F",
            grey                 = "#808080",
            lightgrey            = "#787878",
            lightlightgrey       = "#444444",
            silver               = "#3b3b3b",
            lightsilver          = "#363636",
            match                = "#585858",

            codeblock            = "#343434",
            disabled             = "#585858",

            regexp_blue          = "#618EF0",
            regexp_brown         = "#A5767D",
            regexp_green         = "#46C146",
            regexp_magenta       = "#FA50E4",
            regexp_orange        = "#E39232",
            regexp_green_bg      = "#404840",
            regexp_orange_bg     = "#494832",

            -- Git and diff
            git_fg               = "#EBEAE2",
            git_bg               = "#303030",
            git_added            = "#68C17C",
            git_modified         = "#DBAB09",
            git_removed          = "#DF616D",
            git_merged           = "#32A6AE",
            git_untracked        = "#8F8F8B",
            github_added         = "#6ECE6E",
            github_removed       = "#E06C75",
            diffadd              = "#263834",
            diffadd_accent       = "#335D3D",
            diffdelete           = "#352C33",
            diffdelete_accent    = "#7C3B3D",
            diffchange           = "#36362E",
            difftext             = "#505048",

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
            ok_fg                = "#90EE90",
            lsp_error_bg         = "#362C3D",
            warn_bg              = "#373640",
            info_bg              = "#2C2C41",
            hint_bg              = "#2E3130",
            ok_bg                = "#2F3F2F",

            -- Todo
            todo_error           = "#D75F66",
            todo_warn            = "#DF7E32",
            todo_info            = "#5082EF",
            todo_hint            = "#4CAB4C",
            todo_default         = "#A070F1",
            todo_test            = "#E55BE5",

            -- TeX
            tex_maroon           = "#D17475",
            tex_olive            = "#A9A875",
            tex_navy             = "#738AE5",
            tex_red              = "#EF5D5B",
            tex_blue             = "#6DA6CF",
            tex_teal             = "#709CAD",
            tex_magenta          = "#E5559D",
            tex_aqua             = "#14BCCF",
            tex_orange           = "#DA854A",
            tex_redorange        = "#F09479",
            tex_darkorange       = "#D28F3F",

            tex_lightpurple      = "#8E8EBB",
            tex_lightviolet      = "#D7AFC1",
            tex_pink             = "#EF6A72",
            tex_lightgreen       = "#00CA93",

            tex_math             = "#5FAF5F",
            tex_math_cmd         = "#989769",
            tex_math_delim       = "#BBE67E",
            tex_part_title       = "#9FB866",
            tex_operator         = "#6A82D9",
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

            rainbowred           = "#E50000",
            rainbowyellow        = "#FDA135",
            rainbowblue          = "#2F46EA",
            rainboworange        = "#FF6A00",
            rainbowgreen         = "#28CE00",
            rainbowviolet        = "#AE81FF",
            rainbowcyan          = "#E500E5",

            -- Neovim
            neovim_green         = "#87BD77",

            -- Presets
            text_fg              = "#D2CDC7",
            text_bg              = "#232325",
            text_cursor          = "#323234",
            text_visual          = "#4B4B4D",
            task_fg              = "#F3EEC3",
            task_bg              = "#212830",
            task_cursor          = "#36362E",
            task_visual          = "#505048",
        }
    end

    -- Advanced colors

    -- apply HSLuv setting for basic colors
    if config.lightness then
        util.hsluvEdit(newpaper, configModule.hsluv_opt.lightness, config.lightness)
    end

    if config.saturation then
        util.hsluvEdit(newpaper, configModule.hsluv_opt.saturation, config.saturation)
    end

    if check.contains(configModule.greyscale_opt, config.greyscale) then
        util.colorGreyscale(newpaper, config.greyscale)
    end

    util.colorOverrides(newpaper, config.colors)

    -- Optional colors
    newpaper.booleans            = newpaper.nephritis
    newpaper.comments            = newpaper.lightgrey
    newpaper.doc_comments        = newpaper.tex_verb
    newpaper.keywords            = newpaper.purple
    newpaper.links               = newpaper.tag_navy
    newpaper.numbers             = newpaper.tex_ch_red
    newpaper.strings             = newpaper.lightblue
    newpaper.tags                = newpaper.tag_navy
    newpaper.texts               = newpaper.darkgrey
    newpaper.variables           = newpaper.fg
    newpaper.none                = "NONE"

    -- Editor
    newpaper.accent              = newpaper.blue
    newpaper.active              = newpaper.silver
    newpaper.borders             = newpaper.purple
    newpaper.colorcol            = newpaper.silver
    newpaper.contrast            = newpaper.lightlightgrey
    newpaper.cursor              = newpaper.fg
    newpaper.cursor_nr_bg        = newpaper.lightsilver
    newpaper.cursor_nr_fg        = newpaper.darkorange
    newpaper.eob                 = newpaper.disabled
    newpaper.folded_bg           = newpaper.aqua
    newpaper.folded_fg           = newpaper.blue
    newpaper.linenumber_bg       = newpaper.lightsilver
    newpaper.linenumber_fg       = newpaper.comments
    newpaper.msgarea_bg          = newpaper.bg
    newpaper.msgarea_fg          = newpaper.fg
    newpaper.normal_bg           = newpaper.bg
    newpaper.normal_fg           = newpaper.fg
    newpaper.pmenu_bg            = newpaper.lightlightgrey
    newpaper.pmenu_fg            = newpaper.darkgrey
    newpaper.pmenu_sel           = newpaper.aquadark
    newpaper.selection           = newpaper.blue
    newpaper.titles              = newpaper.fg
    newpaper.wildmenu_bg         = newpaper.yellow
    newpaper.wildmenu_fg         = newpaper.darkgrey
    newpaper.win_act_border      = newpaper.violet
    newpaper.win_border          = newpaper.grey
    newpaper.winbar_bg           = newpaper.bg
    newpaper.winbar_fg           = newpaper.grey

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
    newpaper.float_contrast      = newpaper.silver
    ----------------------------------------------------------------------------

    -- Terminal
    newpaper.term_fg             = newpaper.fg
    newpaper.term_bg             = newpaper.bg
    newpaper.term_fl_fg          = newpaper.fg
    newpaper.term_fl_bg          = newpaper.bg
    newpaper.term_contrast_fg    = newpaper.fg
    newpaper.term_contrast_bg    = newpaper.silver
    newpaper.term_contrast_fl_bg = newpaper.silver

    local term_color             = {
        bg                  = { fg = newpaper.normal_fg, bg = newpaper.normal_bg },
        contrast            = { fg = newpaper.term_contrast_fg, bg = newpaper.term_contrast_bg },
        inverse             = { fg = newpaper.normal_bg, bg = newpaper.normal_fg },
        inverse_transparent = { fg = newpaper.normal_bg, bg = newpaper.none },
    }
    if config.terminal ~= nil then
        newpaper.term_fg    = term_color[config.terminal].fg
        newpaper.term_bg    = term_color[config.terminal].bg
        newpaper.term_fl_fg = term_color[config.terminal].fg
        newpaper.term_fl_bg = term_color[config.terminal].bg
    end
    ----------------------------------------------------------------------------

    -- PLugins -----------------------------------------------------------------
    -- Git Signs
    newpaper.git_sign_bg = newpaper.linenumber_bg

    -- IndentBlankline
    newpaper.contextchar = newpaper.violet

    -- NvimTree
    newpaper.nvimtree_fg = newpaper.sb_fg
    newpaper.nvimtree_bg = newpaper.sb_bg
    if check.contains(config.sidebars_contrast, "NvimTree") then
        newpaper.nvimtree_fg = newpaper.sb_contrast_fg
        newpaper.nvimtree_bg = newpaper.aqualight
    end

    -- Trouble
    newpaper.trouble_fg = newpaper.sb_fg
    newpaper.trouble_bg = newpaper.sb_bg
    if check.contains(config.sidebars_contrast, "trouble") then
        newpaper.trouble_fg = newpaper.sb_contrast_fg
        newpaper.trouble_bg = newpaper.sb_contrast_bg
    end

    -- Telescope
    newpaper.telescope_fg       = newpaper.fg
    newpaper.telescope_bg       = newpaper.bg
    newpaper.telescope_contrast = newpaper.silver
    if config.contrast_telescope then
        newpaper.telescope_bg = newpaper.telescope_contrast
    end
    ----------------------------------------------------------------------------

    -- Float
    if config.contrast_float then
        newpaper.float_bg = newpaper.float_contrast
    end

    -- Set transparent background
    if config.disable_background then
        newpaper.normal_bg     = newpaper.none
        newpaper.sb_bg         = newpaper.none
        newpaper.linenumber_bg = newpaper.none
        newpaper.git_sign_bg   = newpaper.none
        newpaper.msgarea_bg    = newpaper.none
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

    if not config.regex_bg then
        newpaper.regexp_green_bg  = newpaper.none
        newpaper.regexp_orange_bg = newpaper.none
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
    ----------------------------------------------------------------------------

    -- Diff highlight
    newpaper.diffadd_fg           = newpaper.github_added
    newpaper.diffdelete_fg        = newpaper.github_removed
    newpaper.diffchange_fg        = newpaper.git_fg
    newpaper.difftext_fg          = newpaper.git_fg
    newpaper.diffadd_bg           = newpaper.diffadd
    newpaper.diffadd_accent_bg    = newpaper.diffadd_accent
    newpaper.diffdelete_bg        = newpaper.diffdelete
    newpaper.diffdelete_accent_bg = newpaper.diffdelete_accent
    newpaper.diffchange_bg        = newpaper.diffchange
    newpaper.difftext_bg          = newpaper.difftext

    if config.diff_highlight == "bg" then
        newpaper.diffadd_fg    = newpaper.none
        newpaper.diffdelete_fg = newpaper.none
        newpaper.diffchange_fg = newpaper.none
        newpaper.difftext_fg   = newpaper.none
    end

    if config.diff_highlight == "fg" then
        newpaper.diffadd_fg           = newpaper.git_added
        newpaper.diffdelete_fg        = newpaper.git_removed
        newpaper.diffchange_fg        = newpaper.git_modified
        newpaper.difftext_fg          = newpaper.tex_olive
        newpaper.diffadd_bg           = newpaper.none
        newpaper.diffadd_accent_bg    = newpaper.none
        newpaper.diffdelete_bg        = newpaper.none
        newpaper.diffdelete_accent_bg = newpaper.none
        newpaper.diffchange_bg        = newpaper.none
        newpaper.difftext_bg          = newpaper.none
    end
    ----------------------------------------------------------------------------

    -- Presets colors
    newpaper.text_linenumber_fg  = newpaper.disabled
    newpaper.text_cursor_nr_fg   = newpaper.linenumber_fg
    newpaper.text_cursor_nr_bg   = newpaper.none
    newpaper.text_cursor_fold_bg = newpaper.none
    newpaper.text_cursor_sign_bg = newpaper.none

    newpaper.task_linenumber_fg  = newpaper.disabled
    newpaper.task_cursor_nr_fg   = newpaper.linenumber_fg
    newpaper.task_cursor_nr_bg   = newpaper.none
    newpaper.task_cursor_fold_bg = newpaper.none
    newpaper.task_cursor_sign_bg = newpaper.none
    ----------------------------------------------------------------------------

    if config.colors_advanced then
        util.colorOverrides(newpaper, config.colors_advanced)
    end
    M.colors = newpaper
    return newpaper
end

function M.get_colors()
    return M.colors
end

return M
