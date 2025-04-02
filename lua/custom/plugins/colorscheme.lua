return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      terminal_colors = true,
      transparent_mode = true,
    }

    vim.cmd 'colorscheme gruvbox'

    -- 👇 Set these *after* the colorscheme!
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'OilNormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'OilFloatBorder', { bg = 'none' })
  end,
}
