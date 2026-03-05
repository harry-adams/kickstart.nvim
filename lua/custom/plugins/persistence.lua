-- lua/custom/plugins/persistence.lua

return {
  'folke/persistence.nvim',
  dependencies = { 'folke/which-key.nvim' },
  event = 'BufReadPre',
  opts = {},
  config = function()
    require('persistence').setup({})

    local persistence = require('persistence')
    vim.keymap.set('n', '<leader>qs', function()
      persistence.select()
    end, { desc = '[Q]uit/[S]elect session' })

    vim.keymap.set('n', '<leader>ql', function()
      persistence.load()
    end, { desc = '[Q]uit/[L]oad last session' })

    vim.keymap.set('n', '<leader>qd', function()
      persistence.stop()
    end, { desc = '[Q]uit/[D]on\'t save session' })

    vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit all' })
  end,
}
