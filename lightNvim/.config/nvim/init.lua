-- General
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true        -- This must still be enabled
vim.opt.cursorlineopt = 'number' -- Restricts highlighting to the number column only
vim.opt.swapfile = false
vim.opt.wrap = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual settings
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.winblend = 0
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.completeopt = "noinsert,noselect"

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- INFO: Command-Delete/Left/Right commands are done with iTerm2 shortcuts

-- MacOs style word deletion
vim.keymap.set("i", "<A-BS>", "<C-W>", { desc = "Delete previous word" })

-- MacOs style word navigation
vim.keymap.set("i", "<A-Left>", "<C-Left>", { desc = "Move to previous word" })
vim.keymap.set("i", "<A-Right>", "<C-Right>", { desc = "Move to next word" })

-- MacOs double-space for full stop.
vim.keymap.set("i", "<space><space>", ". ", { desc = "MacOs style full stop" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })

-- Typst Preview
vim.keymap.set("n", "<leader>TP", ":TypstPreview<CR>", { desc = "Open Typst preview" })
vim.keymap.set("n", "<leader>TS", ":TypstPreviewStop<CR>", { desc = "Close Typst preview" })

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)
		end
	end,
})


-- Package installation
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/Freedzone/kerbovim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/lervag/vimtex" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

-- Package activation
require("mini.pick").setup()
require("todo-comments").setup()
require("lualine").setup({ sections = { lualine_y = { "lsp_status" } } })
require("gitsigns").setup()
local ls = require("luasnip")
local types = require("luasnip.util.types")
ls.config.set_config {
	keep_roots = true,
	link_roots = true,
	link_children = true,
	history = true,
	updateevents = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
}
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets/"})
require("nvim-treesitter").setup({
	build = ':TSUpdate',
	ensure_installed = {
		'lua'
	},
	auto_install = false,
	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_progname = "nvr"
vim.opt.conceallevel = 1
vim.g.tex_conceal = "abdmg"

-- Language servers
vim.lsp.enable({ 'clangd', 'lua_ls', 'basedpyright', 'texlab', 'bashls', 'tinymist' })

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})

-- Luasnip keymaps
vim.cmd[[
   " Vimscript goes here!" Expand or jump in insert mode
	imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
	" Jump forward through tabstops in visual mode
	smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump
	" Jump backward through snippet tabstops with Shift-Tab (for example)
	imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
	smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'-next' : '<Tab>'
]]
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
vim.keymap.set({ "i" }, "<leader><leader>so", "<cmd>source ~/.config/nvim/snippets.lua")

-- Colorscheme & background
vim.cmd.colorscheme("catppuccin-macchiato")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = ""    -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])

-- Alternative navigation (more intuitive)
vim.keymap.set("n", "<leader>TN", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>TX", ":tabclose<CR>", { desc = "Close tab" })

-- Tab moving
vim.keymap.set("n", "<leader>TM", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>T>", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>T<", ":tabmove -1<CR>", { desc = "Move tab left" })

-- Function to open file in new tab
local function open_file_in_tab()
	vim.ui.input({ prompt = "File to open in new tab: ", completion = "file" }, function(input)
		if input and input ~= "" then
			vim.cmd("tabnew " .. input)
		end
	end)
end

-- Function to duplicate current tab
local function duplicate_tab()
	local current_file = vim.fn.expand("%:p")
	if current_file ~= "" then
		vim.cmd("tabnew " .. current_file)
	else
		vim.cmd("tabnew")
	end
end

-- Function to close tabs to the right
local function close_tabs_right()
	local current_tab = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")

	for i = last_tab, current_tab + 1, -1 do
		vim.cmd(i .. "tabclose")
	end
end

-- Function to close tabs to the left
local function close_tabs_left()
	local current_tab = vim.fn.tabpagenr()

	for _ = current_tab - 1, 1, -1 do
		vim.cmd("1tabclose")
	end
end

-- Enhanced keybindings
vim.keymap.set("n", "<leader>TO", open_file_in_tab, { desc = "Open file in new tab" })
vim.keymap.set("n", "<leader>TD", duplicate_tab, { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>TR", close_tabs_right, { desc = "Close tabs to the right" })
vim.keymap.set("n", "<leader>TL", close_tabs_left, { desc = "Close tabs to the left" })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
	local buffers_in_tab = #vim.fn.tabpagebuflist()
	if buffers_in_tab > 1 then
		vim.cmd("bdelete")
	else
		-- If it's the only buffer in tab, close the tab
		vim.cmd("tabclose")
	end
end
vim.keymap.set("n", "<leader>bd", smart_close_buffer, { desc = "Smart close buffer/tab" })
