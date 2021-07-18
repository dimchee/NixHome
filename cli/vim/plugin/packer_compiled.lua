-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

time([[Luarocks path setup]], true)
local package_path_str = "/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dimchee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
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
  ["julia-vim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lean.vim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/lean.vim"
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
    config = { "\27LJ\2\n∞\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0!command! -nargs=* NeuronLoad\bcmd\bvim\1\0\4\19virtual_titles\2\15neuron_dir\21~/Library/Neuron\rmappings\2\vleader\agz\nsetup\vneuron\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/neuron.nvim"
  },
  ["nvim-compe"] = {
    after = { "compe-latex-symbols" },
    after_files = { "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\nà\3\0\0\a\0\16\0\0226\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0)\2\0\0'\3\6\0'\4\a\0'\5\b\0005\6\t\0B\0\6\0016\0\n\0'\2\v\0B\0\2\0029\0\f\0005\2\r\0005\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\v\ttags\1\15treesitter\1\18latex_symbols\2\tpath\2\18snippets_nvim\1\rnvim_lua\2\rnvim_lsp\2\nvsnip\1\tcalc\1\nspell\1\vbuffer\1\1\0\4\14preselect\venable\17autocomplete\2\18documentation\2\fenabled\2\nsetup\ncompe\frequire\1\0\2\vsilent\2\vunique\2\21compe#complete()\14<C-Space>\6i\24nvim_buf_set_keymap\bapi\21menuone,noselect\16completeopt\6o\bvim\0" },
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
    config = { "\27LJ\2\n˛\5\0\0\14\0-\0c6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0014\3\0\0B\1\2\0019\1\5\0009\1\3\0014\3\0\0B\1\2\0019\1\6\0009\1\3\0014\3\0\0B\1\2\0019\1\a\0009\1\3\0014\3\0\0B\1\2\0019\1\b\0009\1\3\0014\3\0\0B\1\2\0019\1\t\0009\1\3\0014\3\0\0B\1\2\0019\1\n\0009\1\3\0014\3\0\0B\1\2\0019\1\v\0009\1\3\0014\3\0\0B\1\2\0016\1\f\0009\1\r\1'\3\14\0B\1\2\2\18\4\1\0009\2\15\1B\2\2\2\18\5\1\0009\3\16\1B\3\2\1\18\3\2\0'\4\17\0&\3\4\0039\4\18\0009\4\3\0045\6\21\0005\a\19\0>\2\1\a\18\b\3\0'\t\20\0&\b\t\b>\b\3\a=\a\22\0065\a*\0005\b\29\0005\t\23\0006\n\24\0009\n\25\n6\f\26\0009\f\27\f'\r\28\0B\n\3\2=\n\27\t=\t\30\b5\t \0005\n\31\0=\n!\t=\t\"\b5\t'\0004\n\0\b6\v\24\0009\v#\v9\v$\v'\r%\0B\v\2\2+\f\2\0<\f\v\n6\v\24\0009\v#\v9\v$\v'\r&\0B\v\2\2+\f\2\0<\f\v\n=\n(\t=\t)\b=\b+\a=\a,\6B\4\2\1K\0\1\0\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\v/../..\nclose\tread-readlink -f $(which lua-language-server)\npopen\aio\fpyright\nelmls\vbashls\trnix\vtexlab\ngopls\18rust_analyzer\bhls\nsetup\tccls\14lspconfig\frequire\0" },
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
    config = { "\27LJ\2\nm\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0¿\16:ToggleTerm\22<leader><leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggle•\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0ÄL\2\2\0\0\bcmd\1\0\4\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\bnew\rTerminal\24toggleterm.terminal\frequire⁄\1\1\0\5\0\t\0\r5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0003\4\5\0=\4\6\3B\1\2\0013\1\a\0007\1\b\0002\0\0ÄK\0\1\0\14make_repl\0\fon_open\0\1\0\5\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\17open_mapping\22<leader><leader>t\nsetup\15toggleterm\frequire\1\0\2\vsilent\2\vunique\2\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nå\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2&additional_vim_regex_highlighting\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
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
  ["snippets.nvim"] = {
    config = { "\27LJ\2\nà\1\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\4\0005\2\3\0=\2\5\1=\1\1\0K\0\1\0\f_global\1\0\0\1\0\5\b\\dj\aƒë\b\\'c\aƒá\b\\vc\aƒç\b\\vz\a≈æ\b\\vs\a≈°\27use_suggested_mappings\rsnippets\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/snippets.nvim"
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
    config = { "\27LJ\2\n∑\4\0\0\b\0\28\0e5\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\18\0'\6\19\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\20\0'\6\21\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\22\0'\6\23\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\24\0'\6\25\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\26\0'\6\27\0\18\a\0\0B\1\6\1K\0\1\0\aƒê\t\\Dj \a≈Ω\t\\v Z\a≈†\t\\v S\aƒÜ\t\\' C\aƒå\t\\v C\aƒë\t\\dj \a≈æ\t\\v z\a≈°\t\\v s\aƒá\t\\' c\aƒç\t\\v c\6i\23:VimtexCompile<cr>\n<C-a>\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\2\vsilent\2\vunique\2\0" },
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

time([[Defining packer_plugins]], false)
-- Setup for: vimtex
time([[Setup for vimtex]], true)
try_loadstring("\27LJ\2\nø\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\bnvr\29vimtex_compiler_progname\26vimtex_view_automatic\fzathura\23vimtex_view_method\rtectonic\27vimtex_compiler_method\6g\bvim\0", "setup", "vimtex")
time([[Setup for vimtex]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nå\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2&additional_vim_regex_highlighting\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\nm\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0¿\16:ToggleTerm\22<leader><leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggle•\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0ÄL\2\2\0\0\bcmd\1\0\4\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\bnew\rTerminal\24toggleterm.terminal\frequire⁄\1\1\0\5\0\t\0\r5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0003\4\5\0=\4\6\3B\1\2\0013\1\a\0007\1\b\0002\0\0ÄK\0\1\0\14make_repl\0\fon_open\0\1\0\5\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\17open_mapping\22<leader><leader>t\nsetup\15toggleterm\frequire\1\0\2\vsilent\2\vunique\2\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: snippets.nvim
time([[Config for snippets.nvim]], true)
try_loadstring("\27LJ\2\nà\1\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\4\0005\2\3\0=\2\5\1=\1\1\0K\0\1\0\f_global\1\0\0\1\0\5\b\\dj\aƒë\b\\'c\aƒá\b\\vc\aƒç\b\\vz\a≈æ\b\\vs\a≈°\27use_suggested_mappings\rsnippets\frequire\0", "config", "snippets.nvim")
time([[Config for snippets.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":Lua") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Luapad") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":LuaRun") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Telescope") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NeuronLoad") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NeuronLoad lua require("packer.load")({'neuron.nvim'}, { cmd = "NeuronLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TeleLoad") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TeleLoad lua require("packer.load")({'telescope.nvim'}, { cmd = "TeleLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType agda ++once lua require("packer.load")({'agda-vim'}, { ft = "agda" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'vim-nix'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-compe'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
