--https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local filetype_names = {
  NvimTree = "-",
  packer = "packer",
  lspinfo = "lsp",
  mason = "mason",
  qf = "diagnostic",
  toggleterm = "terminal",
}

lualine.setup({
  options = {
    icons_enabled = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_c = {
      { "filename", path = 3, symbols = {
        unnamed = "",
      } },
    },
  },
  tabline = {
    lualine_b = {
      {
        "buffers",
        filetype_names = filetype_names,
        symbols = {
          alternate_file = "",
        },
      },
    },
    lualine_y = { { "windows", filetype_names = filetype_names } },
    lualine_z = { { "tabs", show_modified_status = false } },
  },
})
