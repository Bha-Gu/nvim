return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        -- check ":h bufferline-configuration" for more options
        options = {
            indicator = { style = 'icon', icon = "|" },
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true
                }
            },
            separator_style = "slant",
            show_close_icons = false,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
        },
            highlights = {
            -- Custom highlight for the underline of the selected buffer
            indicator_visible = {
                fg = '#ff0000',
                bg = '#00ff00',
            },
            indicator_selected = {
                fg = '#0000ff',
                bg = '#ff00ff',
            },
        },
    },
}
