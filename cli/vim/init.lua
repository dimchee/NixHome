--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set tab options for vim
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.cmd[[set linebreak]] -- ne deli reci na kraju reda

--Allow filetype plugins and syntax highlighting
vim.o.autoindent = true
vim.o.smartindent = true

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
-- vim.o.updatetime = 250
-- vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

--Set show command
vim.o.showcmd = true

vim.cmd[[set undofile]]
vim.cmd[[set undodir=~/.undodir]]
vim.o.backup = false

--Do not save when switching buffers
vim.o.hidden = true

vim.o.scrolloff = 8
vim.cmd[[set noerrorbells]]
--vim.cmd[[set scrolloff=8]]
--vim.cmd[[abbr :grinningface: 😀]]

-- Case insensitice searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Open link with gx
vim.g.netrw_browser_viewer = 'firefox'


-- package.loaded['notes'] = nil
-- require('notes')

require('mappings')
vim.cmd[[command! PackerLoad lua require'plugins']]

-- disable vim deprecated plugins
vim.g.loaded_spec              = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
