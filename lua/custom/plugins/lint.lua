-- lua/custom/plugins/lint.lua

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPost', 'BufWritePost' },
  config = function()
    require('lint').linters.ruff.cmd = '/Users/harryadams/.local/bin/ruff'
    require('lint').linters_by_ft = {
      python = { 'ruff' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      require('lint').try_lint()
    end, { desc = '[L]int current file' })
  end,
}
