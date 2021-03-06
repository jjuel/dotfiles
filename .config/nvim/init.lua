local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require 'paq-nvim' {
	'savq/paq-nvim';
	'neovim/nvim-lspconfig';
	'nvim-lua/completion-nvim';
	'nvim-treesitter/nvim-treesitter';
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'windwp/nvim-autopairs';
	'navarasu/onedark.nvim';
	'hoob3rt/lualine.nvim';
	'kyazdani42/nvim-web-devicons';
}

g.mapleader = " "

local on_attach = function(client, bufnr)
	require'completion'.on_attach(client, bufnr)
end

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

local lsp = require 'lspconfig'
lsp.rust_analyzer.setup({ on_attach=on_attach })

require('nvim-autopairs').setup()
require('lualine').setup{
	options = {
		theme = 'onedark',
		component_separators = '',
		section_separators = ''
	}
}

cmd 'colorscheme onedark'
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
