local M = {}

local function onColorScheme()
    pcall(vim.api.nvim_clear_autocmds, { group = "newpaper" })
end

function M.setup(config, color)
    local group = vim.api.nvim_create_augroup("newpaper", {})

    vim.api.nvim_create_autocmd({ "ColorSchemePre" }, {
        group = group,
        pattern = { "*" },
        callback = function()
            onColorScheme()
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
            if color then
                vim.b.terminal_color_1  = color.git_removed
                vim.b.terminal_color_2  = color.git_added
                vim.b.terminal_color_15 = color.git_fg
            end
        end,
    })

    if config and config.sidebars_contrast then
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
end

return M
