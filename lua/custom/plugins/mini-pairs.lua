-- lua/custom/plugins/mini-pairs.lua

return {
  'echasnovski/mini.pairs',
  event = 'InsertEnter',
  config = function()
    require('mini.pairs').setup()
  end,
}
