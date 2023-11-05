local options = {
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  list = true,
  listchars = "tab:··,space:·,eol:↵",
  number = true,
  numberwidth = 1,
  shiftwidth = 0,
  signcolumn = "yes",
  smartcase = true,
  softtabstop = 2,
  tabstop = 2,
  termguicolors = true,
  timeout = true,
  timeoutlen = 200,
}

for k, v in pairs(options) do
  vim.o[k] = v
end

local g_options = {
  mapleader = " ",
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
}

for k, v in pairs(g_options) do
  vim.g[k] = v
end

vim.diagnostic.config({ severity_sort = true })
