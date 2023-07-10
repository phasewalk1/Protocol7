local function conjure_opts()
  local function _1_()
    vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
    return nil
  end
  return {config = _1_, lazy = false}
end
return conjure_opts()
