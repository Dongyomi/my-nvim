--https://github.com/folke/which-key.nvim

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup({
  icons = {
    group = "",
  },
  window = {
    border = "single",
  },
  layout = {
    spacing = 15,
    align = "center",
  },
})

which_key.register({
  ["c"] = { "<CMD>close<CR>", "Close window" },
  ["e"] = { "<CMD>NvimTreeToggle<CR>", "Explorer" },
  ["l"] = { "<CMD>LspInfo<CR>", "Lsp info" },
  ["m"] = { "<CMD>Mason<CR>", "Mason" },
  ["q"] = { "<CMD>q<CR>", "Quit" },
  ["Q"] = { "<CMD>q!<CR>", "Quit force" },
  ["t"] = { "<CMD>ToggleTerm<CR>i", "Terminal" },
  ["w"] = { "<CMD>write<CR>", "Write" },
  ["x"] = { "<CMD>bd<CR>", "Close buffer" },
  ["d"] = { vim.diagnostic.setloclist, "Diagnostic" },
  p = {
    name = "Packer",
    c = { "<CMD>PackerClean<CR>", "Clean" },
    i = { "<CMD>PackerInstall<CR>", "Install" },
    s = { "<CMD>PackerSync<CR>", "Sync" },
  },
}, {
  prefix = "<leader>",
})
