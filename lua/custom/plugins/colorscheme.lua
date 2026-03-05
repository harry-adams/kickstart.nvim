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

      -- Which-key specific transparency overrides
      vim.api.nvim_set_hl(0, 'WhichKey', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeyBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeyGroup', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeyDesc', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeySeparator', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WhichKeyValue', { bg = 'none' })

      -- Telescope specific transparency overrides
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })

      -- DAP (Debug Adapter Protocol) UI transparency overrides
      vim.api.nvim_set_hl(0, 'DapUIVariable', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIScope', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIType', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIValue', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIModifiedValue', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIDecoration', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIThread', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStoppedThread', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIFrameName', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUISource', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUILineNumber', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIFloatBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIWatchesEmpty', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIWatchesValue', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIWatchesError', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIBreakpointsInfo', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIBreakpointsCurrentLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIBreakpointsLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIBreakpointsDisabledLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUICurrentFrameName', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStepOver', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStepInto', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStepBack', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStepOut', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIStop', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIPlayPause', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIRestart', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIUnavailable', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIWinSelect', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'DapUIEndofBuffer', { bg = 'none' })
    end,
  },
}
