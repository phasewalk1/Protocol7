local function bootstrap_lsp_opts()
  local function _1_()
    local lspconfig = require("lspconfig")
    return lspconfig.pyright.setup({})
  end
  return {config = _1_, lazy = false}
end
return bootstrap_lsp_opts()
