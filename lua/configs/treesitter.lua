local function treesitter_opts_guts()
  return {ensure_installed = {"lua", "fennel", "rust", "c", "python", "go"}, highlight = {enable = true, use_languagetree = true}, indent = {enable = true}}
end
local function treesitter_opts()
  local function _1_()
    local ts = require("nvim-treesitter.configs")
    return ts.setup(treesitter_opts_guts())
  end
  return {config = _1_}
end
return treesitter_opts()
