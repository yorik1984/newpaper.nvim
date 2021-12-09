-- Lorem ipsum lua code

local util         = require("newpaper.util")
local configModule = require("newpaper.config")

local M = {}

function util.syntax(syntax)
    for group, colors in pairs(syntax) do
        util.highlight(group, colors)
    end
end

function util.loadCustomSyntax(config)
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()
        if type(config.custom_highlights) == 'table' then
            util.syntax(config.custom_highlights)
        end
        async:close()
    end))
    async:send()
end

function util.onColorScheme()
    if vim.g.colors_name ~= "newpaper" then
        vim.cmd([[autocmd! newpaper]])
        vim.cmd([[augroup! newpaper]])
    end
end

local function opt(key, default)
    key = "newpaper_" .. key
    if vim.g[key] == nil then
        return default
    end
end

local config = {
    string_option       = opt("style", 'light'),
    boolean_option      = opt("editor_better_view", true),
    table_option        = opt("sidebars", {}),
    number              = 1234567890,
    string_escape       = "\n String"
}

function M.setup(config)
    config = config or configModule.config
    local newpaper = {
        black           = '#2B2B2B', -- color00
        maroon          = '#AF0000', -- color01
        darkgreen       = '#008700'  -- color02
    }
    local syntax = {
        StorageClass   = { fg = newpaper.ocean },
        Structure      = { fg = newpaper.darkpurple },
        Conditional    = { fg = newpaper.keyword }
    }
    if vim.g.newpaper_colors == nil then
        vim.g.newpaper_colors = configModule.config.colors
    end
    util.color_overrides(newpaper, config)
    return newpaper

end

return M
