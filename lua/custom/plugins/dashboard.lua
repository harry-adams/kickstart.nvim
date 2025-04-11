-- lua/custom/plugins/dashboard.lua
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'MaximilianLloyd/ascii.nvim',
  },
  opts = function()
    local ascii = require 'ascii'
    local logo = ascii.art.text.neovim.sharp

    local function footer()
      local datetime = os.date '%Y-%m-%d  %H:%M:%S'
      local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD 2>/dev/null'):gsub('%s+', '')
      local git = branch ~= '' and (' ' .. branch) or 'no git repo'
      local diff = vim.fn.system 'git diff --shortstat 2>/dev/null'
      local added = diff:match '(%d+) insertion' or '0'
      local deleted = diff:match '(%d+) deletion' or '0'
      local changed = diff:match '(%d+) file' or '0'
      local stats = require('lazy').stats()
      local plugin_count = type(stats.plugins) == 'table' and #stats.plugins or 0

      return {
        '',
        'Today is ' .. datetime,
        '',
        ' Git: ' .. git,
        '',
        '󰊢 Changed: ' .. changed .. '   Added: ' .. added .. '   Deleted: ' .. deleted,
        '',
        ' Plugins loaded: ' .. plugin_count,
        '',
      }
    end

    return {
      theme = 'doom',
      config = {
        header = logo,
        center = {
          {
            icon = ' ',
            desc = 'Projects',
            action = 'Telescope project',
            key = 'p',
          },
          {
            icon = '󰍉 ',
            desc = 'Find File',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            desc = 'Recent Files',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            icon = ' ',
            desc = 'Grep Word',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            icon = ' ',
            desc = 'Plugins',
            action = 'Lazy',
            key = 'l',
          },
          {
            icon = ' ',
            desc = 'Restore Session',
            action = 'lua require("persistence").load({ last = true })',
            key = 's',
          },
          {
            icon = '⏻ ',
            desc = 'Quit',
            action = 'qa',
            key = 'q',
          },
        },
        footer = footer(),
      },
    }
  end,
  config = function(_, opts)
    require('dashboard').setup(opts)
  end,
}
