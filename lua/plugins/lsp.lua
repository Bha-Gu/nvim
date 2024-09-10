return {
    {
        "neovim/nvim-lspconfig", -- Core LSP plugin
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
            "nvim-lua/plenary.nvim",
            "j-hui/fidget.nvim",
        },
        config = function()
            local lspconfig = require('lspconfig')
            local mason = require('mason')
            local mason_lspconfig = require('mason-lspconfig')
            local none_ls = require('null-ls')
            local fidget = require('fidget')

            -- Mason setup
            mason.setup()

            -- Mason-lspconfig setup
            mason_lspconfig.setup({
                ensure_installed = { "pyright", "lua_ls", "ruff" },
            })


            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        flags = { debounce_text_changes = 150 },
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }, -- Recognize `vim` as a global variable in Lua
                                },
                            },
                        },
                    })
                end,
            })
            none_ls.setup({
                sources = {
                    none_ls.builtins.formatting.stylua, -- cargo install stylau
                    none_ls.builtins.completion.spell,
                },
            })
            fidget.setup()
        end,
    },
}
