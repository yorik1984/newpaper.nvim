vim.api.nvim_create_user_command("NewpaperLight", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("newpaper")
end, {})

vim.api.nvim_create_user_command("NewpaperDark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("newpaper")
end, {})

vim.api.nvim_create_user_command("Newpaper", function()
    vim.cmd.colorscheme("newpaper")
end, {})
