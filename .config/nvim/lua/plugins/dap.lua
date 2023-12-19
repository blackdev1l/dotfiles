require('dapui').setup()
require('dap-go').setup()
require('nvim-dap-virtual-text').setup()
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
--vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<F5>', ":DapContinue<CR>",{noremap=true})
vim.api.nvim_set_keymap('n', '<F10>',  ":DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<F11>', ":DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<F12>', ":DapStepOut<CR>", {noremap=true})
