--https://github.com/akinsho/toggleterm.nvim

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  open_mapping = nil,
  start_in_insert = false,
  direction = "float",
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.keymap.set("t", "<esc>", [[<C-\><C-n><CMD>close<CR>]], { buffer = 0 })
  end,
})
