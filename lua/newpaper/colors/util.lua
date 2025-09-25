---@module newpaper.colors.util
--- Utility helpers for color manipulation (HSLuv and greyscale operations).
--- External deps (hsluv, check, configModule) are optional and checked at runtime.

local hsluv        = require("newpaper.colors.hsluv")
local check        = require("newpaper.check")
local configModule = require("newpaper.config")

local M            = {}

--- Apply overrides from configColors into color table
--- @param color table
--- @param configColors table?
function M.colorOverrides(color, configColors)
    if configColors == nil then
        return
    end

    if type(configColors) ~= "table" then
        error("newpaper.nvim: colorOverrides: configColors must be a table or nil", 2)
    end

    check.keyExistsError(configColors, color, "color", "Use: from newpaper/colors.lua")

    for key, value in pairs(configColors) do
        if type(color[key]) == "table" then
            M.colorOverrides(color[key], { color = value })
        else
            if type(value) ~= "string" then
                error(("newpaper.nvim: color override for '%s' must be a string, got %s"):format(key, type(value)), 2)
            end

            local low = value:lower()
            if low == "none" then
                color[key] = "NONE"
            elseif check.isHex(value) then
                color[key] = value
            elseif not color[value] then
                error(
                    "newpaper.nvim: color '" ..
                    value .. "' has wrong format. Use: '#XXXXXX' or existing color group name", 2)
            else
                color[key] = color[value]
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
    if method == configModule.greyscale_opt.lightness then
        GREY = greyscaleLightness(R, G, B)
    end
    if method == configModule.greyscale_opt.average then
        GREY = greyscaleAverage(R, G, B)
    end
    if method == configModule.greyscale_opt.luminosity then
        GREY = greyscaleLuminosity(R, G, B)
    end

    return hsluv.rgb_to_hex({ GREY, GREY, GREY })
end

--- Change saturation of an HSLuv color and return resulting hex string.
--- If saturation is 0 (grey) the saturation is not modified.
--- @param hsluvColor table<number> Array-like HSLuv color {H,S,L}
--- @param value number Fractional change. Positive moves toward 100, negative toward 0.
--- @return string|nil hex Resulting hex string like "#RRGGBB", or nil on error.
function M.hsluvChangeSaturation(hsluvColor, value)
    if type(hsluvColor) ~= "table" or type(value) ~= "number" then
        return nil
    end

    local s = tonumber(hsluvColor[2]) or 0
    -- when saturation <= 0 (grey colors) do not change saturation
    if math.floor(s) > 0 then
        local delta_base = (value < 0) and s or (100 - s)
        hsluvColor[2] = s + delta_base * value
        -- clamp to [0,100]
        if hsluvColor[2] < 0 then hsluvColor[2] = 0 end
        if hsluvColor[2] > 100 then hsluvColor[2] = 100 end
    end

    if type(hsluv) == "table" and type(hsluv.hsluv_to_hex) == "function" then
        local ok, hex = pcall(hsluv.hsluv_to_hex, hsluvColor)
        if ok and type(hex) == "string" then return hex end
    end
    return nil
end

--- Change lightness of an HSLuv color and return resulting hex string.
--- @param hsluvColor table<number> Array-like HSLuv color {H,S,L}
--- @param value number Fractional change. Positive moves toward 100, negative toward 0.
--- @return string|nil hex Resulting hex string like "#RRGGBB", or nil on error.
function M.hsluvChangeLightness(hsluvColor, value)
    if type(hsluvColor) ~= "table" or type(value) ~= "number" then
        return nil
    end

    local l = tonumber(hsluvColor[3]) or 0
    local delta_base = (value < 0) and l or (100 - l)
    hsluvColor[3] = l + delta_base * value
    -- clamp to [0,100]
    if hsluvColor[3] < 0 then hsluvColor[3] = 0 end
    if hsluvColor[3] > 100 then hsluvColor[3] = 100 end

    if type(hsluv) == "table" and type(hsluv.hsluv_to_hex) == "function" then
        local ok, hex = pcall(hsluv.hsluv_to_hex, hsluvColor)
        if ok and type(hex) == "string" then return hex end
    end
    return nil
end

--- Edit a table of colors (hex strings) by applying an HSLuv operation.
--- Only entries passing check.isHex are processed. The table is modified in-place.
--- @param colors table<string, string> Table mapping keys -> hex color strings
--- @param hsluvType any Either configModule.hsluv_opt.saturation or configModule.hsluv_opt.lightness
--- @param hsluvValue number Fractional change applied to saturation or lightness
--- @return table colors The same table (modified in-place)
function M.hsluvEdit(colors, hsluvType, hsluvValue)
    if type(colors) ~= "table" then return colors end

    local can_check = (type(check) == "table" and type(check.isHex) == "function")
    local can_hsluv = (type(hsluv) == "table" and type(hsluv.hex_to_hsluv) == "function")
    local sat_key = configModule and configModule.hsluv_opt and configModule.hsluv_opt.saturation
    local light_key = configModule and configModule.hsluv_opt and configModule.hsluv_opt.lightness

    for key, val in pairs(colors) do
        -- simple validation
        if type(val) == "string" and can_check and check.isHex(val) then
            -- special-case a specific color
            if val == "#F1F3F2" then
                val = "#F2F2F2"
            end

            if can_hsluv then
                local ok, hsluvColor = pcall(hsluv.hex_to_hsluv, val)
                if ok and type(hsluvColor) == "table" then
                    if hsluvType == sat_key then
                        local hex = M.hsluvChangeSaturation(hsluvColor, hsluvValue)
                        if type(hex) == "string" then colors[key] = hex end
                    elseif hsluvType == light_key then
                        local hex = M.hsluvChangeLightness(hsluvColor, hsluvValue)
                        if type(hex) == "string" then colors[key] = hex end
                    end
                end
            end
        end
    end

    return colors
end

--- Convert all hex colors in a table to greyscale using M.hexGreyscale.
--- Requires M.hexGreyscale to be defined elsewhere in this module.
--- @param colors table<string, string> Table mapping keys -> hex color strings
--- @param method any Optional method passed to M.hexGreyscale
--- @return table colors The same table (modified in-place)
function M.colorGreyscale(colors, method)
    for key, val in pairs(colors) do
        if type(val) == "string" and type(check) == "table" and type(check.isHex) == "function" and check.isHex(val) then
            if type(M.hexGreyscale) == "function" then
                local ok, g = pcall(M.hexGreyscale, val, method)
                if ok and type(g) == "string" then
                    colors[key] = g
                end
            end
        end
    end
    return colors
end

return M
