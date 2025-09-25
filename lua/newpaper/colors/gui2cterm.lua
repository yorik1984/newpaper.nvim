---@module newpaper.colors.gui2cterm
--- Prepare a highlight table for nvim_set_hl by adding/merging cterm equivalents.
local M = {}

local hex2ct = require("newpaper.colors.hex2cterm")
local check = require("newpaper.check")

local ATTRS = {
    "bold",
    "underline",
    "undercurl",
    "underdouble",
    "underdotted",
    "underdashed",
    "strikethrough",
    "reverse", -- alias: "inverse" handled below
    "italic",
    "standout",
    "altfont",
    "nocombine",
}

local function split_csv(s)
    local t = {}
    for part in s:gmatch("[^,%s]+") do
        t[part] = true
    end
    return t
end

local function cterm_string_to_table(cterm_value)
    if type(cterm_value) == "table" then
        return cterm_value
    elseif type(cterm_value) == "string" then
        if cterm_value:match("^%s*NONE%s*$") then
            return "NONE"
        end
        return split_csv(cterm_value)
    else
        return nil
    end
end

--- Prepare / merge cterm info into color table.
--- does NOT overwrite existing ctermfg/ctermbg if present
--- merges GUI attrs into existing color.cterm (table or CSV string)
--- if color.cterm absent, creates table with found attrs
--- @param color table Highlight table (mutated in-place)
--- @return table color
function M.expandCterm(color)
    if type(color) ~= "table" then return color end

    if color.NONE == true and color.cterm == nil then
        color.cterm = "NONE"
        return color
    end

    local existing_cterm = cterm_string_to_table(color.cterm)
    if existing_cterm == "NONE" then
        return color
    end

    local fg = color.fg or color.guifg
    if fg ~= nil and color.ctermfg == nil then
        if check.isHex(fg) then
            local idx = hex2ct.hex_to_cterm(fg)
            if type(idx) == "number" then color.ctermfg = idx else color.ctermfg = fg end
        else
            color.ctermfg = fg
        end
    end

    local bg = color.bg or color.guibg
    if bg ~= nil and color.ctermbg == nil then
        if check.isHex(bg) then
            local idx = hex2ct.hex_to_cterm(bg)
            if type(idx) == "number" then color.ctermbg = idx else color.ctermbg = bg end
        else
            color.ctermbg = bg
        end
    end

    local new_attrs = {}
    for _, a in ipairs(ATTRS) do
        if color[a] then new_attrs[a] = true end
    end
    if color.inverse then new_attrs.reverse = true end

    if existing_cterm == nil then
        local has = false
        for _ in pairs(new_attrs) do
            has = true; break
        end
        if has then color.cterm = new_attrs end
    else
        for k, v in pairs(new_attrs) do
            if existing_cterm[k] == nil then
                existing_cterm[k] = v
            end
        end
        color.cterm = existing_cterm
    end

    return color
end

return M
