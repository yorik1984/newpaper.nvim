<h3 align="center">
    <img src="https://raw.githubusercontent.com/new-paper/newpaper/main/assets/logo/logo-newpaper.png" width="400" alt="Logo"/><br/>
    <a href="https://github.com/new-paper/newpaper">Newpaper</a> for <a href="https://neovim.io/">Neovim</a>
</h3>

<div align="center">

# 🎨 newpaper.nvim

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
</div>

## ℹ️ Info

A fork of [material.nvim](https://github.com/marko-cerovac/material.nvim) colorscheme for Neovim using [Papercolor](https://github.com/NLKNguyen/papercolor-theme) color palette with small changes written in Lua. $\LaTeX$ syntax highlight get from [sublime-writing-color-scheme](https://github.com/kmisiunas/sublime-writing-color-scheme).

`newpaper.nvim` is meant to be a fast and modern colorscheme written in Lua that supports a lot of the new features added to Neovim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter).

### Light

<div align="center">
<p align="center">
    <img src="https://raw.githubusercontent.com/new-paper/newpaper/main/assets/palette/newpaper_light.svg"/>
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/nvim_preview_light.png">
</p>
</div>

### Dark

<div align="center">
<p align="center">
    <img src="https://raw.githubusercontent.com/new-paper/newpaper/main/assets/palette/newpaper_dark.svg"/>
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/nvim_preview_dark.png">
</p>
</div>

<div align="center">

## [More screenshots](#-screenshots)[🖼️](#-screenshots)

</div>

## 🌟 Features

+ Two styles to choose from:
  + Light
  + Dark
+ Lualine theme
+ Ability to change background on sidebar windows like NvimTree, terminal etc.
+ Asynchronous highlight loading which makes the theme extremely fast
+ Added functions for live theme switching without the need to restart Neovim
+ Extra syntax highlight and extends [treesitter queries](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights) for some grammars.
+ [Extras](#extras) colors configs for terminal-based and GUI application.
+ [lsp-semantic-highlight](https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight)
+ Support regex highlight with treesitter. Colors pick from [regexr.com](https://regexr.com).

### Extra syntax highlights

| Language            | Core syntax        | [Treesitter queries](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights) | Extra plugins | Preview  | Code example |
| :-------------------| :----------------: | :----------------: | :------------ | :------: | :----------- |
| **$\LaTeX$** :thumbsup: | :heavy_check_mark: | :heavy_check_mark: | :white_check_mark: [vimtex](https://github.com/lervag/vimtex) | | |
| **Comment** :thumbsup:  | :x:                | :white_check_mark: | :x: | [🖼️](#comment-todo) | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/lua/todo-comments.lua) |
| **Gitignore**           | :x:                | :white_check_mark: | :x: | | |
| **HTML**                | :heavy_check_mark: | :white_check_mark: | :x: | | |
| **Jinja**               | :heavy_check_mark: | :x:                | :white_check_mark: [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax) | | |
| **Json**                | :heavy_check_mark: | :white_check_mark: | :x: | | |
| **Liquid**              | :heavy_check_mark: | :white_check_mark: | :x: | | |
| **Lua** :thumbsup:      | :heavy_check_mark: | :white_check_mark: | :heavy_check_mark: [vim-lua](https://github.com/tbastos/vim-lua) | [🖼️](#lua) | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/lua/code.lua)|
| **Luadoc** :thumbsup:   | :x:                | :white_check_mark: | :x: | | |
| **Luap** :thumbsup:     | :x:                | :white_check_mark: | :x: | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/luap/luap.lua) |
| **Luau**                | :x:                | :white_check_mark: | :x: | | |
| **Markdown** :thumbsup: | :heavy_check_mark: | :white_check_mark: | :heavy_check_mark: [vim-markdown](https://github.com/preservim/vim-markdown) | [🖼️](#markdown) | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/markdown/code.md) |
| **Pandoc** :thumbsup:   | :heavy_check_mark: | :x:                | :white_check_mark: [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax) | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/markdown/code.md) |
| **Python**              | :x:                | :white_check_mark: | :x: | | |
| **Query**               | :x:                | :white_check_mark: | :x: | | |
| **Rbs** :thumbsup:      | :x:                | :white_check_mark: | :heavy_check_mark: [vim-rbs](https://github.com/jlcrochet/vim-rbs) | | |
| **Regex** :thumbsup:    | :x:                | :white_check_mark: | :x: | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/regex/code_regex.scm) |
| **Ruby** :thumbsup:     | :heavy_check_mark: | :white_check_mark: | :heavy_check_mark: [vim-ruby](https://github.com/vim-ruby/vim-ruby) | [🖼️](#ruby) | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/ruby/code.rb) |
| **Rust**                | :heavy_check_mark: | :white_check_mark: | :x: | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/rust/code.rs) |
| **TOML**                | :heavy_check_mark: | :white_check_mark: | :x: | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/toml/code.toml) |
| **Vim**                 | :heavy_check_mark: | :white_check_mark: | :x: | | |
| **Vimdoc**              | :heavy_check_mark: | :white_check_mark: | :x: | | |
| **YAML**                | :heavy_check_mark: | :white_check_mark: | :x: | | [raw code](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/yaml/code.yaml) |

:thumbsup: - detailed, :white_check_mark: - support and recomended  as default, :heavy_check_mark: - support, :x: - not support

### 🔌 Supported plugins

+ [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
+ [cheatsheet.nvim](https://github.com/sudormrfbin/cheatsheet.nvim)
+ [Dashboard](https://github.com/nvimdev/dashboard-nvim)
+ [flash.nvim](https://github.com/folke/flash.nvim)
+ [fugitive](https://github.com/tpope/vim-fugitive)
+ [Git Gutter](https://github.com/airblade/vim-gitgutter)
+ [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
+ [git-messenger](https://github.com/rhysd/git-messenger.vim)
+ [glyph-palette.vim](https://github.com/lambdalisue/glyph-palette.vim)
+ [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim)
+ [highlight-undo.nvim](https://github.com/tzachar/highlight-undo.nvim)
+ [lazy.nvim](https://github.com/folke/lazy.nvim)
+ [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) with extras for [light](https://raw.githubusercontent.com/new-paper/lazygit/main/themes/newpaper_light.yml)[🖼️](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/plugins/lazygit/lazygit_neovim_light.png) or [dark](https://raw.githubusercontent.com/new-paper/lazygit/main/themes/newpaper_dark.yml)[🖼️](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/plugins/lazygit/lazygit_neovim_dark.png) background.
+ [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
+ [litee.nvim](https://github.com/ldelossa/litee.nvim)
+ [LSP Diagnostics](https://neovim.io/doc/user/lsp.html) with colors from [lsp-colors](https://github.com/folke/lsp-colors.nvim)
+ [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
+ [Lualine](https://github.com/nvim-lualine/lualine.nvim)[🖼️](#-screenshots-lualine)
+ [mason.nvim](https://github.com/williamboman/mason.nvim)
+ [mini.nvim](https://github.com/echasnovski/mini.nvim)
+ [Neogit](https://github.com/TimUntersberger/neogit)
+ [noice.nvim](https://github.com/folke/noice.nvim)
+ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
+ [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
+ [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
+ [nvim-dap](https://github.com/mfussenegger/nvim-dap)
+ [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
+ [nvim-notify](https://github.com/rcarriga/nvim-notify)
+ [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
+ [Nvim-Tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
+ [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
+ [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
+ [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
+ [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
+ [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)[🖼️](#todo-commentsnvim)
+ [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
+ [trim.nvim](https://github.com/cappyzawa/trim.nvim)
+ [Trouble](https://github.com/folke/trouble.nvim)
+ [vim-illuminate](https://github.com/RRethy/vim-illuminate)
+ [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
+ [vim-LanguageTool](https://github.com/dpelle/vim-LanguageTool)
+ [vim-lua](https://github.com/tbastos/vim-lua)
+ [vim-rbs](https://github.com/jlcrochet/vim-rbs)
+ [vim-ruby](https://github.com/vim-ruby/vim-ruby)
+ [vim-sneak](https://github.com/justinmk/vim-sneak)
+ [vim-toml](https://github.com/cespare/vim-toml)
+ [vimtex](https://github.com/lervag/vimtex)
+ [virt-column.nvim](https://github.com/lukas-reineke/virt-column.nvim)
+ [vista.vim](https://github.com/liuchengxu/vista.vim)
+ [WhichKey.nvim](https://github.com/folke/which-key.nvim)
+ [zotcite](https://github.com/jalvesaq/zotcite)

## ⚡️ Requirements

+ Neovim >= 0.8

## 📦 Installation

Install via your favorite package manager:

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
require("lazy").setup({
    "yorik1984/newpaper.nvim",
    priority = 1000,
    config = true,
})
```

## ⚙️ Configuration

+ There are 2 different styles available:
  + dark
  + light

Set the desired style using:

```vim
" init.vim
lua << EOF
    require("newpaper").setup({
        style = "dark"
    })
EOF
```

```lua
-- Lua:
vim.g.newpaper_style = "dark"
require("newpaper").setup()

-- OR better
require("newpaper").setup({
    style = "dark"
})
```

### 💻 Commands

| Command          | Description                            |
| ---------------- | -------------------------------------- |
| `:NewpaperLight` | Change style to light mode(by default) |
| `:NewpaperDark`  | Change style to dark mode              |

### Available options

| Option              | Default       | Description |
| ------------------- | ------------- | ------------|
| style               | `"light"`     | The theme comes in two styles:`"dark"`, `"light"` |
| lightness           | `0`           | Make all supported highlight groups lighter or darker. Useful with `saturation` to make more beauty and eye-friendly view. Value: from `-1`(all colors `"#000000"`) to `1`(all colors `"#FFFFFF"`). Recommended value: `-0.2` - `0.2` |
| saturation          | `0`           | Change color saturation of all supported highlight groups. Useful with `lightness` to make more beauty and eye-friendly view. Value: from `-1` to `1`. Recommended value: `-0.2` - `0.2` |
| greyscale           | `false`       | Make all supported highlight groups in greyscale palette. Useful with `lightness` and `saturation` to make more beauty and eye-friendly view. Value: `"lightness"`, `"average"`, `"luminosity"`, `false`. Recommended greyscale value: `"luminosity"`|
| editor_better_view  | `true`        | Make some interface like menu, title of editor and plugins menu bold and italic |
| terminal            | `"contrast"`  | Make `:terminal`buffers and windows  in different styles. Value:`"bg"`, `"contrast"`, `"inverse"`, `"inverse_transparent"` |
| sidebars_contrast   | `{}`          | Set a contrast background on sidebar-like windows. Example: `{ "NvimTree", "vista_kind", "Trouble" }`. `"NvimTree"` and `"Trouble"` groups has own highlight colors. Can be overridden separate from others sidebars |
| contrast_float      | `true`        | Make popup menus like nvim-cmp, lsp-saga have a different foreground and background |
| contrast_telescope  | `true`        | Make Telescope have a different foreground and background |
| operators_bold      | `true`        | Make booleans, escape characters, operators like `=`, `/`, `*`, `+`, `-`, `&`, `%`, `#`, `~`, `<`, `>`, `|` etc bold |
| delimiters_bold     | `false`       | Make delimiter `,`,`;`,`:`,`.` bold |
| brackets_bold       | `false`       | Make brackets like `{}`, `()`, `[]` bold |
| delim_rainbow_bold  | `false`       | Make rainbow delimiters like `{}`, `()`, `[]` or others bold. Use specific plugin to highlight like [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) |
| booleans            | `"bold"`      | Make booleans like `true`, `false` etc. bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| keywords            | `"bold"`      | Make keywords like `if`, `for`, `while` etc. bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| doc_keywords        | `"bold,italic"` |  Make documenting keywords like `@param`, `@return` etc. bold, italic or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"`. Only support for: [treesitter-luadoc](https://github.com/amaanq/tree-sitter-luadoc) |
| regex               | `"bold"`      | Make regex  bold, italic or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| regex_bg            | `true`        | Enable background color for regex capturing groups |
| tags                | `"bold"`      | Make HTML tag bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| tags_brackets_bold  | `true`        | Make tags delimiters like `<` or `/>` bold |
| tex_major           | `"bold"`      | Make only major tex word like`\documentclass`, `\section`, … bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"`. Work only with [vimtex](https://github.com/lervag/vimtex) |
| tex_operators_bold  | `"true"`      | Make tex operators bold |
| tex_brackets_bold   | `"false"`     | Make tex brackets like `{}`, `[]` bold |
| tex_math_delim_bold | `"false"`     | Make tex math delimiters like `\[\]`, `\(\)`, `$ $`, `$$ $$` bold |
| tex_keywords        | `"NONE"`      | Make other tex keywords bold, italic or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| tex_zone            | `"italic"`    | Make some tex `...Zone...` bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| tex_arg             | `"italic"`    | Make some tex `...Arg...` bold, italic, or NONE. Value: `"bold"`, `"italic"`, `"bold,italic"`, `"NONE"` |
| error_highlight     | `"undercurl"` | Make spell or `tex`-files errors highlighting with background, undercurl, both or NONE. Value: `"bg"`, `"undercurl"`, `"both"`, `"NONE"` |
| italic_strings      | `true`        | Make strings italic |
| italic_comments     | `true`        | Make comments italic |
| italic_doc_comments | `true`        | Make comments documenting code italic |
| italic_functions    | `false`       | Make function calls and names italic |
| italic_variables    | `false`       | Make variable names and identifiers italic |
| borders             | `true`        | Enable the border between vertically split windows visible |
| disable_background  | `false`       | Disable the setting of background color so that Neovim can use your terminal background |
| lsp_virtual_text_bg | `true`        | Enable background color for LSP virtual text |
| hide_eob            | `false`       | Hide the end of buffer lines (`~`) |
| colors              | `{}`          | Override the default colors and use your own. Also, override lualine colors if you have same name for more good view. See possible value in sorce code [`colors.lua[12:189]`](https://github.com/yorik1984/newpaper.nvim/blob/main/lua/newpaper/colors.lua#L12-L189) and [`colors.lua[193:370]`](https://github.com/yorik1984/newpaper.nvim/blob/main/lua/newpaper/colors.lua#L193-L370) |
| colors_advanced     | `{}`          | Override the advanced default colors and use your own. See possible value in source code [`colors.lua[392:556]`](https://github.com/yorik1984/newpaper.nvim/blob/main/lua/newpaper/colors.lua#L392-L556) |
| custom_highlights   | `{}`          | Override the default and plugins highlights groups. Table  predefine any syntax colors. Use `fg`,`bg`, `sp`, `style` style options. `fg => guifg`, `bg => guibg`, `sp => guisp`, `style => gui`.  See above |
| lualine_bold        | `true`        | When true, section headers in the lualine theme will be bold |
| lualine_style       | `"light"`     | Set different style from main theme:`"dark"`, `"light"`|
| devicons_custom     | `{}`          | Set devicons custom color(override all icons by one color). Use `gui`, `cterm` or both options: `gui = "#HEX_COLOR"`, `cterm = NUMBER` |

### Colorscheme default settings

```lua
-- Default settings
require("newpaper").setup({
    style               = "light",
    lightness           = 0,
    saturation          = 0,
    greyscale           = false,
    editor_better_view  = true,
    terminal            = "contrast",
    sidebars_contrast   = {},
    contrast_float      = true,
    contrast_telescope  = true,
    operators_bold      = true,
    delimiters_bold     = false,
    brackets_bold       = false,
    delim_rainbow_bold  = false,
    booleans            = "bold",
    keywords            = "bold",
    regex               = "bold",
    regex_bg            = true,
    tags                = "bold",
    tags_brackets_bold  = true,
    tex_major           = "bold",
    tex_operators_bold  = true,
    tex_brackets_bold   = false,
    tex_math_delim_bold = false,
    tex_keywords        = "NONE",
    tex_zone            = "italic",
    tex_arg             = "italic",
    error_highlight     = "undercurl",
    italic_strings      = true,
    italic_comments     = true,
    italic_doc_comments = true,
    italic_functions    = false,
    italic_variables    = false,
    borders             = true,
    disable_background  = false,
    lsp_virtual_text_bg = true,
    hide_eob            = false,
    colors              = {},
    colors_advanced     = {},
    custom_highlights   = {},
    lualine_bold        = true,
    lualine_style       = "light",
    devicons_custom     = {},
})
```

### Colorscheme customizing

```lua
-- Example config in lua with global variables
vim.g.newpaper_style             = "dark"
vim.g.newpaper_keywords          = "italic"
vim.g.newpaper_borders           = false
vim.g.newpaper_colors            = { teal = "#0000FF" }
vim.g.newpaper_colors_advanced   = { keyword = "#AA00AA", string = "#008800" }
vim.g.newpaper_custom_highlights = {
    Float     = { fg = vim.g.newpaper_colors.teal },
    Number    = { fg = "#00FF00" },
    rubyClass = { fg = "#00FFF0" },
    Comment   = { fg = "#FF0000", style = "italic,underline" }
}
require("newpaper").setup()

-- OR better with user configuration
local colors            = { teal = "#0000FF" } -- use one color for many groups
local colors_advanced   = { keyword = "#AA00AA", string = "#008800" }
local custom_highlights = {
    Float     = { fg = colors.teal }, -- prefer override by name
    Number    = { fg = "#00FF00" },   -- but hex colos also good
    rubyClass = { fg = "#00FFF0" },
    Comment   = { fg = "#FF0000", style = "italic,underline" },
}
require("newpaper").setup({
    style    = "dark",
    keywords = "italic",
    -- ...
    colors              = colors,
    colors_advanced     = colors_advanced,
    custom_highlights   = custom_highlights,
    -- ...
    devicons_custom     = { gui = "#FFFF00", cterm = 3},
})
```

```vim
" init.vim
lua << EOF
    require("newpaper").setup({
        style    = "dark",
        keywords = "italic",
        borders  = false,
        colors   = { black = "#000000", bg = "#0F111A" }
    })
EOF
```

### ⚠️`guicursor` customizing

```lua
-- guicursor advansed settigs:
-- colorsheme predefine colors for various cursors type:
{
    Cursor       = { fg = newpaper.bg, bg = newpaper.cursor },     -- Character under the cursor
    nCursor      = { fg = newpaper.bg, bg = newpaper.teal },       -- Normal mode
    vCursor      = { fg = newpaper.bg, bg = newpaper.purple },     -- Visual mode
    veCursor     = { fg = newpaper.bg, bg = newpaper.darkpurple }, -- Visual mode with "selection" "exclusive" (same as "v", if not specified)
    oCursor      = { fg = newpaper.bg, bg = newpaper.navy },       -- Operator-pending mode
    iCursor      = { fg = newpaper.bg, bg = newpaper.green },      -- Insert mode
    rCursor      = { fg = newpaper.bg, bg = newpaper.magenta },    -- Replace mode
    cCursor      = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Normal (append) mode
    ciCursor     = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Insert mode
    crCursor     = { fg = newpaper.bg, bg = newpaper.darkorange }, -- Command-line Replace mode
    smCursor     = { fg = newpaper.bg, bg = newpaper.yellow },     -- showmatch in Insert mode
    TermCursor   = { fg = newpaper.bg, bg = newpaper.cursor },     -- active cursor in terminal
    TermCursorNC = { fg = newpaper.bg, bg = newpaper.lightgrey },  -- inactive cursor in terminal
}
-- This colors cam be using or overriding by own colors. See above.

-- init.lua example
vim.o.guicursor = "n:block-nCursor,v:block-vCursor,i:ver25-iCursor,r:hor25-rCursor,c:ver25-cCursor"
```

For more information see in `:h guicursor`

## 🎨 [Lualine](https://github.com/nvim-lualine/lualine.nvim) theme

Enable the `newpaper` theme for `Lualine`:

```lua
require("lualine").setup({
    options = {
        -- ... your lualine config
    },
    -- example config of sections
    sections = {
        lualine_b = {
            {
                "diff",
                diff_color = {
                -- specific colors from theme with bg color of section
                    added    = "GitSignsAdd",
                    modified = "GitSignsChange",
                    removed  = "GitSignsDelete",
                },
                symbols = {
                    added    = " ",
                    modified = " ",
                    removed  = " ",
                },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                -- specific colors from theme with bg color of section
                    error = "LualineDiagnosticError",
                    warn  = "LualineDiagnosticWarn",
                    info  = "LualineDiagnosticInfo",
                    hint  = "LualineDiagnosticHint",
                },
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
        },
    }
})
```

Lualine theme name and style automatically using from main theme

### ⚙️ Hint

You can temporally use just only lualine theme with any others colorschemes. It also depends on `vim.o.background`.

```lua
-- Set bold style
vim.g.newpaper_lualine_bold = true
-- If you want to enable style like in main colorscheme no need to set style of lualine
vim.g.newpaper_lualine_style = "light"
-- Also you can predefine colors
vim.g.newpaper_colors        = { teal = "#008080" }

-- disable main theme
-- require("newpaper").setup()

-- enable other colorscheme
-- ...
```

⚠️ More recommended configuration here:
[yorik1984/lualine-theme.nvim](https://github.com/yorik1984/lualine-theme.nvim#%EF%B8%8F-configuration)

### 📺 Screenshots lualine

#### light

![newpaper-light-normal](https://user-images.githubusercontent.com/1559192/129404790-1cf23fab-7828-48c2-b704-32c65af0af22.png)
![newpaper-light-insert](https://user-images.githubusercontent.com/1559192/129404788-9d67bca5-fca0-4529-aa3c-4fbf63910059.png)
![newpaper-light-visual](https://user-images.githubusercontent.com/1559192/129404794-b9ac2cab-14b4-4737-948a-679fc9c5ec02.png)
![newpaper-light-v_line](https://user-images.githubusercontent.com/1559192/129404793-b2808010-66ae-43aa-b643-685e263609a6.png)
![newpaper-light-replace](https://user-images.githubusercontent.com/1559192/129404792-3d698007-654b-4905-b01a-39e9b54a4b6f.png)
![newpaper-light-command](https://user-images.githubusercontent.com/1559192/129404785-7179d4dd-66e6-4a71-8135-fcf1cee67e8c.png)

#### dark

![newpaper-dark-normal](https://user-images.githubusercontent.com/1559192/129481063-7f6651b5-2fe3-47f9-b522-5829105a43f3.png)
![newpaper-dark-insert](https://user-images.githubusercontent.com/1559192/129481065-f078c808-dbce-4ff2-a4cb-898d0e8dc750.png)
![newpaper-dark-visual](https://user-images.githubusercontent.com/1559192/129481072-f1e0169d-b892-410d-9f24-7322a214e6a2.png)
![newpaper-dark-v_line](https://user-images.githubusercontent.com/1559192/129481081-c778d476-2c1d-4bb0-8904-26a6e3b0faa0.png)
![newpaper-dark-v_block](https://user-images.githubusercontent.com/1559192/129481085-89b8eb24-e8d5-456a-b29b-31a5fc5f6a60.png)
![newpaper-dark-replace](https://user-images.githubusercontent.com/1559192/129481091-a196dcfc-4c4d-4ccb-8069-f9f3443ab36e.png)
![newpaper-dark-command](https://user-images.githubusercontent.com/1559192/129481093-40a09545-327c-4101-9727-fd3234509c78.png)

## 📺 Screenshots

### 🎼 Languages

#### RUBY

Source code [HERE](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/ruby/code.rb)

**Treesitter**

![treesitter](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/ruby/treesitter.png)

**vim-ruby**

![vim-ruby](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/ruby/vim-ruby.png)

#### LUA

Source code [HERE](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/lua/code.lua)

**Treesitter** 
![treesitter](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/lua/treesitter.png)

**vim-lua**
![vim-lua](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/lua/vim_lua.png)

#### MARKDOWN

Source code [HERE](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/markdown/code.md)

**vim and Treesitter** 
![treesitter](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/markdown/all.png)

#### COMMENT-TODO

Source code [HERE](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/lua/todo-comments.lua)

**Treesitter** 
![treesitter](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/syntax/comment/treesitter.png)

### 🎛️ Plugins

#### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

Source code [HERE](https://raw.githubusercontent.com/new-paper/newpaper/main/code-samples/markdown/code.md)

![todo-comments](https://raw.githubusercontent.com/new-paper/newpaper/main/assets/previews/nvim/plugins/todo-comments/todo-comments.png)

##### Example config:

```lua
{
    keywords = {
        FIX =  { icon = "", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" } },
        TODO = { icon = "", alt = { "WIP" } },
        HACK = { icon = "" },
        WARN = { icon = "" },
        PERF = { icon = "" },
        NOTE = { icon = "󰎞", alt = { "INFO", "DOCS" } },
        TEST = { icon = "" },
    },
    highlight = {
        multiline = true,
        keyword   = "bg",
        after     = "fg",
    },
}
```

## ❔ FAQ

For a complete guide on usage and Configuration of the theme, see `:help newpaper.nvim`.

## Extras

[Extra](https://github.com/new-paper/newpaper#-ports) config with newpaper-based color palette for some terminal and GUI application.
+ [lazygit](https://github.com/new-paper/lazygit#-features)
+ [Windows Terminal](https://github.com/new-paper/windows-terminal#-features)

## ©️ Credits

+ [onedark.nvim](https://github.com/ful1e5/onedark.nvim) ⚡
+ [sublime-writing-color-scheme](https://github.com/kmisiunas/sublime-writing-color-scheme)
+ [material.nvim](https://github.com/marko-cerovac/material.nvim)
+ [vimtex](https://github.com/lervag/vimtex)
+ [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
+ [papercolor-theme](https://github.com/NLKNguyen/papercolor-theme)
+ [vim-shoot](https://github.com/JMcKiern/vim-shoot) -- generate HTML version of highlighting
+ [toml](https://github.com/toml-lang/toml) -- spec and code preview example
+ [yaml](https://github.com/yaml/yaml-spec) -- spec and code preview example
+ [catppuccin](https://github.com/catppuccin) -- community-driven pastel theme
+ thanks to [lukas-reineke](https://github.com/lukas-reineke) for inspired by good documentation style

## 🛠️ TODO

* [x] Add dark style
* [ ] Add syntax screenshots:
  * [x] Ruby
  * [x] Lua
  * [x] TOML
  * [x] YAML
  * [x] Markdown
    * [x] Pandoc
  * [ ] LaTeX
  * [ ] HTML
  * [ ] Python
  * [ ] COBOL
* [ ] Add plugins screenshots:
  * [x] todo-comments.nvim
  * [ ] LSP Diagnostics
  * [ ] Lsp Saga
  * [ ] nvim-cmp
  * [ ] Trouble
  * [ ] Telescope.nvim
  * [ ] NvimTree.lua
  * [ ] WhichKey.nvim
  * [ ] lazy.nvim
* [-] Add extra syntax highlights:
  * [x] $\LaTeX$ 
  * [x] Ruby
  * [x] Lua
  * [x] TOML
  * [x] YAML
  * [x] Jinja
  * [x] regex with treesitter
  * [x] query with treesitter
  * [x] Markdown
    * [x] Pandoc
  * [x] HTML
  * [ ] COBOL
  * [x] Python
  * [x] Rust
* [ ] Add plugins support:
  * [ ] [plaintasks.vim](https://github.com/elentok/plaintasks.vim)
  * [ ] [Nvim-R](https://github.com/jalvesaq/Nvim-R)
  * [ ] [i3config.vim](https://github.com/mboughaba/i3config.vim)
