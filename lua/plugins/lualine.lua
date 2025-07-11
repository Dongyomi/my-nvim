return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox",
                always_show_tabline = true,
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
                        filetype_names = {
                            NvimTree = "󱡴 explorer",
                            lazy = " plugins",
                            lspinfo = "lsp",
                            mason = "󱑤 download",
                            qf = "diagnostic",
                            checkhealth = "checkhealth",
                        },
                        symbols = {
                            alternate_file = "",
                        },
                    },
                },
                lualine_z = { { "tabs" } },
            },
            extensions = { "nvim-tree", "lazy", "mason", "quickfix", "toggleterm" },
        })
        vim.keymap.set("n", "<A-1>", "<CMD>LualineBuffersJump 1<CR>")
        vim.keymap.set("n", "<A-2>", "<CMD>LualineBuffersJump 2<CR>")
        vim.keymap.set("n", "<A-3>", "<CMD>LualineBuffersJump 3<CR>")
        vim.keymap.set("n", "<A-4>", "<CMD>LualineBuffersJump 4<CR>")
        vim.keymap.set("n", "<A-5>", "<CMD>LualineBuffersJump 5<CR>")
        vim.keymap.set("n", "<A-6>", "<CMD>LualineBuffersJump 6<CR>")
        vim.keymap.set("n", "<A-7>", "<CMD>LualineBuffersJump 7<CR>")
        vim.keymap.set("n", "<A-8>", "<CMD>LualineBuffersJump 8<CR>")
        vim.keymap.set("n", "<A-9>", "<CMD>LualineBuffersJump 9<CR>")
    end,
}
