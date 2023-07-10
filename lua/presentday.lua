local conjure_opts = require("configs.conjure")
local treesitter_opts = require("configs.treesitter")
local mason_opts = require("configs.mason")
local theme_opts = require("configs.theme")
local lsp_opts = require("configs.lsp")
local function push_plugin(identifier, opts, tbl)
  _G.assert((nil ~= tbl), "Missing argument tbl on src/presentday.fnl:7")
  _G.assert((nil ~= opts), "Missing argument opts on src/presentday.fnl:7")
  _G.assert((nil ~= identifier), "Missing argument identifier on src/presentday.fnl:7")
  if (opts == {}) then
    table.insert(tbl, identifier)
  else
    local plugin_spec = {}
    table.insert(plugin_spec, identifier)
    for k, v in pairs(opts) do
      plugin_spec[k] = v
    end
    table.insert(tbl, plugin_spec)
  end
  return tbl
end
local function plugins()
  local plug = {}
  push_plugin("folke/neoconf.nvim", {cmd = "Neoconf"}, plug)
  push_plugin("olical/conjure", conjure_opts, plug)
  push_plugin("nvim-treesitter/nvim-treesitter", treesitter_opts, plug)
  push_plugin("williamboman/mason.nvim", mason_opts, plug)
  push_plugin("nyoom-engineering/oxocarbon.nvim", theme_opts, plug)
  push_plugin("neovim/nvim-lspconfig", lsp_opts, plug)
  push_plugin("folke/neodev.nvim", {}, plug)
  push_plugin("folke/which-key.nvim", {}, plug)
  return plug
end
vim.g.maplocalleader = ","
return plugins()
