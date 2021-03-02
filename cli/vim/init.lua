local keymap = vim.api.nvim_set_keymap

--Set tab options for vim
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

--Allow filetype plugins and syntax highlighting
vim.o.autoindent = true

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Set show command
vim.o.showcmd = true

vim.cmd[[ set undofile]]
vim.cmd[[ set undodir=~/.undodir]]
vim.o.backup = false


-- Plugins
local packer_dir = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
  vim.api.nvim_command(
    '!git clone https://github.com/wbthomason/packer.nvim '..packer_dir
  )
end
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    local use = require('packer').use
    use {'wbthomason/packer.nvim', opt = true}
    use {'lervag/vimtex', ft = {'tex'}}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    
    use {'npxbr/gruvbox.nvim',
        requires = {{'rktjmp/lush.nvim'}}
    }
    use {'ojroques/nvim-hardline'}
    --use {'romgrk/barbar.nvim',
    --    requires = {{'kyazdani42/nvim-web-devicons'}}
    --}
    
    use {'JuliaEditorSupport/julia-vim'}
    use {'LnL7/vim-nix'}
    use {'oberblastmeister/neuron.nvim'} -- note taking
end)

require('hardline').setup {}
keymap("n", "<C-f>", ":Telescope find_files<cr>", {silent=true})

--vim.o.termguicolors = true
--vim.g.onedark_terminal_italics = 2
--vim.cmd([[colorscheme gruvbox]])
--vim.cmd([[highlight Normal ctermbg=none]])

require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/Library/Neuron",
    leader = "gz", -- the leader key to for all mappings, remember 'go zettel'
}

require'lspconfig'.ccls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.rnix.setup{}
system_name = "Linux"
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.elmls.setup{}
require'lspconfig'.pyls.setup{}

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

vim.g['vimtex_compiler_method'] = 'tectonic'
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_view_automatic'] = true 
