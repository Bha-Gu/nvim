local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
        ensure_installed = { "lua", "rust", "bash", "csv", "html", "json", "css", "python", "zig" },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = { enable = true, disable = {} },
    },
}

return { M }
