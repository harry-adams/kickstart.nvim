-- lua/custom/plugins/colorscheme.lua
return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,          -- 👈 disable lazy-loading
    priority = 1000,       -- 👈 load before all other plugins
    config = function()
      require('gruvbox').setup {
        terminal_colors = true,
        transparent_mode = true,
      }

      vim.cmd('colorscheme gruvbox')

      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'OilNormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'OilFloatBorder', { bg = 'none' })
    end,
  },
}
