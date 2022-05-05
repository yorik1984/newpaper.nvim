local configModule = require("newpaper.config")
local lualine_style
local theme = {}

if vim.g.newpaper_lualine_style == nil then
    lualine_style = vim.o.background
else
    lualine_style = vim.g.newpaper_lualine_style
end

configModule.config.colors = vim.g.newpaper_colors
configModule.config.style = lualine_style
theme.colors = require("newpaper.colors").setup(configModule.config)
local colors = theme.colors

local newpaper = {}

-- stylua: ignore start

newpaper.normal = {
    a = { fg = colors.teal,       bg = colors.silver },
    b = { fg = colors.git_fg,     bg = colors.git_bg }, -- only for GIT
    c = { fg = colors.teal,       bg = colors.silver },
    x = { fg = colors.grey,       bg = colors.silver },
    y = { fg = colors.bg,         bg = colors.blue },
    z = { fg = colors.bg,         bg = colors.teal },
}
newpaper.insert = {
    a = { fg = colors.darkgreen,  bg = colors.silver },
    c = { fg = colors.darkgreen,  bg = colors.silver },
    x = { fg = colors.grey,       bg = colors.silver },
    y = { fg = colors.bg,         bg = colors.green },
    z = { fg = colors.bg,         bg = colors.darkgreen },
}
newpaper.visual = {
    a = { fg = colors.bg,         bg = colors.purple },
    c = { fg = colors.grey,       bg = colors.blueviolet },
    x = { fg = colors.grey,       bg = colors.blueviolet },
    y = { fg = colors.grey,       bg = colors.blueviolet },
    z = { fg = colors.bg,         bg = colors.purple },
}
newpaper.replace = {
    a = { fg = colors.bg,         bg = colors.magenta },
    c = { fg = colors.grey,       bg = colors.pink },
    x = { fg = colors.grey,       bg = colors.pink },
    y = { fg = colors.grey,       bg = colors.pink },
    z = { fg = colors.bg,         bg = colors.magenta },
}
newpaper.command = {
    a = { bg = colors.darkorange, fg = colors.bg },
    c = { fg = colors.grey,       bg = colors.lightorange },
    x = { fg = colors.grey,       bg = colors.lightorange },
    y = { fg = colors.grey,       bg = colors.lightorange },
    z = { fg = colors.bg,         bg = colors.darkorange },
}
newpaper.inactive = {
    a = { fg = colors.lightgrey,  bg = colors.silver },
    b = { fg = colors.lightgrey,  bg = colors.silver },
    c = { fg = colors.lightgrey,  bg = colors.silver },
}

-- stylua: ignore end

if vim.g.newpaper_lualine_bold then
    for _, mode in pairs(newpaper) do
        mode.a.gui = "bold"
    end
end

return newpaper
