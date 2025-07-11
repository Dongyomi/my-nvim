return {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_transparent_background = 1
        vim.cmd.colorscheme("gruvbox-material")
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1F1F1F" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1F1F1F" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1F1F1F" })
        vim.api.nvim_set_hl(0, "PmenuExtra", { bg = "none" })
    end,
}
