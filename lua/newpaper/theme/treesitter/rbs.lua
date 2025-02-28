local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constant.builtin.rbs"]            = { link = "@constant.builtin.ruby" },
        ["@function.method.rbs"]             = { link = "@keyword.function" },
        ["@local.definition.type.super.rbs"] = { link = "@local.definition.type.super.ruby" },
        ["@module.rbs"]                      = { link = "@local.definition.namespace" },
    }
end

return M
