-- lua/custom/plugins/treesitter-context.lua

return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'folke/which-key.nvim' },
  event = 'BufReadPost',
  opts = {
    enable = true,
    throttle = true,
    max_lines = 3,
    separator = nil,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    on_attach = function(bufnr)
      local win = vim.fn.bufwinid(bufnr)
      local winbar = vim.wo[win].winbar
      if winbar and winbar:match 'navic' then
        return false
      end
      return true
    end,
  },
  config = function(_, opts)
    vim.g.treesitter_context_enabled = true
    require('treesitter-context').setup(opts)

    -- UI/Toggle group removed - causing issues
  end,
}
