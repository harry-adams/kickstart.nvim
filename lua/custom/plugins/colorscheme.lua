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

      local transparent_groups = {
        'Normal', 'NormalFloat', 'FloatBorder',
        'OilNormalFloat', 'OilFloatBorder',
        'WhichKey', 'WhichKeyFloat', 'WhichKeyBorder', 'WhichKeyGroup',
        'WhichKeyDesc', 'WhichKeySeparator', 'WhichKeyValue',
        'TelescopeNormal', 'TelescopeBorder', 'TelescopePromptNormal',
        'TelescopePromptBorder', 'TelescopeResultsNormal', 'TelescopeResultsBorder',
        'TelescopePreviewNormal', 'TelescopePreviewBorder', 'TelescopeTitle',
        'TelescopePromptTitle', 'TelescopeResultsTitle', 'TelescopePreviewTitle',
        'DapUIVariable', 'DapUIScope', 'DapUIType', 'DapUIValue',
        'DapUIModifiedValue', 'DapUIDecoration', 'DapUIThread', 'DapUIStoppedThread',
        'DapUIFrameName', 'DapUISource', 'DapUILineNumber', 'DapUIFloatBorder',
        'DapUIWatchesEmpty', 'DapUIWatchesValue', 'DapUIWatchesError',
        'DapUIBreakpointsPath', 'DapUIBreakpointsInfo', 'DapUIBreakpointsCurrentLine',
        'DapUIBreakpointsLine', 'DapUIBreakpointsDisabledLine', 'DapUICurrentFrameName',
        'DapUIStepOver', 'DapUIStepInto', 'DapUIStepBack', 'DapUIStepOut',
        'DapUIStop', 'DapUIPlayPause', 'DapUIRestart', 'DapUIUnavailable',
        'DapUIWinSelect', 'DapUIEndofBuffer',
      }
      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'none' })
      end
    end,
  },
}
