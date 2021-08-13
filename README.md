# 🎨 newpaper.nvim

### 🛠️ W.I.P.🚧

**TODO**:
- [ ] Add dark style
- [ ] Add screenshots
- [ ] Add wide syntax highlight:
    - [ ] Markdown
    - [ ] LaTeX
    - [ ] Ruby
    - [ ] COBOL

### 🔱 Info
A fork of [material.nvim](https://github.com/marko-cerovac/material.nvim) colorscheme for NeoVim using [Papercolor](NLKNguyen/papercolor-theme) color palette with small changes written in Lua. LaTeX syntax highlight get from  [sublime-writing-color-scheme]( https://github.com/kmisiunas/sublime-writing-color-scheme).

Newpaper.nvim is meant to be a fast and modern colorscheme written in Lua that supports a lot of the new features added to NeoVim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter).

### ✨ Features

+ 2 styles to choose from
    + Light
    + Dark

+ Supported plugins:
    + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
    + [LSP Diagnostics](https://neovim.io/doc/user/lsp.html) with colors from [lsp-colors](https://github.com/folke/lsp-colors.nvim)
    + [Lsp Saga](https://github.com/glepnir/lspsaga.nvim)
    + [Nvim-Compe](https://github.com/hrsh7th/nvim-compe)
    + [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
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
    + [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
    + [Lualine](https://github.com/hoob3rt/lualine.nvim)
    + [Neogit](https://github.com/TimUntersberger/neogit)
    + [vim-sneak](https://github.com/justinmk/vim-sneak)
    + [nvim-dap](https://github.com/mfussenegger/nvim-dap)
    + [vim-illuminate](https://github.com/RRethy/vim-illuminate)

+ Ability to change background on sidebar-like windows like Nvim-Tree, Packer, terminal etc.

+ Asynchronous highlight loading which makes the theme extremely fast

+ Added functions for live theme switching without the need to restart NeoVim

+ Special syntax highlight

### ⚡️ Requirements

+ Neovim >= 0.5.0

### 📦 Installation

Install via your favourite package manager:

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'yorik1984/newpaper.nvim'
```

### 🚀 Usage


Enable the colorscheme:

```vim
" Vim-Script:
colorscheme newpaper
```

```lua
-- Lua:
require('newpaper').set()
```
### [Lualine](https://github.com/hoob3rt/lualine.nvim) theme

To enable the `newpaper` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'newpaper-light'
    -- ... your lualine config
  }
}
```

#### 🖼️ newpaper-light
![newpaper-light-normal](https://user-images.githubusercontent.com/1559192/129404790-1cf23fab-7828-48c2-b704-32c65af0af22.png)
![newpaper-light-insert](https://user-images.githubusercontent.com/1559192/129404788-9d67bca5-fca0-4529-aa3c-4fbf63910059.png)
![newpaper-light-visual](https://user-images.githubusercontent.com/1559192/129404794-b9ac2cab-14b4-4737-948a-679fc9c5ec02.png)
![newpaper-light-v_line](https://user-images.githubusercontent.com/1559192/129404793-b2808010-66ae-43aa-b643-685e263609a6.png)
![newpaper-light-replace](https://user-images.githubusercontent.com/1559192/129404792-3d698007-654b-4905-b01a-39e9b54a4b6f.png)
![newpaper-light-command](https://user-images.githubusercontent.com/1559192/129404785-7179d4dd-66e6-4a71-8135-fcf1cee67e8c.png)


### ⚙️ Configuration

+ There are 2 different styles available:
    + dark
    + light

Set the desired style using:

```vim
"Vim-Script:
let g:newpaper_style = 'dark'
```

```lua
-- Lua:
vim.g.newpaper_style = "dark"
```

Available options:

| Option                      | Default     | Description                                                  |
| --------------------------- | ----------- | ------------------------------------------------------------ |
| newpaper_style              | `"light"`   | The theme comes in five styles, 'dark', 'light'              |
| newpaper_contrast_sidebar   | `false`     | Make sidebars menus like nvim–tree, trouble a different background    |
| newpaper_contrast_float     | `false`     | Make popup menus like which–key have a different background  |
| newpaper_bold_keywords      | `false`     | Make keywords like if, for, while etc. bold                  |
| newpaper_bold_tags          | `false`     | Make HTML tags bold                                          |
| newpaper_italic_strings     | `false`     | Make strings italic                                          |
| newpaper_italic_comments    | `false`     | Make comments italic                                         |
| newpaper_italic_keywords    | `false`     | Make keywords like if, for, while etc. italic                |
| newpaper_italic_functions   | `false`     | Make function calls and names italic                         |
| newpaper_italic_variables   | `false`     | Make variable names and identifiers italic                   |
| newpaper_borders            | `false`     | Enable the border between verticaly split windows visable    |
| newpaper_disable_background | `false`     | Disable the setting of background color so that NeoVim can use your terminal background |
| newpaper_disable_terminal   | `false`     | Disable the setting of terminal colors                       |
| newpaper_hide_eob           | `false`     | Hide the end of buffer lines (`~`)                            |
| newpaper_variable_color     | `#717CB4`   | Set a custom color for variables and fields                  |
| newpaper_custom_colors      | {}         | Override the default colors and use your own                 |

```lua
-- Example config in lua
vim.g.newpaper_style = 'light'
vim.g.newpaper_italic_comments = true
vim.g.newpaper_bold_keywords   = true
vim.g.newpaper_borders         = true
-- vim.g.newpaper_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('newpaper').set()
```

```vim
" Example config in Vim-Script
let g:newpaper_style           = 'light'
let g:newpaper_italic_comments = v:true
let g:newpaper_bold_keywords   = v:true

" Load the colorsheme
colorscheme newpaper
```

### ⛵ Functions

+ Toggle the style live without the need to exit NeoVim

Just call the function for style switching

```vim
" Vim-Script
:lua require('newpaper.functions').toggle_style()
" This command toggles the style
```

The command can also be mapped to a key for fast style switching

```vim
"Vim-Script:
nnoremap <leader>mm :lua require('newpaper.functions').toggle_style()<CR>
```

```lua
-- Lua:
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('newpaper.functions').toggle_style()<CR>]], { noremap = true, silent = true })
```

+ Toggle the end of buffer lines ( ~ )

Call the built in function for toggling buffer lines

```vim
" Vim-Script
:lua require('newpaper.functions').toggle_eob()
" This command toggles the end of buffer lines
```

The command can also be mapped to a key to toggle the lines live

```vim
" Vim-Script:
nnoremap <leader>me :lua require('newpaper.functions').toggle_eob()<CR>
```

```lua
-- Lua:
vim.api.nvim_set_keymap('n', '<leader>me', [[<Cmd>lua require('newpaper.functions').toggle_eob()<CR>]], { noremap = true, silent = true })
```

+ Change the style to a desired one using the function change_style("desired style")

```vim
" Vim-Script:
:lua require('newpaper.functions').change_style("palenight")
" This command changes the style to palenight
```

The command can also be mapped to a key for fast style switching

```vim
" Vim-Script:
nnoremap <leader>ml :lua require('newpaper.functions').change_style('light')<CR>
nnoremap <leader>md :lua require('newpaper.functions').change_style('dark')<CR>
```

```lua
-- Lua:
vim.api.nvim_set_keymap('n', '<leader>ml', [[<Cmd>lua require('newpaper.functions').change_style('light')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>md', [[<Cmd>lua require('newpaper.functions').change_style('dark')<CR>]], { noremap = true, silent = true })
```

For a comlete guide on usage and Configuration of the theme, see `:help newpaper.nvim`.
