-- lua/custom/plugins/dashboard.lua

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local logo = [[

 /$$   /$$                                /$$              
| $$$ | $$                               |__/              
| $$$$| $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ 
| $$ $$ $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$
| $$  $$$$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$
| $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$
| $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$
|__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/
                                                           
                                                           
                                                           

    ]]

    return {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        center = {
          { icon = '  ', desc = 'Find Files', action = 'Telescope find_files' },
          { icon = '  ', desc = 'Recent Files', action = 'Telescope oldfiles' },
          { icon = '  ', desc = 'Search Word', action = 'Telescope live_grep' },
          { icon = '  ', desc = 'Update Plugins', action = 'Lazy update' },
          { icon = '  ', desc = 'Load Last Session', action = 'lua require("persistence").load({ last = true })' },
          { icon = '  ', desc = 'Quit Neovim', action = 'qa' },
        },
        footer = function()
          local datetime = os.date '%Y-%m-%d  %H:%M:%S'
          return { '', 'Today is ' .. datetime, '' }
        end,
      },
    }
  end,
  config = function(_, opts)
    require('dashboard').setup(opts)
  end,
}
