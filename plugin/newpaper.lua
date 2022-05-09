vim.api.nvim_create_user_command( "NewpaperLight", function()
    require("newpaper").setup({ style = "light" })
    vim.o.background = "light"
end, {})

vim.api.nvim_create_user_command( "NewpaperDark", function()
    require("newpaper").setup({ style = "dark" })
    vim.o.background = "dark"
end, {})
