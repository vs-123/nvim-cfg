vim.o.nu = true
vim.o.rnu = true

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 3
vim.o.shiftwidth = 3

vim.o.mouse = 'a'
vim.o.scrolloff = 3

vim.o.virtualedit = "all"
vim.o.swapfile = false

vim.cmd('syntax on')

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>l', ':tabn<CR>')
vim.keymap.set('n', '<leader>h', ':tabp<CR>')

vim.keymap.set('n', '<leader>.', ':tabn<CR>')
vim.keymap.set('n', '<leader>,', ':tabp<CR>')

vim.keymap.set('n', '<leader>n', ':tabnew<CR>')
vim.keymap.set('n', '<leader>q', ':tabclose<CR>')

vim.cmd("call plug#begin()")
vim.cmd("Plug 'neovim/nvim-lspconfig'")
vim.cmd("Plug 'hrsh7th/nvim-cmp'")
vim.cmd("Plug 'hrsh7th/cmp-nvim-lsp'")
vim.cmd("Plug 'hrsh7th/cmp-buffer'")
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")
vim.cmd("call plug#end()")

vim.lsp.config.clangd = {
   root_markers={'.git/'},
   filetypes={'c'},
}

vim.lsp.enable('clangd')

vim.cmd("autocmd FileType c lua vim.b.treesitter_language = 'c'")

vim.diagnostic.config({virtual_text=false, signs=false})

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-A-i>'] = cmp.mapping.complete(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
	},
	window={completion={max_height = 7}},
	sources={{name="nvim_lsp"}},
	completion = { autocomplete = false, keyword_length = 2 },
})

vim.cmd("set completeopt=menuone")

