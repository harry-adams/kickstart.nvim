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
        { type = 'padding', val = math.floor(vim.fn.winheight(0) * 0.5) },
        header = logo,
        center = {
          { icon = '  ', desc = 'Load Last Session', action = 'lua require("persistence").load({ last = true })' },
          { icon = '  ', desc = 'Find Files', action = 'Telescope find_files' },
          { icon = '  ', desc = 'Recent Files', action = 'Telescope oldfiles' },
          { icon = '  ', desc = 'Search Word', action = 'Telescope live_grep' },
          { icon = '  ', desc = 'Update Plugins', action = 'Lazy update' },
          { icon = '  ', desc = 'Quit Neovim', action = 'qa' },
        },
        footer = footer,
        layout = {
          { type = 'padding', val = math.floor(vim.fn.winheight(0) * 0.25) },
          {
            type = 'group',
            val = function()
              return require('dashboard').config.header
            end,
          },
          { type = 'padding', val = 2 },
          {
            type = 'group',
            val = function()
              return require('dashboard').config.center
            end,
          },
          { type = 'padding', val = 2 },
          {
            type = 'group',
            val = function()
              return require('dashboard').config.footer
            end,
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require('dashboard').setup(opts)
  end,
}
