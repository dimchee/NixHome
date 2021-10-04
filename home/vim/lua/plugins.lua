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
    config = function()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
	    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
	    parser_config.markdown = {
	        install_info = {
	    	    url = "https://github.com/ikatyang/tree-sitter-markdown",
	    		files = {"src/parser.c", "src/scanner.cc"}
	        },
	        filetype = "markdown",
	    }
    end}
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
    use {'hrsh7th/nvim-compe', requires = {'GoldsteinE/compe-latex-symbols'},
        cmd = 'CompeLoad', config = require'completion'.config
    }
    use {'lukas-reineke/indent-blankline.nvim',
    	config = function()
		--Map blankline
		vim.g.indent_blankline_char_highlight = 'LineNr'
		require("indent_blankline").setup {
			char = '┊',
			buftype_exclude = { 'terminal', 'nofile' },
			filetype_exclude = { 'help', 'packer' },
			show_trailing_blankline_indent = false
		}
	end
    }
    use {'norcalli/snippets.nvim',
        config = function()
            local snippets = require'snippets'
            snippets.use_suggested_mappings()
            snippets.snippets = {
                _global = {
                    ["\\vc"] = 'č';
                    ["\\'c"] = 'ć';
                    ["\\vs"] = 'š';
                    ["\\vz"] = 'ž';
                    ["\\dj"] = 'đ'
                };
            }
        end
    }
    use {'nvim-telescope/telescope.nvim', cmd={'Telescope'},
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        module = 'telescope'
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
            flutter_sdk = vim.fn.resolve(vim.fn.getenv'FLUTTER_SDK')
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
			'hrsh7th/nvim-compe'
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
        keys = {
            {'n', 'gzi'},
            {'n', 'gzz'},
            {'n', 'gzZ'},
            {'n', 'gzn'},
            {'n', 'gzb'},
            {'n', 'gzB'},
            {'n', 'gzt'},
            {'n', 'gz]'},
            {'n', 'gz['},
        },
        config = function()
            require'neuron'.setup {
                virtual_titles = true,
                mappings = true,
                run = nil, -- function to run when in neuron dir
                neuron_dir = "~/Library/Neuron",
                leader = "gz", -- leader key, remember 'go zettel'
            }
    end}
    --use {'kyazdani42/nvim-tree.lua'}
    --use {'tjdevries/astronauta.nvim'}
    --use {'notomo/gesture.nvim'}

    use {'dstein64/vim-startuptime'}
    --use {'jubnzv/virtual-types.nvim'}
    use {'akinsho/toggleterm.nvim', setup = function()
            vim.cmd'set hidden'
        end,
        config = function()
            local opt = { silent=true, unique=true }
	        require'toggleterm'.setup{
		        setup = 20,
		        direction = 'horizontal',
                persist_size = false,
		        open_mapping = '<leader><leader>t',
		        start_in_insert = true,
		        close_on_exit = true,
                on_open = function(_)
	                vim.api.nvim_buf_set_keymap(
                        0, "t", "<leader><leader>t", ":ToggleTerm", opt
                    )
                end
	        }
            function Make_repl(cmd)
	            local repl = require'toggleterm.terminal'.Terminal:new({
	                cmd = cmd,
                    setup = 20,
                    direction = 'horizontal',
		            start_in_insert = true,
		            close_on_exit = true,
	            })
                return function () repl:toggle() end
            end
        end
    }
end)

-- ToDo
-- https://github.com/jghauser/follow-md-links.nvim
-- vim-which-key 
