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

-- Window management
vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split Window Below' })
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split Window Right' })
vim.keymap.set('n', '<leader>\'', '<C-^>', { desc = 'Switch to Other Buffer' })

-- Tool shortcuts
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Test runner (floating terminal)
local function open_floating_term(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = 'minimal',
    border = 'rounded',
  })
  vim.fn.termopen(cmd)
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
end

vim.keymap.set('n', '<leader>ta', function()
  open_floating_term 'mpb test --disable-warnings'
end, { desc = '[T]est [A]ll tests' })

vim.keymap.set('n', '<leader>tf', function()
  open_floating_term('mpb test --disable-warnings ' .. vim.fn.expand '%')
end, { desc = '[T]est [F]ile' })

vim.keymap.set('n', '<leader>tt', function()
  local file = vim.fn.expand '%'
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local parser = vim.treesitter.get_parser(0, 'python')
  local tree = parser:parse()[1]

  local function get_enclosing(node, type_name)
    while node do
      if node:type() == type_name then
        return node
      end
      node = node:parent()
    end
  end

  local current_node = ts_utils.get_node_at_cursor()
  local func_node = get_enclosing(current_node, 'function_definition')

  if not func_node then
    print 'No test function found under cursor'
    return
  end

  local name_node = func_node:field('name')[1]
  local test_name = vim.treesitter.get_node_text(name_node, 0)

  if not test_name then
    print 'Could not extract test name'
    return
  end

  open_floating_term(string.format('mpb test --disable-warnings %s -k %q', file, test_name))
end, { desc = '[T]est [T]est under cursor (floating)' })
