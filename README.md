# 🎨 newpaper.nvim

###  W.I.P.🚧

### ℹ️ Info
A fork of [material.nvim](https://github.com/marko-cerovac/material.nvim) colorscheme for NeoVim using [Papercolor](NLKNguyen/papercolor-theme) color palette with small changes written in Lua. LaTeX and Markdown syntax highlight get from [sublime-writing-color-scheme](https://github.com/kmisiunas/sublime-writing-color-scheme).

Newpaper.nvim is meant to be a fast and modern colorscheme written in Lua that supports a lot of the new features added to NeoVim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter).

![vim-ruby_light_code rb-preview](https://user-images.githubusercontent.com/1559192/140774084-d3978598-f1cb-45f3-9fb4-32ddbfe9287e.png)

[More screenshots](#--screenshots)

### 🌟 Features

+ 2 styles to choose from:
    + Light
    + Dark
+ Lualine theme
+ Ability to change background on sidebar-like windows like Nvim-Tree, Packer, terminal etc.
+ Asynchronous highlight loading which makes the theme extremely fast
+ Added functions for live theme switching without the need to restart NeoVim
+ Special syntax highlight:
    - L<big><sup>A</sup></big>T<big><sub>E</sub></big>X with [vimtex](https://github.com/lervag/vimtex)
    - Ruby with [vim-ruby](https://github.com/vim-ruby/vim-ruby) - [🖼️](#RUBY)
    - Jinja with [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
    - TOML with [vim-toml](https://github.com/cespare/vim-toml)
    - Lua with [vim-lua](https://github.com/tbastos/vim-lua)

 ###  🔌 Supported plugins:

+ [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
+ [LSP Diagnostics](https://neovim.io/doc/user/lsp.html) with colors from [lsp-colors](https://github.com/folke/lsp-colors.nvim)
+ [Lsp Saga](https://github.com/glepnir/lspsaga.nvim) or [tami5/lspsaga.nvim](https://github.com/tami5/lspsaga.nvim)
+ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [nvim-compe](https://github.com/hrsh7th/nvim-compe)
+ [Trouble](https://github.com/folke/trouble.nvim)
+ [Git Gutter](https://github.com/airblade/vim-gitgutter)
+ [git-messenger](https://github.com/rhysd/git-messenger.vim)
+ [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
+ [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
+ [Nvim-Tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
+ [NERDTree](https://github.com/preservim/nerdtree)
+ [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
+ [vim-which-key](https://github.com/liuchengxu/vim-which-key)
+ [WhichKey.nvim](https://github.com/folke/which-key.nvim)
+ [Dashboard](https://github.com/glepnir/dashboard-nvim)
+ [Lualine](https://github.com/nvim-lualine/lualine.nvim) - [🖼️](#-screenshots-lualine)
+ [Neogit](https://github.com/TimUntersberger/neogit)
+ [vim-sneak](https://github.com/justinmk/vim-sneak)
+ [nvim-dap](https://github.com/mfussenegger/nvim-dap)
+ [vim-illuminate](https://github.com/RRethy/vim-illuminate)
+ [packer.nvim](https://github.com/wbthomason/packer.nvim)
+ [vimtex](https://github.com/lervag/vimtex)
+ [glyph-palette.vim](https://github.com/lambdalisue/glyph-palette.vim)
+ [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
+ [vim-toml](https://github.com/cespare/vim-toml)
+ [vim-ruby](https://github.com/vim-ruby/vim-ruby)
+ [vim-lua](https://github.com/tbastos/vim-lua)
+ [vim-LanguageTool](https://github.com/dpelle/vim-LanguageTool)
+ [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - [🖼️](#todo-commentsnvim)

### ⚡️ Requirements

+ Neovim >= 0.5.0

### 📦 Installation

Install via your favorite package manager:

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'yorik1984/newpaper.nvim'
```

### 🚀 Usage

Enable the colorscheme:

```vim
" init.vim
lua << EOF 
    require('newpaper').setup()
EOF
```

```lua
-- Lua:
require('newpaper').setup()
```


### ⚙️ Configuration

+ There are 2 different styles available:
    + dark
    + light

Set the desired style using:

```vim
" init.vim
lua << EOF 
    require('newpaper').setup({
        style = 'dark'
    })
EOF
```

```lua
-- Lua:
vim.g.newpaper_style = 'dark'
require('newpaper').setup()

-- OR better
require('newpaper').setup({
    style = 'dark'
})
```

Available options:

| Option             | Default    | Description                                                  |
| -------------------| ---------- | ------------------------------------------------------------ |
| style              | `'light'`  | The theme comes in two styles:`'dark'`, `'light'` |
| editor_better_view | `true`     | Make some interface like menu, title of editor and plugins menu bold and italic |
| contrast_sidebar   | `false`    | Make sidebars menus like nvim–tree different foreground and background |
| sidebars           | `{}`       | Set a contrast background on sidebar-like windows. For example: `{"qf", "vista_kind", "terminal", "packer"}` |
| contrast_float     | `true`     | Make popup menus like nvim-cmp, lsp-saga have a different foreground and background |
| contrast_telescope | `true`     | Make Telescope have a different foreground and background |
| operators_bold     | `true`     | Make booleans, escape characters, operators, `=`, `*`, delimiter like `<>/` bold |
| keywords           | `'bold'`   | Make keywords like if, for, while etc. bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| tags               | `'bold'`   | Make HTML tagg bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| tex_major          | `'bold'`   | Make only major tex word like`\documentclass`, `\section`, ... bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| tex_operators_bold | `'true'`   | Make tex operators bold |
| tex_keywords       | `'NONE'`   | Make other tex keywords bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| tex_zone           | `'italic'` | Make some tex `...Zone...` bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| tex_arg            | `'italic'` | Make some tex `...Arg...` bold, italic or NONE. Value: `'bold'`, `'italic'`, `'bold,italic'` `'NONE'`. |
| italic_strings     | `true`     | Make strings italic |
| italic_comments    | `true`     | Make comments italic |
| italic_functions   | `false`    | Make function calls and names italic |
| italic_variables   | `false`    | Make variable names and identifiers italic |
| borders            | `true`     | Enable the border between vertically split windows visible |
| disable_background | `false`    | Disable the setting of background color so that NeoVim can use your terminal background |
| lsp_virtual_text_bg | `true`     | Enable background color for LSP virtual text |
| hide_eob           | `false`    | Hide the end of buffer lines (`~`) |
| colors             | `{}`       | Override the default colors and use your own. Also owerride lualine colors if you have same name for more good view |
| lualine_bold       | `true`     | When true, section headers in the lualine theme will be bold |
| lualine_style      | `'light'`  | Set different style from main theme:`'dark'`, `'light'` |

##### Colorscheme default setings:

```lua
-- Default settings
require('newpaper').setup({
    style               = 'light',
    editor_better_view  = true,
    contrast_sidebar    = false,
    sidebars            = {},
    contrast_float      = true,
    contrast_telescope  = true,
    operators_bold      = true,
    keywords            = 'bold',
    tags                = 'bold',
    tex_major           = 'bold',
    tex_operators_bold  = true,
    tex_keywords        = 'NONE',
    tex_zone            = 'italic',
    tex_arg             = 'italic',
    italic_strings      = true,
    italic_comments     = true,
    italic_functions    = false,
    italic_variables    = false,
    borders             = true,
    disable_background  = false,
    lsp_virtual_text_bg = true,
    hide_eob            = false,
    colors              = {},
    lualine_bold        = true,
    lualine_style       = 'light'
})
```

```lua
-- Example config in lua
vim.g.newpaper_style    = 'dark'
vim.g.newpaper_keywords = 'italic'
vim.g.newpaper_borders  = false
vim.g.newpaper_colors   = { black = "#000000", bg = "#0F111A" }
require('newpaper').setup()

-- OR better
require('newpaper').setup({
    style    = 'dark',
    keywords = 'italic',
    borders  = false,
    colors   = { black = "#000000", bg = "#0F111A" }
})
```

```vim
" init.vim
lua << EOF 
    require('newpaper').setup({
        style    = 'dark',
        keywords = 'italic',
        borders  = false,
        colors   = { black = "#000000", bg = "#0F111A" }
    })
EOF
```

## 🎨 [Lualine](https://github.com/nvim-lualine/lualine.nvim) theme

To enable the `newpaper` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
    options = {
        -- ... your lualine config
    }
}
```

Lualine theme name and style automatically using from main theme

#### ⚙️ Hint

You can temporally use just only lualine theme with any others colorschemes. It also depends on `vim.o.background` 

```lua
-- Set bold style
vim.g.newpaper_lualine_bold = true
-- If you want to enable style like in main colorscheme no need to set style of lualine
vim.g.newpaper_lualine_style = 'light'
-- Also you can predefine colors
vim.g.newpaper_colors        = {teal = '#008080'}

-- disable main theme
-- require('newpaper').setup()

-- enable other colorscheme
-- ...
```

⚠️More recommended configuration can be found here:
[yorik1984/lualine-theme.nvim](https://github.com/yorik1984/lualine-theme.nvim#%EF%B8%8F-configuration)

####  📺 Screenshots lualine

#### 🖼️ light

![newpaper-light-normal](https://user-images.githubusercontent.com/1559192/129404790-1cf23fab-7828-48c2-b704-32c65af0af22.png)
![newpaper-light-insert](https://user-images.githubusercontent.com/1559192/129404788-9d67bca5-fca0-4529-aa3c-4fbf63910059.png)
![newpaper-light-visual](https://user-images.githubusercontent.com/1559192/129404794-b9ac2cab-14b4-4737-948a-679fc9c5ec02.png)
![newpaper-light-v_line](https://user-images.githubusercontent.com/1559192/129404793-b2808010-66ae-43aa-b643-685e263609a6.png)
![newpaper-light-replace](https://user-images.githubusercontent.com/1559192/129404792-3d698007-654b-4905-b01a-39e9b54a4b6f.png)
![newpaper-light-command](https://user-images.githubusercontent.com/1559192/129404785-7179d4dd-66e6-4a71-8135-fcf1cee67e8c.png)

#### 🖼️ dark

![newpaper-dark-normal](https://user-images.githubusercontent.com/1559192/129481063-7f6651b5-2fe3-47f9-b522-5829105a43f3.png)
![newpaper-dark-insert](https://user-images.githubusercontent.com/1559192/129481065-f078c808-dbce-4ff2-a4cb-898d0e8dc750.png)
![newpaper-dark-visual](https://user-images.githubusercontent.com/1559192/129481072-f1e0169d-b892-410d-9f24-7322a214e6a2.png)
![newpaper-dark-v_line](https://user-images.githubusercontent.com/1559192/129481081-c778d476-2c1d-4bb0-8904-26a6e3b0faa0.png)
![newpaper-dark-v_block](https://user-images.githubusercontent.com/1559192/129481085-89b8eb24-e8d5-456a-b29b-31a5fc5f6a60.png)
![newpaper-dark-replace](https://user-images.githubusercontent.com/1559192/129481091-a196dcfc-4c4d-4ccb-8069-f9f3443ab36e.png)
![newpaper-dark-command](https://user-images.githubusercontent.com/1559192/129481093-40a09545-327c-4101-9727-fd3234509c78.png)

## 📺  Screenshots

### Languages:

+ ####  RUBY

Source code [HERE](preview/ruby/code.rb)

##### 🖼️ light

**vim-ruby**. [HTML](http://htmlpreview.github.io/?https://github.com/yorik1984/newpaper.nvim/blob/main/preview/ruby/vim-ruby_light_code.rb.html) preview

![vim-ruby_light_code rb](https://user-images.githubusercontent.com/1559192/140774093-ed849404-6679-497e-bad8-822f35b925f6.png)

**Treesitter**

![treesitter_light_code rb](https://user-images.githubusercontent.com/1559192/133896791-28348464-38b6-4c36-ab91-33f513d6bdf8.png)

##### 🖼️ dark

**vim-ruby**. [HTML](http://htmlpreview.github.io/?https://github.com/yorik1984/newpaper.nvim/blob/main/preview/ruby/vim-ruby_dark_code.rb.html) preview

![vim-ruby_dark_code rb](https://user-images.githubusercontent.com/1559192/140774108-9dbd4625-47e7-48bd-ae00-7e55156af74b.png)

**Treesitter**

![treesitter_dark_code rb](https://user-images.githubusercontent.com/1559192/133896784-35df3f2a-07e8-4ade-a227-cc6fd5b70c46.png)

### Plugins:

+ #### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

![todo-comments_light](https://user-images.githubusercontent.com/1559192/140816021-fd16ab48-e3f0-4ab4-a984-34bb14205b0c.png)

![todo-comments_dark](https://user-images.githubusercontent.com/1559192/140816034-12ef3a17-f674-4a67-a490-693947de508d.png)

## FAQ

For a complete guide on usage and Configuration of the theme, see `:help newpaper.nvim`.

##  Credits

+ [onedark.nvim](https://github.com/ful1e5/onedark.nvim) ⚡
+ [sublime-writing-color-scheme](https://github.com/kmisiunas/sublime-writing-color-scheme)
+ [material.nvim](https://github.com/marko-cerovac/material.nvim)
+ [vimtex](https://github.com/lervag/vimtex)
+ [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
+ [papercolor-theme](https://github.com/NLKNguyen/papercolor-theme)
+ HTML version of hightlighting generatated by [JMcKiern/vim-shoot](https://github.com/JMcKiern/vim-shoot)

## 🛠️ TODO:

- [x] Add dark style

- [ ] Add screenshots for languages:
    - [x] Ruby 
    - [ ] Lua
    - [ ] LaTeX
    - [ ] HTML
    - [ ] Markdown
    - [ ] Python
    - [ ] COBOL
- [ ] Add plugins screenshots:
    - [ ] LSP Diagnostics
    - [ ] Lsp Saga
    - [ ] nvim-cmp
    - [ ] Trouble
    - [ ] Telescope.nvim
    - [ ] Nvim-Tree.lua
    - [ ] WhichKey.nvim
    - [ ] packer.nvim
    - [x] todo-comments.nvim
    
- [ ] Add wide syntax highlight:
    - [x] L<big><sup>A</sup></big>T<big><sub>E</sub></big>X with [vimtex](https://github.com/lervag/vimtex)
    - [ ] Markdown
    - [x] Ruby
    - [ ] COBOL
    - [ ] Python
    - [x] Jinja with [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
    - [ ] HTML
    - [x] Lua with [vim-lua](https://github.com/tbastos/vim-lua)
    - [x] TOML with [vim-toml](https://github.com/cespare/vim-toml)
    
- [ ] Add plugins support:
    - [ ] [plaintasks.vim](https://github.com/elentok/plaintasks.vim)
    - [ ] [Nvim-R](https://github.com/jalvesaq/Nvim-R)
    - [ ] [i3config.vim](https://github.com/mboughaba/i3config.vim)
