-- General --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true

-- Keymaps --
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

-- TODO: Lualine config --
-- Package installation --
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/xiyaowong/transparent.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

-- Package activation --
require("mini.pick").setup()
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup()
require("transparent").setup({ extra_groups = { "NormalFloat" } })
require("todo-comments").setup()

-- TODO: Python code highlighting is still limited --
-- Language servers --
vim.lsp.config("lua_ls", { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } } })

-- Colorscheme --
vim.cmd.colorscheme("catppuccin-macchiato")

-- Status line --
vim.cmd(":hi statusline guibg=NONE")
