-- lua/custom/plugins/neotest.lua

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
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
          runner = 'pytest',
          args = { '--capture=no', '--log-cli-level=INFO' },
          python = function()
            return os.getenv 'VIRTUAL_ENV' and vim.fn.exepath 'python' or 'python3'
          end,
        },
      },
    }

    local map = vim.keymap.set
    map('n', '<leader>tt', function()
      neotest.run.run()
    end, { desc = '[T]est [T]est (nearest)' })

    map('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = '[T]est [F]ile' })

    map('n', '<leader>td', function()
      neotest.run.run { strategy = 'dap' }
    end, { desc = '[T]est [D]ebug' })

    map('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = '[T]est [S]ummary' })

    map('n', '<leader>to', function()
      neotest.output.open { enter = true, auto_close = true }
    end, { desc = '[T]est [O]utput' })

    map('n', '<leader>tp', function()
      vim.cmd '!pytest %'
    end, { desc = '[T]est: run pytest on file (manual)' })
  end,
}
