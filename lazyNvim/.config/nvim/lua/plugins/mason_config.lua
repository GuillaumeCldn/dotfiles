return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {
            "stylua",
            "lua-language-server",
            "shellcheck",
            "shfmt",
        },
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}
