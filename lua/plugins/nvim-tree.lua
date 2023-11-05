--https://github.com/nvim-tree/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local keymap = vim.keymap.set
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  keymap("n", "a", api.fs.create, opts("Create"))
  keymap("n", "r", api.fs.rename, opts("Rename"))
  keymap("n", "R", api.fs.rename_full, opts("Rename: Full Path"))
  keymap("n", "d", api.fs.remove, opts("Delete"))
  keymap("n", "y", api.fs.copy.filename, opts("Copy Name"))
  keymap("n", "Y", api.fs.copy.absolute_path, opts("Copy"))
  keymap("n", "<CR>", function(node)
    api.node.open.no_window_picker(node)
    api.tree.focus()
  end, opts("Open"))
  keymap("n", "?", api.node.show_info_popup, opts("Info"))
  keymap("n", "c", api.tree.change_root_to_node, opts("Change Root"))
  keymap("n", "p", api.node.navigate.parent, opts("Parent Directory"))
  keymap("n", "P", api.tree.change_root_to_parent, opts("Up"))
  keymap("n", "s", api.tree.search_node, opts("Search"))
  keymap("n", "e", api.tree.collapse_all, opts("Collapse"))
  keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  keymap("n", "q", api.tree.close, opts("Close"))
  keymap("n", "<ESC>", api.tree.close, opts("Close"))
end

nvim_tree.setup({
  on_attach = on_attach,
  view = {
    float = {
      enable = true,
      open_win_config = {
        border = "single",
        height = 20,
      },
    },
  },
  renderer = {
    indent_width = 1,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        diagnostics = false,
        bookmarks = false,
      },
    },
  },
  actions = {
    file_popup = {
      open_win_config = {
        border = "single",
      },
    },
  },
})
