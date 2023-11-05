--https://github.com/mhartington/formatter.nvim

local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

local filetype = { "sh", "c", "cpp", "lua", "json" }

local cmd = {
  {
    exe = "shfmt",
    args = {
      "-i 2",
      "--",
      "-",
    },
  },
  {
    exe = "clang-format",
    args = {
      "--style='{BasedOnStyle: llvm, IndentWidth: 2}'",
      "--",
      "-",
    },
  },
  {
    exe = "clang-format",
    args = {
      "--style='{BasedOnStyle: llvm, IndentWidth: 2}'",
      "--",
      "-",
    },
  },
  {
    exe = "stylua",
    args = {
      "--config-path",
      "~/.config/nvim/.format/stylua.toml",
      "--",
      "-",
    },
  },
  {
    exe = "prettier",
    args = {
      "--config",
      "~/.config/nvim/.format/prettierrc.json",
      "--parser",
      "json",
    },
  },
}

local format = {}
for i = 1, #filetype do
  cmd[i].stdin = true
  format[filetype[i]] = { cmd[i] }
end

formatter.setup({
  filetype = format,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    for _, v in ipairs(filetype) do
      if vim.bo.filetype == v and vim.fn.wordcount().chars ~= 0 then
        vim.cmd("FormatWriteLock")
      end
    end
  end,
})
