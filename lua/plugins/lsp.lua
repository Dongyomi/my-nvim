--https://github.com/neovim/nvim-lspconfig
--https://github.com/williamboman/mason-lspconfig.nvim

local list = { "bashls", "clangd", "lua_ls", "jsonls" }

local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = list,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

require("lspconfig.ui.windows").default_options.border = "single"

local cmp_lsp_status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status_ok then
  return
end

for i = 1, #list do
  lspconfig[list[i]].setup({ capabilities = cmp_lsp.default_capabilities() })
end
