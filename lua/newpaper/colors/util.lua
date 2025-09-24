local hsluv         = require("newpaper.hsluv.hsluv")
local check         = require("newpaper.check")
local configModule  = require("newpaper.config")

local M = {}

function M.colorOverrides(color, configColors)
    for key, value in pairs(configColors) do
        check.keyExistsError(configColors, color, "color", "Use: from newpaper/colors.lua")
        -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
        if type(color[key]) == "table" then
            M.colorOverrides(color[key], { color = value })
        else
            if value:lower() == "none" then
                -- set to none
                color[key] = "NONE"
            elseif check.isHex(value) then
                -- hex override
                color[key] = value
            elseif not color[value] then
                -- another group
                error("newpaper.nvim: color '" .. value .. "' has wrong format. Use: '#XXXXXX'")
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
            if hsluvType == configModule.hsluv_opt.saturation then
                colors[key] = M.hsluvChangeSaturation(hsluvColor, hsluvValue)
            end
            if hsluvType == configModule.hsluv_opt.lightness then
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
