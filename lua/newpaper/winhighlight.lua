--- Flexible helper to apply window-local visual options.
--- Delegates all validation and error message formatting to apply_winhl_errors module.
---
--- Usage:
---   apply.applyWinHl({ number = false, winhighlight = "Normal:MyNormal" })
---   apply.applyWinHl({ number = true }, "local", 3)
---   -- with custom error messages:
---   local my_errs = require("apply_winhl_errors").default_errs()
---   my_errs.expect_boolean = "MyMod: '%s' must be boolean, got %s"
---   apply.applyWinHl({ number = "no" }, "local", 3, my_errs)
---

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
        foldcolumn     = "number_or_string",
        colorcolumn    = "string",
        wrap           = "boolean",
        linebreak      = "boolean",
        winblend       = "number",
    }
    local ok, errmsg = check.validateApplyWinHl(opts, scope, win, ALLOWED_SPEC)
    if not ok then
        if errmsg then
            error(errmsg)
        end
        return false
    end

    -- At this point validation passed (or opts was nil and validate returned false,nil)
    -- If opts was nil, validator would have returned false,nil; handle that:
    if not opts or type(opts) ~= "table" then
        return false
    end

    scope = scope or "local"
    if scope == "local" then
        win = win or vim.api.nvim_get_current_win()
    end

    local all_ok = true
    for key, spec in pairs(ALLOWED_SPEC) do
        local val = opts[key]
        if val ~= nil then
            local set_opts = { scope = scope }
            if scope == "local" then set_opts.win = win end
            -- Safe call to nvim_set_option_value to avoid hard crash on unsupported options
            local ok_set, err = pcall(vim.api.nvim_set_option_value, key, val, set_opts)
            if not ok_set then
                all_ok = false
                vim.notify(("newpaper-applyWinHl: failed to set %s = %s (%s)"):format(key, vim.inspect(val), tostring(err)),
                    vim.log.levels.WARN)
            end
        end
    end

    return all_ok
end

return M
