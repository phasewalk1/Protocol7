local function mason_ui()
  return {ui = {icons = {package_installed = "\226\156\147", package_pending = "\226\158\156", package_uninstalled = "\226\156\151"}}}
end
local function mason_opts()
  return {opts = {ensure_installed = {"pyright", "rust-analyzer:", "typescript-language-server"}, max_concurrent_installers = 10, PATH = "skip", ui = mason_ui()}}
end
return mason_opts()
