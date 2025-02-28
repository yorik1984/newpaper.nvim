local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@constant.builtin.ruby"]              = { fg = newpaper.ruby_maroon, nocombine = true },
        ["@constant.predef.ruby"]               = { fg = newpaper.ocean, style = style.k_style, nocombine = true },
        ["@constructor.ruby"]                   = { fg = newpaper.blue, style = style.o_style },
        ["@function.call.ruby"]                 = { fg = newpaper.ruby_navy, style = style.f_style },
        ["@function.builtin.ruby"]              = { fg = newpaper.redorange, style = style.f_style },
        ["@label.ruby"]                         = { fg = newpaper.tex_magenta, style = style.doc_style, nocombine = true },
        ["@local.definition.var.ruby"]          = { fg = newpaper.ruby_orange, style = style.v_style },
        ["@markup.italic.ruby"]                 = { style = style.none, nocombine = true },
        ["@type.ruby"]                          = { fg = newpaper.darkgreen, nocombine = true },
        ["@variable.global.predef.ruby"]        = { fg = newpaper.olive, style = style.k_style, nocombine = true },
        ["@variable.member.instance.ruby"]      = { fg = newpaper.darkengreen, nocombine = true },
        ["@variable.member.ruby"]               = { fg = newpaper.ocean, style = style.k_style, nocombine = true },

        ["@local.definition.type.super.ruby"]   = { fg = newpaper.navy, style = style.k_style },

        -- LSP semantic tokens
        ["@lsp.type.method.ruby"]               = { default = true },
        ["@lsp.type.namespace.ruby"]            = { default = true },
        ["@lsp.typemod.class.declaration.ruby"] = { link = "@local.definition.type" },

        -- embedded template
        ["@keyword.embedded_template"]          = { fg = newpaper.redorange, nocombine = true },
    }
end

return M
