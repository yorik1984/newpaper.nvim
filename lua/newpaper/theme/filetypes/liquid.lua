local M = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local liquidSyn  = {}
    liquidSyn.colors = configColors
    liquidSyn.style  = configStyle
    local newpaper   = liquidSyn.colors
    local style      = liquidSyn.style

    liquidSyn.loadSyntax = function()
        local syntax = {
            liquidDelimiter        = { fg = newpaper.redorange },
            -- liquidComment          Comment
            -- liquidTypeHighlight    Type
            -- liquidConditional      Conditional
            -- liquidRepeat           Repeat
            -- liquidKeyword          Keyword
            -- liquidOperator         Operator
            -- liquidString           String
            -- liquidQuote            Delimiter
            -- liquidNumber           Number
            -- liquidFloat            Float
            -- liquidEmpty            liquidNull
            -- liquidNull             liquidBoolean
            -- liquidBoolean          Boolean
            liquidFilter           = { fg = newpaper.ruby_navy, style = style.f_style },
            liquidForloop          = { fg = newpaper.keyword, style = style.k_style },
            liquidForloopAttribute = { fg = newpaper.ruby_navy, style = style.k_style },
        }
        return syntax
    end

    -- stylua: ignore end

    return liquidSyn
end

return M
