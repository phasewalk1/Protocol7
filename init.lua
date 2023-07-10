local builds_path = (vim.fn.stdpath("config") .. "/build/?.lua")
package.path = (package.path .. ";" .. builds_path)
require("globals")
local function bootstrap_lazy()
  local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", "--branch=stable", lazypath})
  else
  end
  return (vim.opt.rtp):prepend(lazypath)
end
bootstrap_lazy()
local lazy = require("lazy")
return lazy.setup(require("plugins"))
