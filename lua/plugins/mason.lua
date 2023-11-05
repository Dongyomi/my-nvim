--https://github.com/williamboman/mason.nvim

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    border = "single",
    width = 0.4,
    height = 0.7,
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "x",
    },
  },
})
