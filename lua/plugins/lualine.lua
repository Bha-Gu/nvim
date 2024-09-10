return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            disable_filetypes = { "neo-tree", "alpha", "dashboard", "Outline" },
            ignore_focus = { "neo-tree" },
            globalstatus = true,
        },
        sections = {
            lualine_z= {
                'location',
                {
                    'datetime',
                    -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
                    style = '%H:%M'
                }
            }
        }
    }
}
