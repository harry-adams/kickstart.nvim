-- lua/custom/plugins/persistence.lua

return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  keys = {
    {
      '<leader>qs',
      function()
        require('persistence').load()
      end,
      desc = '[Q]uick Restore [S]ession',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load { last = true }
      end,
      desc = '[Q]uick Restore [L]ast Session',
    },
    {
      '<leader>qd',
      function()
        require('persistence').stop()
      end,
      desc = '[Q]uick [D]isable Session Saving',
    },
  },
}
