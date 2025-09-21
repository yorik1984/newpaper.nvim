local M = {}

function M.setup(colors)
    vim.g.terminal_color_0  = colors.black
    vim.g.terminal_color_1  = colors.maroon
    vim.g.terminal_color_2  = colors.darkgreen
    vim.g.terminal_color_3  = colors.darkorange
    vim.g.terminal_color_4  = colors.navy
    vim.g.terminal_color_5  = colors.purple
    vim.g.terminal_color_6  = colors.teal
    vim.g.terminal_color_7  = colors.bg
    vim.g.terminal_color_8  = colors.darkgrey
    vim.g.terminal_color_9  = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.orange
    vim.g.terminal_color_12 = colors.lightblue
    vim.g.terminal_color_13 = colors.lightmagenta
    vim.g.terminal_color_14 = colors.blue
    vim.g.terminal_color_15 = colors.fg
end

return M
