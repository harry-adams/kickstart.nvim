-- lua/custom/keymaps.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { desc = 'Toggle Zen Mode' })

-- Buffer management group
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { desc = '[B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bs', function()
  require('telescope.builtin').buffers()
end, { desc = '[B]uffer [S]witch' })

-- Window management
vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split Window Below' })
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split Window Right' })
vim.keymap.set('n', '<leader>\'', '<C-^>', { desc = 'Switch to Other Buffer' })

-- Tool shortcuts
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
