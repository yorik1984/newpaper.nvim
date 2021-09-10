local config

-- shim vim for kitty and other generators
vim = vim or {g = {}, o = {}}

local function opt(key, default)
    key = "newpaper_" .. key
    if vim.g[key] == nil then
        return default
    else
        if vim.g[key] == 0 then
            return false
        else
            return vim.g[key]
        end
    end
end

config = {
    style               = opt("style", 'light'),
    editor_better_view  = opt("editor_better_view", true),
    contrast_sidebar    = opt("contrast_sidebar", false),
    sidebars            = opt("sidebars", {}),
    contrast_float      = opt("contrast_float", true),
    contrast_telescope  = opt("contrast_telescope", true),
    operators_bold      = opt("operators_bold", true),
    keywords            = opt("keywords", 'bold'),
    tags                = opt("tags", 'bold'),
    tex_major           = opt("tex_major", 'bold'),
    tex_operators_bold  = opt("tex_operators_bold", true),
    tex_keywords        = opt("tex_keywords", 'NONE'),
    tex_zone            = opt("tex_zone", 'italic'),
    tex_arg             = opt("tex_arg", 'italic'),
    italic_strings      = opt("italic_strings", true),
    italic_comments     = opt("italic_comments", true) ,
    italic_functions    = opt("italic_functions", false),
    italic_variables    = opt("italic_variables", false),
    borders             = opt("borders", true),
    disable_background  = opt("disable_background", false),
    lsp_virtual_text_bg = opt("lsp_virtual_text_bg", true),
    hide_eob            = opt("hide_eob", false),
    colors              = opt("colors", {}),
    lualine_bold        = opt("lualine_bold", true),
    lualine_style       = opt("lualine_style", 'light')
}

local function applyConfiguration(userConfig)
    for key, value in pairs(userConfig) do
        if value ~= nil then
            if config[key] ~= nil then
                config[key] = value
            else
                error("yorik1984/newpaper: Option " .. key .. " does not exist") -- luacheck: ignore
            end
        end
    end
end

return {config = config, applyConfiguration = applyConfiguration}
