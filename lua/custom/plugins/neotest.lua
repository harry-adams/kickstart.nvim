return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-python',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local map = vim.keymap.set

    local function open_floating_term(cmd)
      local buf = vim.api.nvim_create_buf(false, true)
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.6)
      local win = vim.api.nvim_open_win(buf, true, {
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

    -- Run all tests
    map('n', '<leader>ta', function()
      open_floating_term 'mpb test'
    end, { desc = '[T]est [A]ll tests' })

    -- Run tests in current file
    map('n', '<leader>tf', function()
      open_floating_term('mpb test ' .. vim.fn.expand '%')
    end, { desc = '[T]est [F]ile' })

    -- Run test under cursor
    map('n', '<leader>tt', function()
      local file = vim.fn.expand '%'
      local row = vim.api.nvim_win_get_cursor(0)[1] - 1
      local ts_utils = require 'nvim-treesitter.ts_utils'
      local parser = vim.treesitter.get_parser(0, 'python')
      local tree = parser:parse()[1]
      local root = tree:root()

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

      local cmd = string.format('mpb test %s -k %q', file, test_name)
      open_floating_term(cmd)
    end, { desc = '[T]est [T]est under cursor (floating)' })
  end,
}
