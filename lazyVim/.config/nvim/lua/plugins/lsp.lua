-- ~/.config/nvim/lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- 1. Disable pylsp explicitly so it doesn't attach to buffers
                pylsp = {
                    enabled = false,
                    -- 2. Tell LazyVim/Mason NOT to automatically install this server
                    mason = false,
                },

                -- Optional: Ensure ruff and pyright ARE enabled
                pyright = { enabled = true },
                ruff = { enabled = true },
            },
        },
    },
}
