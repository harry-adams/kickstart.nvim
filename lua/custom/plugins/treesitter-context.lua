-- lua/custom/plugins/treesitter-context.lua

return {
  'nvim-treesitter/nvim-treesitter-context',
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
  keys = {
    {
      '<leader>uc',
      function()
        vim.g.treesitter_context_enabled = not vim.g.treesitter_context_enabled
        if vim.g.treesitter_context_enabled then
          require('treesitter-context').enable()
        else
          require('treesitter-context').disable()
        end
      end,
      desc = '[U]I Toggle [C]ontext (Treesitter)',
    },
  },
  config = function(_, opts)
    vim.g.treesitter_context_enabled = true
    require('treesitter-context').setup(opts)
  end,
}
