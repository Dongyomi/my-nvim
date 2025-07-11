return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = nil,
        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        start_in_insert = false,
        direction = "float",
        float_opts = {
            border = "curved",
        },
    },
}
