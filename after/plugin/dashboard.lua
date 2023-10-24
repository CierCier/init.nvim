dashboard = require ('dashboard')


dashboard.setup{
    theme = 'hyper',
    disable_move = true,
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
    config = {
        shortcut = {
            { desc = '[  Github]', group = 'DashboardShortCut' },
            { desc = '[  opticXC]', group = 'DashboardShortCut' },
        }
    },
}
