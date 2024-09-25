vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Skrót do kopiowania do systemowego schowka z klawiszem leader
vim.api.nvim_set_keymap('v', '<Leader>c', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', '"+yy', { noremap = true, silent = true })

