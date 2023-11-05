--https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd("packadd packer.nvim")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer_util = require("packer.util")

packer.init({
  compile_path = packer_util.join_paths(fn.stdpath("config"), ".plugin", "packer_compiled.lua"),
  display = {
    open_fn = function()
      return packer_util.float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("nvim-lualine/lualine.nvim")
  use("williamboman/mason.nvim")
  use("mhartington/formatter.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("hrsh7th/nvim-cmp")
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("nvim-tree/nvim-tree.lua")
  use("akinsho/toggleterm.nvim")
  use("nvim-treesitter/nvim-treesitter")
  use("folke/which-key.nvim")
end)
