--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set tab options for vim
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
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

vim.tbl_foreach = table.foreach 

vim.g.mapleader = ','
vim.g.maplocalleader = ','
local keymap = vim.api.nvim_set_keymap
local k_opts = { silent=true }
--keymap("n", "<C-b>", ":Telescope buffers show_all_buffers=true<cr>", k_opts)
keymap("n", "<leader>R", ":luafile ~/NixHome/home/vim/init.lua<cr>", k_opts)
keymap("n", "<space><space>", "<cmd>nohls<cr>", k_opts)
--keymap("n", "gzn", ":lua New_note('~/Library/Neuron')<CR>", {silent=true})
--keymap("n", "<CR>", ":lua On_enter()<CR>", {silent=true})

vim.cmd[[command! PackerLoad lua require'plugins']]
vim.cmd[[
augroup filetypedetect
au BufNewFile,BufRead *.lean	setf lean
augroup END
]]

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

function Markdownify()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local ln = vim.api.nvim_get_current_line()
    vim.api.nvim_set_current_line(ln:sub(1, col+1)
        .. '[]('..vim.fn.getreg'+' .. ')'
        .. ln:sub(col+2, #ln + 1)
    )
    vim.api.nvim_win_set_cursor(0, {row, col + 2})
    vim.cmd'startinsert'
end
keymap("n", "mp", "<cmd>lua Markdownify()<cr>", k_opts)

