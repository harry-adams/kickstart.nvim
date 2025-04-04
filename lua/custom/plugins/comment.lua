-- lua/custom/plugins/comment.lua

return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  opts = {
    -- Add custom mappings or leave empty to use defaults (gcc, gbc, etc.)
  },
  config = function(_, opts)
    require('Comment').setup(opts)
  end,
}
