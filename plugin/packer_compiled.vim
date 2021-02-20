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
local package_path_str = "/Users/neo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/neo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/neo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/neo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/neo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  delimitMate = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/delimitMate"
  },
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/Users/neo/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe', 'delimitMate'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
