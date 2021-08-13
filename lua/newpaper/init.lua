local util = require('newpaper.util')

-- Load the theme
local set = function ()
    util.load()
end

return { set = set }
