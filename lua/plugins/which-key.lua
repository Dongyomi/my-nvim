--https://github.com/folke/which-key.nvim

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup({
  icons = {
    group = "",
    rules = false,
  },
  win = {
    title = false,
    border = "single",
  },
  layout = {
    spacing = 15,
    align = "center",
  },
  show_help = false,
  show_keys = false,
})

which_key.add({
  { "<leader>Q", "<CMD>q!<CR>", desc = "Quit force" },
  { "<leader>c", "<CMD>close<CR>", desc = "Close window" },
  { "<leader>d", vim.diagnostic.setloclist, desc = "Diagnostic" },
  { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Explorer" },
  { "<leader>l", "<CMD>LspInfo<CR>", desc = "Lsp info" },
  { "<leader>m", "<CMD>Mason<CR>", desc = "Mason" },
  { "<leader>p", group = "Packer" },
  { "<leader>pc", "<CMD>PackerClean<CR>", desc = "Clean" },
  { "<leader>pi", "<CMD>PackerInstall<CR>", desc = "Install" },
  { "<leader>ps", "<CMD>PackerSync<CR>", desc = "Sync" },
  { "<leader>q", "<CMD>q<CR>", desc = "Quit" },
  { "<leader>t", "<CMD>ToggleTerm<CR>i", desc = "Terminal" },
  { "<leader>w", "<CMD>write<CR>", desc = "Write" },
  { "<leader>x", "<CMD>bd<CR>", desc = "Close buffer" },
})
