---@module newpaper.colors.hex2cterm
--- Convert hex colors to nearest xterm-256 color index.
--- Builds a correct PALETTE table (array of {r,g,b} entries) and iterates
--- it with ipairs to avoid table.unpack(nil) errors.
---
--- Exported:
---   hex_to_cterm(hex) -> index (0..255) or nil on invalid input
---   PALETTE (array of {r,g,b})
local M = {}

local function clamp(n, lo, hi)
    if n < lo then
        return lo
    end
    if n > hi then
        return hi
    end
    return n
end
local function round(n)
    return math.floor(n + 0.5)
end

-- Parse hex string "#RRGGBB" or "RRGGBB" -> r,g,b (0..255) or nil
local function hex_to_rgb(hex)
    if type(hex) ~= "string" then
        return nil
    end
    hex = hex:gsub("^%s+", ""):gsub("%s+$", "")
    hex = hex:gsub("^#", "")
    if #hex ~= 6 then
        return nil
    end
    local ok, r = pcall(function()
        return tonumber(hex:sub(1, 2), 16)
    end)
    if not ok or not r then
        return nil
    end
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)
    if not g or not b then
        return nil
    end
    return r, g, b
end

-- Build standard xterm-256 PALETTE as array of {r,g,b} (0..255)
-- Indices correspond to xterm palette: 0..255
local function build_palette()
    local palette = {}

    -- 0..15: system colors (approximate)
    local system = {
        { 0, 0, 0 },
        { 128, 0, 0 },
        { 0, 128, 0 },
        { 128, 128, 0 },
        { 0, 0, 128 },
        { 128, 0, 128 },
        { 0, 128, 128 },
        { 192, 192, 192 },
        { 128, 128, 128 },
        { 255, 0, 0 },
        { 0, 255, 0 },
        { 255, 255, 0 },
        { 0, 0, 255 },
        { 255, 0, 255 },
        { 0, 255, 255 },
        { 255, 255, 255 },
    }
    for i = 1, #system do
        table.insert(palette, system[i])
    end

    -- 16..231: 6x6x6 color cube
    local levels = { 0x00, 0x5f, 0x87, 0xaf, 0xd7, 0xff }
    for r = 1, 6 do
        for g = 1, 6 do
            for b = 1, 6 do
                table.insert(palette, { levels[r], levels[g], levels[b] })
            end
        end
    end

    -- 232..255: grayscale ramp (24 steps)
    for i = 0, 23 do
        local c = 8 + i * 10
        table.insert(palette, { c, c, c })
    end

    -- Sanity: ensure length is 256
    -- If anything went wrong, pad with black entries
    for i = #palette + 1, 256 do
        table.insert(palette, { 0, 0, 0 })
    end

    return palette
end

M.PALETTE = build_palette()

local function dist2(r1, g1, b1, r2, g2, b2)
    local dr = r1 - r2
    local dg = g1 - g2
    local db = b1 - b2
    return dr * dr + dg * dg + db * db
end

-- Find nearest palette index for given r,g,b (0..255)
-- Returns index (0..255) matching xterm index semantics (0-based).
local function nearest_index(r, g, b)
    local best_i = 0
    local best_d = nil
    -- iterate using ipairs to avoid nil entries
    for i, p in ipairs(M.PALETTE) do
        -- p must be a table {r,g,b}; unpack safely
        if type(p) == "table" then
            local pr, pg, pb = p[1], p[2], p[3]
            if pr and pg and pb then
                local d = dist2(r, g, b, pr, pg, pb)
                if best_d == nil or d < best_d then
                    best_d = d
                    -- convert Lua 1-based index to xterm 0-based
                    best_i = i - 1
                end
            end
        end
    end
    return best_i
end

-- Public: convert hex string -> nearest xterm-256 index (0..255)
function M.hex_to_cterm(hex)
    local r, g, b = hex_to_rgb(hex)
    if not r then
        return nil
    end
    return nearest_index(r, g, b)
end

M.hex_to_256 = M.hex_to_cterm
M.hex2cterm  = M.hex_to_cterm

return M
