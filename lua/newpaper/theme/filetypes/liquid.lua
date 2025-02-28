local M = {}

function M.setup(configColors, configStyle)
    local newpaper = configColors
    local style    = configStyle

    return {
        liquidDelimiter        = { fg = newpaper.jinja_red },
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
        liquidForloop          = { fg = newpaper.keywords, style = style.k_style },
        liquidForloopAttribute = { fg = newpaper.ruby_navy, style = style.k_style },
    }
end

return M
