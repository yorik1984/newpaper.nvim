command! NewpaperDark exe "lua require('newpaper').setup({ style = 'dark' })" | exe 'set background=dark'
command! NewpaperLight exe "lua require('newpaper').setup({ style = 'light' })" | exe 'set background=light'
