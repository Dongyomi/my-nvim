--https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = { "bash", "c", "cpp", "lua", "vim", "vimdoc", "query", "json" },
  sync_install = true,
})
