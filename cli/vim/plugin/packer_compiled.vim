" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ["agda-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["compe-latex-symbols"] = {
    after_files = { "/home/dimchee/.local/share/nvim/site/pack/packer/opt/compe-latex-symbols/after/plugin/compe_latex_symbols.vim" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/compe-latex-symbols"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/iron.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["neuron.nvim"] = {
    commands = { "NeuronLoad" },
    config = { "\27LJ\2\n°\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0!command! -nargs=* NeuronLoad\bcmd\bvim\1\0\4\rmappings\2\15neuron_dir\21~/Library/Neuron\19virtual_titles\2\vleader\agz\nsetup\vneuron\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/neuron.nvim"
  },
  ["nvim-compe"] = {
    after = { "compe-latex-symbols" },
    after_files = { "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    config = { "\27LJ\2\nˆ\3\0\0\a\0\16\0\0226\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0)\2\0\0'\3\6\0'\4\a\0'\5\b\0005\6\t\0B\0\6\0016\0\n\0'\2\v\0B\0\2\0029\0\f\0005\2\r\0005\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\v\tpath\2\tcalc\1\rnvim_lua\2\nvsnip\1\ttags\1\rnvim_lsp\2\18snippets_nvim\1\vbuffer\1\nspell\1\18latex_symbols\2\15treesitter\1\1\0\4\fenabled\2\17autocomplete\2\18documentation\2\14preselect\venable\nsetup\ncompe\frequire\1\0\2\vunique\2\vsilent\2\21compe#complete()\14<C-Space>\6i\24nvim_buf_set_keymap\bapi\21menuone,noselect\16completeopt\6o\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-hardline"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-hardline"
  },
  ["nvim-lspconfig"] = {
    after = { "lspkind-nvim" },
    config = { "\27LJ\2\nþ\5\0\0\14\0-\0c6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0014\3\0\0B\1\2\0019\1\5\0009\1\3\0014\3\0\0B\1\2\0019\1\6\0009\1\3\0014\3\0\0B\1\2\0019\1\a\0009\1\3\0014\3\0\0B\1\2\0019\1\b\0009\1\3\0014\3\0\0B\1\2\0019\1\t\0009\1\3\0014\3\0\0B\1\2\0019\1\n\0009\1\3\0014\3\0\0B\1\2\0019\1\v\0009\1\3\0014\3\0\0B\1\2\0016\1\f\0009\1\r\1'\3\14\0B\1\2\2\18\4\1\0009\2\15\1B\2\2\2\18\5\1\0009\3\16\1B\3\2\1\18\3\2\0'\4\17\0&\3\4\0039\4\18\0009\4\3\0045\6\21\0005\a\19\0>\2\1\a\18\b\3\0'\t\20\0&\b\t\b>\b\3\a=\a\22\0065\a*\0005\b\29\0005\t\23\0006\n\24\0009\n\25\n6\f\26\0009\f\27\f'\r\28\0B\n\3\2=\n\27\t=\t\30\b5\t \0005\n\31\0=\n!\t=\t\"\b5\t'\0004\n\0\b6\v\24\0009\v#\v9\v$\v'\r%\0B\v\2\2+\f\2\0<\f\v\n6\v\24\0009\v#\v9\v$\v'\r&\0B\v\2\2+\f\2\0<\f\v\n=\n(\t=\t)\b=\b+\a=\a,\6B\4\2\1K\0\1\0\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\v/../..\nclose\tread-readlink -f $(which lua-language-server)\npopen\aio\fpyright\nelmls\vbashls\trnix\vtexlab\ngopls\18rust_analyzer\bhls\nsetup\tccls\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad", "LuaRun", "Lua" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nm\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0À\16:ToggleTerm\22<leader><leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1À\vtoggle¥\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0€L\2\2\0\0\bcmd\1\0\4\14direction\15horizontal\20start_in_insert\2\18close_on_exit\2\nsetup\3\20\bnew\rTerminal\24toggleterm.terminal\frequireÚ\1\1\0\5\0\t\0\r5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0003\4\5\0=\4\6\3B\1\2\0013\1\a\0007\1\b\0002\0\0€K\0\1\0\14make_repl\0\fon_open\0\1\0\5\17open_mapping\22<leader><leader>t\14direction\15horizontal\20start_in_insert\2\18close_on_exit\2\nsetup\3\20\nsetup\15toggleterm\frequire\1\0\2\vunique\2\vsilent\2\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope", "TeleLoad" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\31command! -nargs=* TeleLoad\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-nix"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  vimtex = {
    config = { "\27LJ\2\ny\0\0\a\0\a\0\n6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\0\6\1K\0\1\0\1\0\2\vunique\2\vsilent\2\23:VimtexCompile<cr>\n<C-a>\6n\24nvim_buf_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim"
  }
}

time("Defining packer_plugins", false)
-- Setup for: vimtex
time("Setup for vimtex", true)
try_loadstring("\27LJ\2\n¿\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\bnvr\29vimtex_compiler_progname\26vimtex_view_automatic\fzathura\23vimtex_view_method\rtectonic\27vimtex_compiler_method\6g\bvim\0", "setup", "vimtex")
time("Setup for vimtex", false)
-- Setup for: packer.nvim
time("Setup for packer.nvim", true)
try_loadstring("\27LJ\2\nL\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0-command! PackerLoad lua require'plugins'\bcmd\bvim\0", "setup", "packer.nvim")
time("Setup for packer.nvim", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\nm\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0À\16:ToggleTerm\22<leader><leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1À\vtoggle¥\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0€L\2\2\0\0\bcmd\1\0\4\14direction\15horizontal\20start_in_insert\2\18close_on_exit\2\nsetup\3\20\bnew\rTerminal\24toggleterm.terminal\frequireÚ\1\1\0\5\0\t\0\r5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0003\4\5\0=\4\6\3B\1\2\0013\1\a\0007\1\b\0002\0\0€K\0\1\0\14make_repl\0\fon_open\0\1\0\5\17open_mapping\22<leader><leader>t\14direction\15horizontal\20start_in_insert\2\18close_on_exit\2\nsetup\3\20\nsetup\15toggleterm\frequire\1\0\2\vunique\2\vsilent\2\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NeuronLoad lua require("packer.load")({'neuron.nvim'}, { cmd = "NeuronLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TeleLoad lua require("packer.load")({'telescope.nvim'}, { cmd = "TeleLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'vim-nix'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType agda ++once lua require("packer.load")({'agda-vim'}, { ft = "agda" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim'}, { ft = "lua" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-compe', 'nvim-lspconfig'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim", true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]]
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim", false)
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", false)
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim", true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]]
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim", false)
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim", true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time("Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
