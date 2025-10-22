local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        ["@variable"]                               = { fg = newpaper.variables, style = style.v_style },
        ["@variable.builtin"]                       = { fg = newpaper.ruby_maroon, style = style.v_style, nocombine = true },
        ["@variable.parameter"]                     = { fg = newpaper.orange },
        ["@variable.member"]                        = { fg = newpaper.bluegreen },
        ["@variable.global"]                        = { fg = newpaper.neovim_green, style = style.k_style },

        ["@constant"]                               = { fg = newpaper.darkgreen, nocombine = true },
        ["@constant.builtin"]                       = { fg = newpaper.maroon },
        ["@constant.macro"]                         = { fg = newpaper.tex_maroon, nocombine = true },

        ["@module"]                                 = { fg = newpaper.darkyellow },
        ["@module.builtin"]                         = { fg = newpaper.tex_magenta },
        ["@label"]                                  = { fg = newpaper.redorange },

        ["@string"]                                 = { fg = newpaper.strings, style = style.s_style },
        ["@string.documentation"]                   = { fg = newpaper.regexp_blue, style = style.s_style },
        ["@string.regexp"]                          = { fg = newpaper.regexp_blue },
        ["@string.escape"]                          = { fg = newpaper.tex_magenta, nocombine = true },
        ["@string.special"]                         = { fg = newpaper.dark_maroon, style = style.s_style },
        ["@string.special.symbol"]                  = { fg = newpaper.darkyellow },
        ["@string.special.url"]                     = { fg = newpaper.strings, style = style.links, nocombine = true },
        ["@string.special.path"]                    = { fg = newpaper.teal, style = style.links, nocombine = true },

        ["@character"]                              = { fg = newpaper.orange, nocombine = true },
        ["@character.special"]                      = { fg = newpaper.maroon, nocombine = true },

        ["@boolean"]                                = { fg = newpaper.booleans, style = style.bool_style },
        ["@number"]                                 = { fg = newpaper.numbers },
        ["@number.float"]                           = { fg = newpaper.magenta },

        ["@type"]                                   = { fg = newpaper.darkengreen },
        ["@type.builtin"]                           = { fg = newpaper.olive },
        ["@type.definition"]                        = { fg = newpaper.maroon },

        ["@attribute"]                              = { fg = newpaper.blue },
        ["@attribute.builtin"]                      = { fg = newpaper.python_blue },
        ["@property"]                               = { fg = newpaper.darkgreen },

        ["@function"]                               = { fg = newpaper.lua_navy, style = style.f_style },
        ["@function.builtin"]                       = { fg = newpaper.tex_red, style = style.f_style },
        ["@function.call"]                          = { fg = newpaper.tag_navy, style = style.f_style },
        ["@function.macro"]                         = { fg = newpaper.magenta, style = style.f_style },

        ["@function.method"]                        = { fg = newpaper.ruby_navy, style = style.f_style },
        ["@function.method.call"]                   = { fg = newpaper.navy, style = style.f_style },

        ["@constructor"]                            = { fg = newpaper.tex_lightpurple },
        ["@operator"]                               = { fg = newpaper.navy, style = style.o_style },
        ["@operator.math"]                          = { fg = newpaper.tex_olive, style = style.o_style, nocombine = true },
        ["@operator.boolean"]                       = { fg = newpaper.booleans, style = style.bool_o_style, nocombine = true },

        ["@keyword"]                                = { fg = newpaper.keywords, style = style.k_style },
        ["@keyword.coroutine"]                      = { fg = newpaper.tex_keyword, style = style.k_style },
        ["@keyword.function"]                       = { fg = newpaper.darkpurple, style = style.k_style },
        ["@keyword.operator"]                       = { fg = newpaper.lua_navy, style = style.k_style },
        ["@keyword.import"]                         = { fg = newpaper.redorange, nocombine = true },
        ["@keyword.type"]                           = { fg = newpaper.ruby_purple, style = style.k_style },
        ["@keyword.modifier"]                       = { fg = newpaper.ruby_maroon, style = style.k_style },
        ["@keyword.repeat"]                         = { fg = newpaper.keywords, style = style.k_style },
        ["@keyword.return"]                         = { fg = newpaper.tex_keyword, style = style.k_style },
        ["@keyword.exception"]                      = { fg = newpaper.redorange, style = style.k_style },
        ["@keyword.debug"]                          = { fg = newpaper.red, style = style.k_style },

        ["@keyword.conditional"]                    = { fg = newpaper.keywords, style = style.k_style },
        ["@keyword.conditional.ternary"]            = { fg = newpaper.keywords, style = style.k_style },

        ["@keyword.directive"]                      = { fg = newpaper.navy, style = style.k_style },
        ["@keyword.directive.define"]               = { fg = newpaper.magenta, style = style.k_style },

        ["@punctuation.delimiter"]                  = { fg = newpaper.persimona, style = style.d_style },
        ["@punctuation.bracket"]                    = { fg = newpaper.ruby_navy, style = style.br_style },
        ["@punctuation.special"]                    = { fg = newpaper.lightmagenta },

        ["@comment"]                                = { fg = newpaper.comments, style = style.c_style },
        ["@comment.documentation"]                  = { fg = newpaper.doc_comments, style = style.doc_style, nocombine = true },

        ["@comment.error"]                          = { fg = newpaper.bg, bg = newpaper.todo_error, style = style.b_bold },
        ["@comment.warning"]                        = { fg = newpaper.bg, bg = newpaper.todo_warn, style = style.b_bold },
        ["@comment.todo"]                           = { fg = newpaper.bg, bg = newpaper.todo_info, style = style.b_bold },
        ["@comment.note"]                           = { fg = newpaper.bg, bg = newpaper.todo_hint, style = style.b_bold },

        ["@markup.strong"]                          = { style = style.bold },
        ["@markup.italic"]                          = { style = style.italic },
        ["@markup.strikethrough"]                   = { style = style.strike },
        ["@markup.underline"]                       = { style = style.underline },

        ["@markup.heading"]                         = { fg = newpaper.titles, style = style.b_bold },
        ["@markup.heading.1"]                       = { fg = newpaper.tex_part_title, style = style.k_style },
        ["@markup.heading.2"]                       = { fg = newpaper.teal, style = style.k_style },
        ["@markup.heading.3"]                       = { fg = newpaper.blue, style = style.k_style },
        ["@markup.heading.4"]                       = { fg = newpaper.tex_math, style = style.k_style },
        ["@markup.heading.5"]                       = { fg = newpaper.tex_lightpurple, style = style.k_style },
        ["@markup.heading.6"]                       = { fg = newpaper.tex_darkorange, style = style.k_style },
        ["@markup.heading.1.marker"]                = { fg = newpaper.tex_part_title },
        ["@markup.heading.2.marker"]                = { fg = newpaper.teal },
        ["@markup.heading.3.marker"]                = { fg = newpaper.blue },
        ["@markup.heading.4.marker"]                = { fg = newpaper.tex_math },
        ["@markup.heading.5.marker"]                = { fg = newpaper.tex_lightpurple },
        ["@markup.heading.6.marker"]                = { fg = newpaper.tex_darkorange },

        ["@markup.quote"]                           = { fg = newpaper.tex_navy, style = style.italic },
        ["@markup.quote.marker"]                    = { fg = newpaper.tex_navy, style = style.o_style },
        ["@markup.math"]                            = { fg = newpaper.tex_math, nocombine = true },

        ["@markup.link"]                            = { fg = newpaper.tex_lightviolet },
        ["@markup.link.url"]                        = { fg = newpaper.links, style = style.links },
        ["@markup.link.label"]                      = { fg = newpaper.tex_maroon },

        ["@markup.raw"]                             = { fg = newpaper.regexp_blue, nocombine = true },
        ["@markup.raw.block"]                       = { fg = newpaper.regexp_blue, nocombine = true },
        ["@markup.raw.delimiter"]                   = { fg = newpaper.magenta, style = style.o_style },

        ["@markup.list"]                            = { fg = newpaper.keywords, style = style.o_bold },
        ["@markup.list.checked"]                    = { fg = newpaper.todo_hint, style = style.b_bold },
        ["@markup.list.unchecked"]                  = { fg = newpaper.comments },

        ["@diff.plus"]                              = { fg = newpaper.git_added },
        ["@diff.minus"]                             = { fg = newpaper.git_removed },
        ["@diff.delta"]                             = { fg = newpaper.git_modified },

        ["@tag"]                                    = { fg = newpaper.keywords, style = style.tags_style },
        ["@tag.builtin"]                            = { fg = newpaper.ruby_maroon },
        ["@tag.attribute"]                          = { fg = newpaper.darkengreen },
        ["@tag.delimiter"]                          = { fg = newpaper.tags, style = style.tb_style },

        ["@none"]                                   = { fg = newpaper.disabled },
        ["@conceal"]                                = { fg = newpaper.tex_math },

        -- Locals
        ["@local.definition"]                       = { fg = newpaper.fg, style = style.v_style },
        ["@local.definition.constant"]              = { fg = newpaper.darkgreen, nocombine = true },
        ["@local.definition.function"]              = { fg = newpaper.lua_navy, style = style.f_style },
        ["@local.definition.method"]                = { fg = newpaper.ruby_navy, style = style.f_style },
        ["@local.definition.var"]                   = { fg = newpaper.tex_math, style = style.v_style },
        ["@local.definition.parameter"]             = { fg = newpaper.darkorange, style = style.v_style },
        ["@local.definition.macro"]                 = { fg = newpaper.lightmagenta },
        ["@local.definition.type"]                  = { fg = newpaper.ruby_navy, style = style.k_style },
        ["@local.definition.field"]                 = { fg = newpaper.tex_teal },
        ["@local.definition.enum"]                  = { fg = newpaper.blue },
        ["@local.definition.namespace"]             = { fg = newpaper.blue, style = style.k_style },
        ["@local.definition.import"]                = { fg = newpaper.olive },
        ["@local.definition.associated"]            = { fg = newpaper.bluegreen },

        -- TODO: Add more groups
        -- INFO: https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight

        -- LSP semantic tokens

        ["@lsp.type.boolean"]                       = { link = "@boolean" },
        ["@lsp.type.builtinType"]                   = { link = "@type.builtin" },
        ["@lsp.type.class"]                         = { link = "@keyword.directive" },
        ["@lsp.type.comment"]                       = { default = true },
        ["@lsp.type.decorator"]                     = { link = "@function.builtin" },
        ["@lsp.type.enum"]                          = { link = "@label" },
        ["@lsp.type.enumMember"]                    = { link = "@constant" },
        ["@lsp.type.escapeSequence"]                = { link = "@string.escape" },
        ["@lsp.type.event"]                         = { link = "@type" },
        ["@lsp.type.formatSpecifier"]               = { link = "@punctuation" },
        ["@lsp.type.function"]                      = { link = "@function" },
        ["@lsp.type.interface"]                     = { link = "@keyword.function" },
        ["@lsp.type.keyword"]                       = { link = "@keyword" },
        ["@lsp.type.macro"]                         = { link = "@function.macro" },
        ["@lsp.type.method"]                        = { link = "@function.method" },
        ["@lsp.type.modifier"]                      = { link = "@type" },
        ["@lsp.type.namespace"]                     = { link = "@module" },
        ["@lsp.type.number"]                        = { link = "@number" },
        ["@lsp.type.operator"]                      = { link = "@operator" },
        ["@lsp.type.parameter"]                     = { link = "@variable.parameter" },
        ["@lsp.type.property"]                      = { link = "@variable.member" },
        ["@lsp.type.regexp"]                        = { link = "@string.regexp" },
        ["@lsp.type.selfKeyword"]                   = { link = "@variable.builtin" },
        ["@lsp.type.string"]                        = { link = "@string" },
        ["@lsp.type.struct"]                        = { link = "@string.special.symbol" },
        ["@lsp.type.type"]                          = { link = "@type" },
        ["@lsp.type.typeAlias"]                     = { link = "@type" },
        ["@lsp.type.typeParameter"]                 = { link = "@local.definition.parameter" },
        ["@lsp.type.variable"]                      = { link = "@variable" },
        ["@lsp.type.unresolvedReference"]           = { link = "Error" },

        ["@lsp.mod.defaultLibrary"]                 = { link = "@variable.builtin" },

        ["@lsp.typemod.class.declaration"]          = { link = "@keyword.directive" },
        ["@lsp.typemod.class.defaultLibrary"]       = { link = "@type.builtin" },
        ["@lsp.typemod.class.default_library"]      = { link = "@type.builtin" },
        ["@lsp.typemod.enum.defaultLibrary"]        = { link = "@type.builtin" },
        ["@lsp.typemod.enum.default_library"]       = { link = "@type.builtin" },
        ["@lsp.typemod.enumMember.defaultLibrary"]  = { link = "@constant.builtin" },
        ["@lsp.typemod.enumMember.default_library"] = { link = "@constant.builtin" },
        ["@lsp.typemod.function.defaultLibrary"]    = { link = "@function.builtin" },
        ["@lsp.typemod.function.default_library"]   = { link = "@function.builtin" },
        ["@lsp.typemod.keyword.async"]              = { link = "@keyword.coroutine" },
        ["@lsp.typemod.macro.defaultLibrary"]       = { link = "@function.builtin" },
        ["@lsp.typemod.macro.default_library"]      = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"]      = { link = "@function.builtin" },
        ["@lsp.typemod.method.default_library"]     = { link = "@function.builtin" },
        ["@lsp.typemod.namespace.declaration"]      = { link = "@local.definition.namespace" },
        ["@lsp.typemod.operator.injected"]          = { link = "@operator" },
        ["@lsp.typemod.parameter.declaration"]      = { link = "@variable.parameter" },
        ["@lsp.typemod.string.injected"]            = { link = "@string" },
        ["@lsp.typemod.type.defaultLibrary"]        = { link = "@type.builtin" },
        ["@lsp.typemod.type.default_library"]       = { link = "@type.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"]    = { link = "@constant.builtin" },
        ["@lsp.typemod.variable.default_library"]   = { link = "@constant.builtin" },
        ["@lsp.typemod.variable.definition"]        = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.global"]            = { link = "@module.builtin" },
        ["@lsp.typemod.variable.injected"]          = { link = "@variable" },
    }
end

return M
