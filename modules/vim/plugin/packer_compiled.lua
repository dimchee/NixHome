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
  ["agda-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim"
  },
  ["compe-latex-symbols"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/compe-latex-symbols"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÄ\2\0\0\4\0\f\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\21filetype_exclude\1\3\0\0\thelp\vpacker\20buftype_exclude\1\3\0\0\rterminal\vnofile\1\0\2\tchar\b‚îä#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\vLineNr$indent_blankline_char_highlight\6g\bvim\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14with_text\1\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tnord\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["neuron.nvim"] = {
    config = { "\27LJ\2\n{\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\vleader\agz\rmappings\2\15neuron_dir\21~/Library/Neuron\19virtual_titles\2\nsetup\vneuron\frequire\0" },
    keys = { { "n", "gzi" }, { "n", "gzz" }, { "n", "gzZ" }, { "n", "gzn" }, { "n", "gzb" }, { "n", "gzB" }, { "n", "gzt" }, { "n", "gz]" }, { "n", "gz[" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/neuron.nvim"
  },
  ["nord.nvim"] = {
    config = { "require'nord'.set()" },
    loaded = true,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nord.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nb\0\0\3\0\6\0\v6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\18termguicolors\bopt\bvim\0" },
    keys = { { "", "<leader>bl" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    commands = { "CompeLoad" },
    config = { "\27LJ\2\nï\2\0\0\4\0\f\0\0176\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\n\0005\3\t\0=\3\v\2B\0\2\1K\0\1\0\vsource\1\0\0\1\0\v\tpath\2\ttags\1\vbuffer\1\15treesitter\1\nspell\1\18snippets_nvim\1\nvsnip\1\tcalc\1\18latex_symbols\2\rnvim_lua\2\rnvim_lsp\2\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6o command! -nargs=* CompeLoad\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    commands = { "LspStart" },
    config = { "\27LJ\2\n¿\r\0\2\n\0,\0¶\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0015\2\5\0006\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\b\0'\b\t\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\n\0'\b\v\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\f\0'\b\r\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\14\0'\b\15\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\16\0'\b\17\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\18\0'\b\19\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\20\0'\b\21\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\22\0'\b\23\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\24\0'\b\25\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\26\0'\b\27\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\28\0'\b\29\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\30\0'\b\31\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a \0'\b!\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\"\0'\b#\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a$\0'\b%\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a&\0'\b'\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a(\0'\b)\0\18\t\2\0B\3\6\0016\3\0\0009\3*\3'\5+\0B\3\2\1K\0\1\0= command! Format execute 'lua vim.lsp.buf.formatting()' \bcmdE<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>\15<leader>so2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\24nvim_buf_set_keymap\1\0\2\vsilent\2\vunique\2\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim¸\5\1\0\16\0,\0R3\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\0016\1\5\0'\3\6\0B\1\2\0025\2\a\0006\3\b\0\18\5\2\0B\3\2\4X\6\5Ä8\b\a\0019\b\t\b5\n\n\0=\0\v\nB\b\2\1E\6\3\3R\6˘6\3\f\0009\3\r\3'\5\14\0B\3\2\2\18\6\3\0009\4\15\3B\4\2\2\18\a\3\0009\5\16\3B\5\2\1\18\5\4\0'\6\17\0&\5\6\0059\6\18\0019\6\t\0065\b\21\0005\t\19\0>\4\1\t\18\n\5\0'\v\20\0&\n\v\n>\n\3\t=\t\22\b=\0\v\b5\t)\0005\n\28\0005\v\23\0006\f\1\0009\f\24\f6\14\25\0009\14\26\14'\15\27\0B\f\3\2=\f\26\v=\v\29\n5\v\31\0005\f\30\0=\f \v=\v!\n5\v&\0004\f\0\b6\r\1\0009\r\"\r9\r#\r'\15$\0B\r\2\2+\14\2\0<\14\r\f6\r\1\0009\r\"\r9\r#\r'\15%\0B\r\2\2+\14\2\0<\14\r\f=\f'\v=\v(\n=\n*\t=\t+\bB\6\2\1K\0\1\0\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\v/../..\nclose\tread-readlink -f $(which lua-language-server)\npopen\aio\14on_attach\1\0\0\nsetup\vipairs\1\f\0\0\tccls\bhls\18rust_analyzer\ngopls\vtexlab\17purescriptls\trnix\vbashls\nelmls\fpyright\bzls\14lspconfig\frequire\ndebug\18set_log_level\blsp\bvim\0\0" },
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
    config = { "\27LJ\2\ne\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0¿\16:ToggleTerm\14<leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggle°\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0ÄL\2\2\0\0\bcmd\1\0\4\18close_on_exit\2\14direction\15horizontal\20start_in_insert\2\nsetup\3\20\bnew\rTerminal\20nvim-toggleterm\frequireÜ\2\1\0\5\0\v\0\0166\0\0\0'\2\1\0B\0\2\0015\0\2\0006\1\3\0'\3\4\0B\1\2\0029\1\5\0015\3\6\0003\4\a\0=\4\b\3B\1\2\0013\1\t\0007\1\n\0002\0\0ÄK\0\1\0\14Make_repl\0\fon_open\0\1\0\6\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\17open_mapping\14<leader>t\17persist_size\1\nsetup\15toggleterm\frequire\1\0\2\vunique\2\vsilent\2\24testing toggleterm!\nprint\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nå\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\venable\2&additional_vim_regex_highlighting\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
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
  ["purescript-vim"] = {
    config = { "\27LJ\2\ns\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0\30filetype plugin indent on\16filetype on\14syntax on\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/opt/purescript-vim"
  },
  ["snippets.nvim"] = {
    config = { "\27LJ\2\nà\1\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\4\0005\2\3\0=\2\5\1=\1\1\0K\0\1\0\f_global\1\0\0\1\0\5\b\\vz\a≈æ\b\\dj\aƒë\b\\vs\a≈°\b\\vc\aƒç\b\\'c\aƒá\27use_suggested_mappings\rsnippets\frequire\0" },
    loaded = true,
    path = "/home/dimchee/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
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
    config = { "\27LJ\2\n∑\4\0\0\b\0\28\0e5\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\18\0'\6\19\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\20\0'\6\21\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\22\0'\6\23\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\24\0'\6\25\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\a\0'\5\26\0'\6\27\0\18\a\0\0B\1\6\1K\0\1\0\aƒê\t\\Dj \a≈Ω\t\\v Z\a≈†\t\\v S\aƒÜ\t\\' C\aƒå\t\\v C\aƒë\t\\dj \a≈æ\t\\v z\a≈°\t\\v s\aƒá\t\\' c\aƒç\t\\v c\6i\23:VimtexCompile<cr>\n<C-a>\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\2\vunique\2\vsilent\2\0" },
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
local module_lazy_loads = {
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: nord.nvim
time([[Setup for nord.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0+\1\2\0=\1\4\0K\0\1\0\28nord_disable_background\6g\18termguicolors\6o\bvim\0", "setup", "nord.nvim")
time([[Setup for nord.nvim]], false)
time([[packadd for nord.nvim]], true)
vim.cmd [[packadd nord.nvim]]
time([[packadd for nord.nvim]], false)
-- Setup for: vimtex
time([[Setup for vimtex]], true)
try_loadstring("\27LJ\2\nø\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\bnvr\29vimtex_compiler_progname\26vimtex_view_automatic\fzathura\23vimtex_view_method\rtectonic\27vimtex_compiler_method\6g\bvim\0", "setup", "vimtex")
time([[Setup for vimtex]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\ne\0\1\b\1\6\0\n6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0'\6\5\0-\a\0\0B\1\6\1K\0\1\0\0¿\16:ToggleTerm\14<leader>t\6t\24nvim_buf_set_keymap\bapi\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggle°\1\1\1\5\0\a\0\f6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\1\0009\1\3\0015\4\4\0=\0\5\4B\1\3\0023\2\6\0002\0\0ÄL\2\2\0\0\bcmd\1\0\4\18close_on_exit\2\14direction\15horizontal\20start_in_insert\2\nsetup\3\20\bnew\rTerminal\20nvim-toggleterm\frequireÜ\2\1\0\5\0\v\0\0166\0\0\0'\2\1\0B\0\2\0015\0\2\0006\1\3\0'\3\4\0B\1\2\0029\1\5\0015\3\6\0003\4\a\0=\4\b\3B\1\2\0013\1\t\0007\1\n\0002\0\0ÄK\0\1\0\14Make_repl\0\fon_open\0\1\0\6\14direction\15horizontal\18close_on_exit\2\20start_in_insert\2\nsetup\3\20\17open_mapping\14<leader>t\17persist_size\1\nsetup\15toggleterm\frequire\1\0\2\vunique\2\vsilent\2\24testing toggleterm!\nprint\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tnord\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: snippets.nvim
time([[Config for snippets.nvim]], true)
try_loadstring("\27LJ\2\nà\1\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\4\0005\2\3\0=\2\5\1=\1\1\0K\0\1\0\f_global\1\0\0\1\0\5\b\\vz\a≈æ\b\\dj\aƒë\b\\vs\a≈°\b\\vc\aƒç\b\\'c\aƒá\27use_suggested_mappings\rsnippets\frequire\0", "config", "snippets.nvim")
time([[Config for snippets.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nå\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\venable\2&additional_vim_regex_highlighting\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÄ\2\0\0\4\0\f\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\21filetype_exclude\1\3\0\0\thelp\vpacker\20buftype_exclude\1\3\0\0\rterminal\vnofile\1\0\2\tchar\b‚îä#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\vLineNr$indent_blankline_char_highlight\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
require'nord'.set()
time([[Config for nord.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14with_text\1\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspStart lua require("packer.load")({'nvim-lspconfig'}, { cmd = "LspStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file CompeLoad lua require("packer.load")({'nvim-compe'}, { cmd = "CompeLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>bl <cmd>lua require("packer.load")({'nvim-bufferline.lua'}, { keys = "<lt>leader>bl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzz <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gz] <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gz]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzB <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzB", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzZ <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzZ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gz[ <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gz[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzi <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzn <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzt <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzt", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gzb <cmd>lua require("packer.load")({'neuron.nvim'}, { keys = "gzb", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType agda ++once lua require("packer.load")({'agda-vim'}, { ft = "agda" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType purescript ++once lua require("packer.load")({'purescript-vim'}, { ft = "purescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'vim-nix'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], false)
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]], true)
vim.cmd [[source /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]]
time([[Sourcing ftdetect script at: /home/dimchee/.local/share/nvim/site/pack/packer/opt/agda-vim/ftdetect/agda.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
