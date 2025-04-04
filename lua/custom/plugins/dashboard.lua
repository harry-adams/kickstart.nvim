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
      theme = 'hyper',
      config = {
        header = logo,
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = '󰍉 Find File',
            group = '@property',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Recent Files',
            group = '@property',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            desc = ' Grep Word',
            group = '@property',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            desc = ' Plugins',
            group = '@property',
            action = 'Lazy',
            key = 'l',
          },
          {
            desc = ' Restore Session',
            group = '@property',
            action = 'lua require("persistence").load({ last = true })',
            key = 's',
          },
          {
            desc = '⏻ Quit',
            group = '@property',
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
