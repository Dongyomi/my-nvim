local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<TAB>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-TAB>", "<CMD>bprevious<CR>", opts)
keymap("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)
keymap("n", "<A-j>", "<CMD>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<CMD>m .-2<CR>==", opts)
keymap("n", "<A-1>", "<CMD>LualineBuffersJump 1<CR>", opts)
keymap("n", "<A-2>", "<CMD>LualineBuffersJump 2<CR>", opts)
keymap("n", "<A-3>", "<CMD>LualineBuffersJump 3<CR>", opts)
keymap("n", "<A-4>", "<CMD>LualineBuffersJump 4<CR>", opts)
keymap("n", "<A-5>", "<CMD>LualineBuffersJump 5<CR>", opts)
keymap("n", "<A-6>", "<CMD>LualineBuffersJump 6<CR>", opts)
keymap("n", "<A-7>", "<CMD>LualineBuffersJump 7<CR>", opts)
keymap("n", "<A-8>", "<CMD>LualineBuffersJump 8<CR>", opts)
keymap("n", "<A-9>", "<CMD>LualineBuffersJump 9<CR>", opts)
