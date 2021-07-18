-- Leader key
vim.g.mapleader = ','


--Set tab options for vim
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.cmd[[set linebreak]] -- ne deli reci na kraju reda

--Allow filetype plugins and syntax highlighting
vim.o.autoindent = true

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
--vim.cmd[[set signcolumn=yes]]
vim.wo.wrap = false

--Set show command
vim.o.showcmd = true

vim.cmd[[set undofile]]
vim.cmd[[set undodir=~/.undodir]]
vim.o.backup = false

vim.o.scrolloff = 8
vim.cmd[[set hidden]]
vim.cmd[[set noerrorbells]]
--vim.cmd[[set scrolloff=8]]
--vim.cmd[[abbr :grinningface: 😀]]

-- Open link with gx
vim.g.netrw_browser_viewer = 'firefox'

-- Apearance
vim.o.termguicolors = true
require'color'.setup {}
require'nvim-web-devicons'.setup {default=true}
require'hardline'.setup {}

-- package.loaded['notes'] = nil
-- require('notes')
require('mappings')
vim.cmd[[command! PackerLoad lua require'plugins']]
