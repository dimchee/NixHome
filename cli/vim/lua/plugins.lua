local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]


require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true,
        setup = function()
            vim.cmd[[command! PackerLoad lua require'plugins']]
        end
    }
    use {'lervag/vimtex', ft='tex', setup = function()
	    vim.g.vimtex_compiler_method = 'tectonic'
	    vim.g.vimtex_view_method = 'zathura'
	    vim.g.vimtex_view_automatic = true
	    vim.g.vimtex_compiler_progname = 'nvr'
    end, config = function()
        local su = { silent=true, unique=true }
	    vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", ":VimtexCompile<cr>", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v c", "č", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\' c", "ć", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v s", "š", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v z", "ž", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\dj ", "đ", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v C", "Č", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\' C", "Ć", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v S", "Š", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\v Z", "Ž", su)
	    vim.api.nvim_buf_set_keymap(0, "i", "\\Dj ", "Đ", su)
    end}
    use {'neovim/nvim-lspconfig', requires = {
        {'onsails/lspkind-nvim'}
    }, opt = true, event = 'BufReadPost',
    config = function()
        local lsp = require'lspconfig'
        lsp.ccls.setup{}
        lsp.hls.setup{}
        --lsp.julials.setup{}
        lsp.rust_analyzer.setup{}
        lsp.gopls.setup{}
        lsp.texlab.setup{}
        lsp.rnix.setup{}
        lsp.bashls.setup{}
        lsp.elmls.setup{}
        lsp.pyright.setup{}
        local hand = io.popen('readlink -f $(which lua-language-server)')
        local sumneko_binary = hand:read(); hand:close()
        local sumneko_root_path = sumneko_binary..'/../..'
        lsp.sumneko_lua.setup {
            cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        -- Setup your lua path
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        -- Get the language server to recognize `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                },
            },
        }
	    --require'lspkind'.init{ withtext= false }
    end}
    use {'hrsh7th/nvim-compe', requires = {
        {'GoldsteinE/compe-latex-symbols'}
    }, opt = true, event = 'BufReadPost',
    config = function()
	    vim.o.completeopt = "menuone,noselect"
	    vim.api.nvim_buf_set_keymap(
                0, "i", "<C-Space>", "compe#complete()",
                { silent=true, unique=true }
	    )
        require'compe'.setup {
            enabled = true;
            autocomplete = true;
            preselect = 'enable';
            documentation = true;
            source = {
                path = true;
                buffer = false;
                calc = false;
                vsnip = false;
                nvim_lsp = true;
                nvim_lua = true;
                spell = false;
                tags = false;
                snippets_nvim = false;
                treesitter = false;
                latex_symbols = true
            };
        }
    end}
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
    use {'nvim-telescope/telescope.nvim', cmd={'Telescope', 'TeleLoad'},
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            vim.cmd[[command! -nargs=* TeleLoad]] -- empty command needed
        end
    }

    use {'tjdevries/colorbuddy.nvim'}
    use {'ojroques/nvim-hardline'}
    use {'kyazdani42/nvim-web-devicons'}
    --use {'romgrk/barbar.nvim',
    --    requires = {{'kyazdani42/nvim-web-devicons'}}
    --}

    use {'rafcamlet/nvim-luapad', cmd = {'Luapad', 'LuaRun', 'Lua'} }
    --use {'tjdevries/nlua.nvim'}

    use {'leanprover/lean.vim'}
    -- not working som lspconfig shit
    --use {'Julian/lean.nvim',
    --requires = {'neovim/nvim-lspconfig'},
    --	config = function()
	--    require'lean'.setup{
    --        infoview = {
    --            enable = true,
    --            -- Clip the infoview to a maximum width
    --            max_width = 79,
    --        },
    --    }
	--end
    --}
    use {'JuliaEditorSupport/julia-vim'}
    -- if using ft='julia' E117: Unknown function: LaTeXtoUnicode#Refresh
    use {'euclidianAce/BetterLua.vim', ft='lua'}
    use {'ziglang/zig.vim', ft='zig'}
    use {'LnL7/vim-nix', ft='nix'}
    use {'glslang/agda-vim', ft='agda'}
    --use {'edwinb/idris2-vim', commit='099129e08c89d9526ad092b7980afa355ddaa24c'}
    --use {'ShinKage/nvim-idris2', ft='idris', rocks = {'idris1-lua'}}

    use {'oberblastmeister/neuron.nvim',
        requires = {'nvim-telescope/telescope.nvim'},
        branch='unstable', cmd='NeuronLoad',
        config = function()
            require'neuron'.setup {
                virtual_titles = true,
                mappings = true,
                run = nil, -- function to run when in neuron dir
                neuron_dir = "~/Library/Neuron",
                leader = "gz", -- leader key, remember 'go zettel'
            }
        vim.cmd[[command! -nargs=* NeuronLoad]] -- empty command needed
    end}
    --use {'kyazdani42/nvim-tree.lua'}
    --use {'tjdevries/astronauta.nvim'}

    --use {'notomo/gesture.nvim', config = function()
    --    vim.cmd[[set mouse=a]]
    --    local gesture = require('gesture')
    --    gesture.register({
    --        name = "scroll to bottom",
    --        inputs = { gesture.up(), gesture.down() },
    --        action = "normal! G"
    --    })
    --    gesture.register({
    --        name = "next tab",
    --        inputs = { gesture.right() },
    --        action = "bnext"
    --    })
    --    gesture.register({
    --        name = "previous tab",
    --        inputs = { gesture.left() },
    --        action = function() vim.cmd("bprevious") end
    --    })
    --    keymap("n", "<LeftDrag>", ":Gesture draw<CR>", {silent=true})
    --    keymap("n", "<LeftRelease>", ":Gesture finish<CR>", {silent=true})
    --end}

    use {'hkupty/iron.nvim'}
    use {'dstein64/vim-startuptime'}
    --use {'jubnzv/virtual-types.nvim'}
    use {'akinsho/nvim-toggleterm.lua',
        config = function()
            local opt = { silent=true, unique=true }
	        require("toggleterm").setup{
		        setup = 20,
		        direction = 'horizontal',
		        open_mapping = '<leader><leader>t',
		        start_in_insert = true,
		        close_on_exit = true,
                on_open = function(_)
	                vim.api.nvim_buf_set_keymap(0, "t", "<leader><leader>t", ":ToggleTerm", opt)
                end
	        }
            function make_repl(cmd)
	            local repl = require('toggleterm.terminal').Terminal:new({
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
