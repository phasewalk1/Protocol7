local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

package.path = "/usr/share/lua/5.3/?.lua;" .. package.path
package.cpath = "/usr/share/lua/5.3/?.so;" .. package.cpath

local fnl = require("fennel").install()
local plugins = fnl.dofile(os.getenv("HOME") .. "/.config/nvim/presentday.fnl")

require("lazy").setup(plugins)
