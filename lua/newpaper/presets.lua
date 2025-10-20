local M = {}

--- @return table<string, any>
function M.lazygitWinHl()
    local winhl_entries = {
        "Normal:NormalTerm",
        "NormalFloat:NormalTermFloat",
        "FloatBorder:FloatBorderTerm",
        "SignColumn:SignColumnTerm",
        "LineNr:LineNrTerm",
        "FoldColumn:FoldColumnTerm",
        "TermCursor:TermCursorTerm",
        "TermCursorNC:TermCursorNCTerm",
        "CursorLine:CursorLineTerm",
    }

    local opts = {
        winhighlight = table.concat(winhl_entries, ","),
        signcolumn   = "no",
        foldcolumn   = "0",
        cursorline   = false,
        number       = false,
    }

    return opts
end

--- @return table<string, any>
function M.sidebar()
    local winhl_entries = {
        "Normal:NormalContrastSB",
        "SignColumn:SignColumnSB",
        "LineNr:LineNrSB",
        "FoldColumn:FoldColumnSB",
        "CursorLineNr:CursorLineSignSB",
        "CursorLine:CursorLineSB",
        "CursorLineSign:CursorLineSignSB",
    }

    local opts = {
        winhighlight = table.concat(winhl_entries, ","),
        signcolumn   = "yes:1",
        number       = false,
        foldcolumn   = "0",
    }

    return opts
end

--- @return table<string, any>
function M.text()
    local winhl_entries = {
        "Normal:NormalText",
        "SignColumn:SignColumnText",
        "LineNr:LineNrText",
        "FoldColumn:FoldColumnText",
        "CursorLine:CursorLineText",
        "CursorLineNr:CursorLineNrText",
        "CursorLineSign:CursorLineSignText",
        "CursorLineFold:CursorLineFoldText",
        "WinBar:WinBarText",
        "WinBarNC:WinBarNCText",
        "Visual:VisualText",
        "VisualNOS:VisualNOSText",
        "NonTextVisual:NonTextVisualText",
    }

    local opts = {
        winhighlight = table.concat(winhl_entries, ","),
        signcolumn   = "yes:1",
        foldcolumn   = "auto:1",
        wrap         = true,
        linebreak    = true,
    }

    return opts
end

--- @return table<string, any>
function M.task()
    local winhl_entries = {
        "Normal:NormalTask",
        "SignColumn:SignColumnTask",
        "LineNr:LineNrTask",
        "FoldColumn:FoldColumnTask",
        "CursorLine:CursorLineTask",
        "CursorLineNr:CursorLineNrTask",
        "CursorLineSign:CursorLineSignTask",
        "CursorLineFold:CursorLineFoldTask",
        "WinBar:WinBarTask",
        "WinBarNC:WinBarNCTask",
        "Visual:VisualTask",
        "VisualNOS:VisualNOSTask",
        "NonTextVisual:NonTextVisualTask",
    }

    local opts = {
        winhighlight = table.concat(winhl_entries, ","),
        signcolumn   = "yes:1",
        foldcolumn   = "auto:1",
        wrap         = true,
        linebreak    = true,
    }

    return opts
end

--- @return table<string, any>
function M.view()
    local winhl_entries = {
        "Normal:NormalText",
        "SignColumn:SignColumnText",
        "LineNr:LineNrText",
        "FoldColumn:FoldColumnText",
        "CursorLine:CursorLineText",
        "CursorLineNr:CursorLineNrText",
        "CursorLineSign:CursorLineSignText",
        "CursorLineFold:CursorLineFoldText",
        "WinBar:WinBarText",
        "WinBarNC:WinBarNCText",
        "Visual:VisualText",
        "VisualNOS:VisualNOSText",
        "NonTextVisual:NonTextVisualText",
    }

    local opts = {
        winhighlight = table.concat(winhl_entries, ","),
        signcolumn   = "yes:1",
        foldcolumn   = "auto:1",
        number       = false,
        wrap         = true,
        linebreak    = true,
    }

    return opts
end

return M
