return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        -- check ":h bufferline-configuration" for more options
        options = {
            indicator = { style = 'icon' },
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true
                }
            },
            seperator_style = "padded_slant",
        }
    }
}
