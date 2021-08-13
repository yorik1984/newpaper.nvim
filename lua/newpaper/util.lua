local util = {}
local newpaper = require('newpaper.theme')

-- Go trough the table and highlight the group with the color values
util.highlight = function (group, color)
    local style = color.style and "gui = "   .. color.style or "gui = NONE"
    local fg    = color.fg    and "guifg = " .. color.fg    or "guifg  = NONE"
    local bg    = color.bg    and "guibg = " .. color.bg    or "guibg  = NONE"
    local sp    = color.sp    and "guisp = " .. color.sp    or ""
    local hl    = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

    vim.cmd(hl)
    if color.link then vim.cmd("highlight! link " .. group .. " " .. color.link) end
end

-- Only define newpaper if it's the active colorshceme
function util.onColorScheme()
  if vim.g.colors_name ~= "newpaper" then
    vim.cmd [[autocmd! newpaper]]
    vim.cmd [[augroup! newpaper]]
  end
end

-- Change the background for the terminal and packer windows
util.contrast = function ()
    vim.cmd [[augroup Newpaper]]
    vim.cmd [[  autocmd!]]
    vim.cmd [[  autocmd ColorScheme * lua require("newpaper.util").onColorScheme()]]
    vim.cmd [[  autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType packer setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType qf setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[augroup end]]
end

-- Load the theme
function util.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.g.newpaper_style = "light"
    vim.o.background = "light"
    vim.o.termguicolors = true
    vim.g.colors_name = "newpaper"

    -- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()

        -- imort tables for plugins and lsp
        local plugins = newpaper.loadPlugins()
        local lsp = newpaper.loadLSP()

        if not vim.g.newpaper_disable_teminal then
			newpaper.loadTerminal()
		end

        for group, colors in pairs(plugins) do
            util.highlight(group, colors)
        end

        for group, colors in pairs(lsp) do
            util.highlight(group, colors)
        end

        if vim.g.newpaper_contrast then
            util.contrast()
        end

        async:close()

    end))

    -- load base theme
    local editor = newpaper.loadEditor()
    local syntax = newpaper.loadSyntax()
    local treesitter = newpaper.loadTreeSitter()

    for group, colors in pairs(editor) do
        util.highlight(group, colors)
    end

    for group, colors in pairs(syntax) do
        util.highlight(group, colors)
    end

    for group, colors in pairs(treesitter) do
        util.highlight(group, colors)
    end

    async:send()
end

return util
