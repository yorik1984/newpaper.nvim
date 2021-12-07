local util = {}

function util.highlight(group, color)
    -- LuaFormatter off
    local style = color.style and "gui = " .. color.style or "gui = NONE"
    local fg    = color.fg    and "guifg = " .. color.fg  or "guifg  = NONE"
    local bg    = color.bg    and "guibg = " .. color.bg  or "guibg  = NONE"
    local sp    = color.sp    and "guisp = " .. color.sp  or ""
    local hl    = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
    -- LuaFormatter on
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    else
        vim.cmd(hl)
    end
end

-- Delete the autocmds when the theme changes to something else
function util.onColorScheme()
    if vim.g.colors_name ~= "newpaper" then
        vim.cmd([[autocmd! newpaper]])
        vim.cmd([[augroup! newpaper]])
    end
end

function util.autocmds(config)
    vim.cmd([[augroup newpaper]])
    vim.cmd([[  autocmd!]])
    vim.cmd([[  autocmd ColorScheme * lua require("newpaper.util").onColorScheme()]])
    for _, sidebar in ipairs(config.sidebars) do
        if sidebar == "terminal" then
              vim.cmd(
                [[  autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
        else
            vim.cmd([[  autocmd FileType ]] .. sidebar ..
                [[ setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
        end
    end
    vim.cmd([[augroup end]])
end

function util.syntax(syntax)
    for group, colors in pairs(syntax) do util.highlight(group, colors) end
end

function util.load(theme)
    -- Patch https://github.com/folke/tokyonight.nvim/commit/0ead86afe390603f9bd688103d7a5fc6724a828e
    -- only needed to clear when not the default colorscheme
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "newpaper"

-- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()

        -- imort tables for plugins and lsp
        util.syntax(theme.loadPlugins())
        util.syntax(theme.loadLSP())
        theme.loadTerminal()

        async:close()

    end))

    -- load base theme
    util.syntax(theme.loadEditor())
    util.syntax(theme.loadSyntax())
    util.syntax(theme.loadTreeSitter())

    async:send()

    util.autocmds(theme.config)
end

function util.loadSyntax(synTheme)
    -- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()

        -- imort tables for plugins
        util.syntax(synTheme.loadPlugins())

        async:close()

    end))

    -- Load other syntax
    util.syntax(synTheme.loadSyntax())
    util.syntax(synTheme.loadTreeSitter())

    async:send()

end

function util.loadPluginSyntax(synTheme)
    -- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()

        -- imort tables for plugins
        util.syntax(synTheme.loadPlugins())

        async:close()

    end))

    async:send()

end

function util.color_overrides(colors, config)
    if type(config.colors) == "table" then
        for key, value in pairs(config.colors) do
            if not colors[key] then error("Color " .. key .. " does not exist") end
            -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
            if type(colors[key]) == "table" then
                util.color_overrides(colors[key], {colors = value})
            else
                if value:lower() == "none" then
                -- set to none
                colors[key] = "NONE"
                elseif string.sub(value, 1, 1) == "#" then
                    -- hex override
                    colors[key] = value
                else
                    -- another group
                    if not colors[value] then error("Color " .. value .. " does not exist") end
                    colors[key] = colors[value]
                end
            end
        end
    end
end

return util
