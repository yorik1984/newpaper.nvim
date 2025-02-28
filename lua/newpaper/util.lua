local check         = require("newpaper.check")
local hsluv         = require("newpaper.hsluv")
local configDefault = require("newpaper.config")
local core          = require("newpaper.theme.core")
local filetypes     = require("newpaper.theme.filetypes")
local ftplugins     = require("newpaper.theme.ftplugins")
local plugins       = require("newpaper.theme.plugins")
local treesitter    = require("newpaper.theme.treesitter")
local M             = {}

function M.contains(tbl, string)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            if M.contains(tbl[k], string) then
                return true
            end
        end
        if v == string then
            return true
        end
    end
    return false
end

function M.syntax(syntax)
    for group, colors in pairs(syntax) do
        M.highlight(group, colors)
    end
end

function M.highlight(group, color)
    -- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
    if color.style then
        if type(color.style) == "table" then
            color = vim.tbl_extend("force", color, color.style)
        elseif color.style:lower() ~= "none" then
            -- handle old string style definitions
            for s in string.gmatch(color.style, "([^,]+)") do
                color[s] = true
            end
        end
        color.style = nil
    end

    vim.api.nvim_set_hl(0, group, color)
end

-- Delete the autocmds when the theme changes to something else
function M.onColorScheme()
    vim.api.nvim_clear_autocmds({ group = "newpaper" })
end

function M.autocmds(config, colors)
    local group = vim.api.nvim_create_augroup("newpaper", {})
    vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            require("newpaper.util").onColorScheme()
        end,
    })
    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)\\@<!" },
        command = "setlocal winhighlight=Normal:NormalTerm,"
            .. "NormalFloat:NormalTermFloat,"
            .. "FloatBorder:FloatBorderTerm,"
            .. "SignColumn:SignColumnTerm,"
            .. "LineNr:LineNrTerm,"
            .. "FoldColumn:FoldColumnTerm,"
            .. "TermCursor:TermCursorTerm,"
            .. "TermCursorNC:TermCursorNCTerm,"
            .. "CursorLine:CursorLineTerm "
            .. "signcolumn=no nocursorline nonumber",
    })

    vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = group,
        pattern = { "*\\(lazygit\\)" },
        callback = function()
            vim.b.terminal_color_1  = colors.git_removed
            vim.b.terminal_color_2  = colors.git_added
            vim.b.terminal_color_15 = colors.git_fg
        end,
    })

    for _, sidebar in ipairs(config.sidebars_contrast) do
        if sidebar ~= "NvimTree" then
            vim.api.nvim_create_autocmd({ "FileType" }, {
                group = group,
                pattern = { sidebar },
                command = "setlocal winhighlight=Normal:NormalContrastSB,"
                    .. "SignColumn:SignColumnSB,"
                    .. "LineNr:LineNrSB,"
                    .. "FoldColumn:FoldColumnSB,"
                    .. "CursorLineNr:CursorLineSignSB,"
                    .. "CursorLine:CursorLineSB,"
                    .. "CursorLineSign:CursorLineSignSB "
                    .. "signcolumn=yes:1 nonumber",
            })
        end
    end
end

function M.terminal(colors)
    vim.g.terminal_color_0  = colors.black
    vim.g.terminal_color_1  = colors.maroon
    vim.g.terminal_color_2  = colors.darkgreen
    vim.g.terminal_color_3  = colors.darkorange
    vim.g.terminal_color_4  = colors.navy
    vim.g.terminal_color_5  = colors.purple
    vim.g.terminal_color_6  = colors.teal
    vim.g.terminal_color_7  = colors.bg
    vim.g.terminal_color_8  = colors.darkgrey
    vim.g.terminal_color_9  = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.orange
    vim.g.terminal_color_12 = colors.lightblue
    vim.g.terminal_color_13 = colors.lightmagenta
    vim.g.terminal_color_14 = colors.blue
    vim.g.terminal_color_15 = colors.fg
end

function M.load(configApply)
    -- Patch https://github.com/folke/tokyonight.nvim/commit/0ead86afe390603f9bd688103d7a5fc6724a828e
    -- only needed to clear when not the default colorscheme
    if vim.g.colors_name then
        vim.cmd([[hi clear]])
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "newpaper"

    if vim.fn.exists "syntax_on" then
        vim.cmd "syntax reset"
    end

    local configColors = require("newpaper.colors").setup(configApply)
    local configStyle  = require("newpaper.style").setupStyle(configApply)

    local groups       = {
        core,
        filetypes,
        ftplugins,
        plugins,
        treesitter,
    }

    for _, group in ipairs(groups) do
        for _, syn in ipairs(group) do
            M.loadHlGroups(require(syn).setup(configColors, configStyle))
        end
    end

    M.terminal(configColors)
    M.loadCustomSyntax(configApply)
    M.autocmds(configApply, configColors)
end

function M.loadHlGroups(synTheme)
    M.syntax(synTheme)
end

function M.loadCustomSyntax(config)
    M.syntax(config.custom_highlights)
end

function M.colorOverrides(colors, configColors)
    for key, value in pairs(configColors) do
        check.keyExistsError(configColors, colors, "color", "Use: from newpaper/colors.lua")
        -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
        if type(colors[key]) == "table" then
            M.colorOverrides(colors[key], { colors = value })
        else
            if value:lower() == "none" then
                -- set to none
                colors[key] = "NONE"
            elseif check.isHex(value) then
                -- hex override
                colors[key] = value
            elseif not colors[value] then
                -- another group
                error("newpaper.nvim: color '" .. value .. "' has wrong format. Use: '#XXXXXX'")
            else
                colors[key] = colors[value]
            end
        end
    end
end

---Convert "#XXXXXX" color to greyscale with different methods
---lightness:  (math.max(R, G, B) + math.min(R, G, B))/2
---average:    (R + G + B)/3
---luminosity: 0.21R + 0.72G + 0.07B
---@param hex string: color in "#XXXXXX" format
---@param method "lightness"|"average"|"luminosity"|false: type of greyscale
---@return string: "#XXXXXX" greyscaled color
function M.hexGreyscale(hex, method)
    local function greyscaleLightness(r, g, b)
        return (math.max(r, g, b) + math.min(r, g, b)) / 2
    end

    local function greyscaleAverage(r, g, b)
        return (r + g + b) / 3
    end

    local function greyscaleLuminosity(r, g, b)
        return 0.21 * r + 0.72 * g + 0.07 * b
    end
    local rgb = hsluv.hex_to_rgb(hex)
    local R, G, B
    if rgb then
        R = rgb[1]
        G = rgb[2]
        B = rgb[3]
    end
    local GREY
    if method == configDefault.greyscale_opt.lightness then
        GREY = greyscaleLightness(R, G, B)
    end
    if method == configDefault.greyscale_opt.average then
        GREY = greyscaleAverage(R, G, B)
    end
    if method == configDefault.greyscale_opt.luminosity then
        GREY = greyscaleLuminosity(R, G, B)
    end

    return hsluv.rgb_to_hex({ GREY, GREY, GREY })
end

function M.hsluvChangeSaturation(hsluvColor, value)
    -- when saturation <=1(for grey colors)  will change lightness
    if math.floor(hsluvColor[2]) > 0 then
        local hsluvValue = (value < 0) and hsluvColor[2] or (100 - hsluvColor[2])
        hsluvColor[2] = hsluvColor[2] + hsluvValue * value
    end
    return hsluv.hsluv_to_hex(hsluvColor)
end

function M.hsluvChangeLightness(hsluvColor, value)
    local hsluvValue = (value < 0) and hsluvColor[3] or (100 - hsluvColor[3])
    hsluvColor[3] = hsluvColor[3] + hsluvValue * value
    return hsluv.hsluv_to_hex(hsluvColor)
end

function M.hsluvEdit(colors, hsluvType, hsluvValue)
    for key, value in pairs(colors) do
        if check.isHex(value) then
            -- only for light background using light but not grey color
            if value == "#F1F3F2" then
                value = "#F2F2F2"
            end
            local hsluvColor = hsluv.hex_to_hsluv(value)
            if hsluvType == configDefault.hsluv_opt.saturation then
                colors[key] = M.hsluvChangeSaturation(hsluvColor, hsluvValue)
            end
            if hsluvType == configDefault.hsluv_opt.lightness then
                colors[key] = M.hsluvChangeLightness(hsluvColor, hsluvValue)
            end
        end
    end
    return colors
end

function M.colorGreyscale(colors, method)
    for key, value in pairs(colors) do
        if check.isHex(value) then
            colors[key] = M.hexGreyscale(value, method)
        end
    end
    return colors
end

return M
