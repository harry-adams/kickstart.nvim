-- lua/custom/plugins/persistence.lua

return {
  'folke/persistence.nvim',
  dependencies = { 'folke/which-key.nvim' },
  event = 'BufReadPre',
  opts = {},
  config = function()
    require('persistence').setup({})
    -- Session group removed - causing issues
  end,
}
