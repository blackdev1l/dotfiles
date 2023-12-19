vim.g.mapleader = ","
vim.g.maplocalleader = ','
-- Fast saving
vim.keymap.set('n', '<leader>ww', ':w<CR>')
vim.keymap.set('i', '<leader>ww', '<ESC>:w<CR>')
vim.keymap.set('v', '<leader>ww', '<ESC><ESC>:w<CR>')
-- Fast esc
vim.keymap.set('i', 'ii', '<ESC>')
vim.keymap.set('n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>ez', ':e ~/.zshrc<CR>')
-- nvim tree
vim.keymap.set('n', '<F2>', ':NvimTreeToggle<CR>')
vim.keymap.set('i', '<F2>', ':NvimTreeToggle<CR>')


vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", { noremap = false })
-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", { noremap = false })
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })
--vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", { noremap = true })
-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
