augroup newpaper
    command -bar -nargs=0 NewpaperDark exe "lua require('newpaper').setup({ style = 'dark' })" | exe 'set background=dark'
    command -bar -nargs=0 NewpaperLight exe "lua require('newpaper').setup({ style = 'light' })" | exe 'set background=light'
augroup END