--- Flexible helper to apply window-local visual options.
--- Usage:
---   apply.applyWinHl({ number = false, winhighlight = "Normal:MyNormal" })
---   apply.applyWinHl({ number = true }, "local", 3)

local check = require("newpaper.check")

local M = {}

--- Apply window-local (or global) appearance options.
--- Only the keys present in opts are applied. Unknown keys are ignored.
--- @param opts? table  Table with any of the supported option keys (see ALLOWED_SPEC).
--- @param scope? '"local"'|'"global"'  Optional. "local" (default) to set window-local options, "global" to set global options.
--- @param win? number  Window id when scope == "local". Defaults to current window.
--- @return boolean ok  true if all requested option sets succeeded; false if opts invalid or at least one set failed.
M.applyWinHl = function(opts, scope, win)
    local ALLOWED_SPEC = {
        winhighlight   = "string",
        signcolumn     = "string",
        number         = "boolean",
        relativenumber = "boolean",
        cursorline     = "boolean",
        cursorcolumn   = "boolean",
        foldcolumn     = "string",
        colorcolumn    = "string",
        wrap           = "boolean",
        linebreak      = "boolean",
        winblend       = "number",
    }
    if opts == nil then
        return false
    end

    check.validateApplyWinHl(opts, scope, win, ALLOWED_SPEC)

    scope = scope or "local"
    if scope == "local" then
        win = win or vim.api.nvim_get_current_win()
    end

    local all_ok = true
    for key in pairs(ALLOWED_SPEC) do
        local val = opts[key]
        if val ~= nil then
            local set_opts = { scope = scope }
            if scope == "local" then set_opts.win = win end

            local ok_set, err = pcall(vim.api.nvim_set_option_value, key, val, set_opts)
            if not ok_set then
                all_ok = false
                vim.notify(("newpaper.nvim-applyWinHl: failed to set %s = %s (%s)"):format(
                    key, vim.inspect(val), tostring(err)
                ), vim.log.levels.WARN)
            end
        end
    end
    return all_ok
end

return M
