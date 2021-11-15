local fn = vim.fn

local packer_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_url = 'https://github.com/wbthomason/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
    fn.system {'git', 'clone', packer_url, packer_path}
end
vim.api.nvim_command'packadd packer.nvim'

require'packer'.startup(function(use)
    use {'wbthomason/packer.nvim', opt=true}
    use {'lervag/vimtex', ft='tex',
    	setup = require'latex'.setup,
    	config = require'latex'.config
    }
    use {'nvim-treesitter/nvim-treesitter',
        config = require'treesitter'.config
    }
    use {'jghauser/follow-md-links.nvim',
        config = function()
            require('follow-md-links')
            vim.api.nvim_set_keymap('', '<bs>', ':edit #<cr>', {noremap = true, silent = true})
        end
    }
    use {'onsails/lspkind-nvim', requires={'neovim/nvim-lspconfig'},
        config = function() require('lspkind').init {with_text = false} end
    }
    use {'neovim/nvim-lspconfig', cmd='LspStart',
		module = 'lspconfig', config = require'lsp'.config
	}
    use {'L3MON4D3/LuaSnip', module='luasnip'}
    use {'hrsh7th/cmp-nvim-lsp', module='cmp_nvim_lsp'}
    use {'hrsh7th/nvim-cmp',
        requires = require'completion'.requires,
        module = 'cmp', cmd = 'CmpLoad', opt=true,
        config = require'completion'.config
    }
    use {'lukas-reineke/indent-blankline.nvim',
    	config = require'indent'.config
    }
    use {'nvim-telescope/telescope.nvim',
        -- keys = require'tele'.keys,
        cmd = {'Telescope'},
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        module = 'telescope',
        setup = require'tele'.setup
    }

    use {'shaunsingh/nord.nvim', setup = function()
	    vim.o.termguicolors = true
	    vim.g.nord_disable_background = true
    end, config = [[require'nord'.set()]]
    }
    --use {'ojroques/nvim-hardline', config = function()
	--	require'hardline'.setup {}
    --end}
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require'lualine'.setup {options = {theme = 'nord'}} end
    }
    use {'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require'bufferline'.setup{}
        end, keys = { '<leader>bl' }
    }
    use {'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons'}
    --use {'romgrk/barbar.nvim',
    --    requires = {{'kyazdani42/nvim-web-devicons'}}
    --}

    use {'rafcamlet/nvim-luapad', cmd = {'Luapad', 'LuaRun', 'Lua'} }
    --use {'tjdevries/nlua.nvim'}

    use {'JuliaEditorSupport/julia-vim'}
    -- if using ft='julia' E117: Unknown function: LaTeXtoUnicode#Refresh
    -- use {'euclidianAce/BetterLua.vim', ft='lua'}
    use {'ziglang/zig.vim', ft='zig'}
    use {'LnL7/vim-nix', ft='nix'}
    use {'habamax/vim-godot', ft='gdscript'}
    use {'glslang/agda-vim', ft='agda'}
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
        config = function()
            local flutter_sdk = vim.fn.resolve(vim.fn.getenv'FLUTTER_SDK')
            require'flutter-tools'.setup {
                widget_guides = {
                    enabled = true
                },
                flutter_path = flutter_sdk.."/bin/flutter",
                lsp = {
                    on_attach = require'lsp'.on_attach
                }
            }
            vim.api.nvim_buf_set_keymap(
                0, "n", "<leader>ot", "<cmd>FlutterOutlineToggle<cr>",
                { silent=true, unique=true }
            )
            require'telescope'.load_extension'flutter'
        end, ft='dart'
    }
    use {'purescript-contrib/purescript-vim', ft='purescript',
        config = function()
            vim.cmd'syntax on'
            vim.cmd'filetype on'
            vim.cmd'filetype plugin indent on'
        end
    }

    use {'Julian/lean.nvim', ft = 'lean', requires = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require'lean'.setup{
				lsp = {
					on_attach = require'lsp'.on_attach
				},
				lsp3 = {
					on_attach = require'lsp'.on_attach
				},
				infoview = {
					autoopen = true,
					width = 50,
				},
			}
		end
    }
    -- use {'edwinb/idris2-vim', commit='099129e08c89d9526ad092b7980afa355ddaa24c'}
    -- use {'ShinKage/nvim-idris2', ft='idris', rocks = {'idris1-lua'}}

    use {'oberblastmeister/neuron.nvim',
        requires = {'nvim-telescope/telescope.nvim'},
        branch='unstable',
        keys = require'notes'.keys,
        config = require'notes'.config
    }
    use {'p00f/cphelper.nvim',
    	requires = 'nvim-lua/plenary.nvim',
	config = function()
		vim.g.cphdir = vim.loop.os_homedir() .. "/Code/Compet"
        vim.g.cpp_compile_command = 'g++ -Wall -Wextra -std=c++17 solution.cpp -o cpp.out'
	end
	}
    --use {'kyazdani42/nvim-tree.lua'}
    --use {'tjdevries/astronauta.nvim'}
    --use {'notomo/gesture.nvim'}

    use {'ThePrimeagen/vim-be-good'}
    use {'dstein64/vim-startuptime'}
    --use {'jubnzv/virtual-types.nvim'}
    use {'akinsho/toggleterm.nvim',
        setup = function() vim.cmd'set hidden' end,
        config = require'terminal'.config
    }
end)

-- ToDo
-- https://github.com/jghauser/follow-md-links.nvim
-- vim-which-key
-- https://github.com/folke/trouble.nvim
