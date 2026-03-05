return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 200,
    win = {
      -- Configure floating window to respect transparent theme
      border = 'none', -- Remove border to avoid background conflicts
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = false, -- Disable title to avoid background
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = 'left', -- align columns left, center or right
    },
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      -- Left Column - Navigation & Tools
      { '<leader>e', desc = 'Explorer (Root Dir)' },
      { '<leader>E', desc = 'Explorer (cwd)' },
      { '<leader>K', desc = 'Keyword/prg' },
      { '<leader>l', desc = 'Lazy' },
      { '<leader>L', desc = 'LazyVim Changelog' },
      { '<leader>p', desc = 'Open Yank History' },
      { '<leader>z', desc = 'Zen Mode' },
      { '<leader>v', desc = 'Switch Buffer' },
      { '<leader>-', desc = 'Split Window Below' },

      -- Middle Column - Search & Core
      { '<leader>/', desc = 'Grep (Root Dir)' },
      { '<leader>:', desc = 'Command History' },
      { '<leader>?', desc = 'Buffer Localmaps (which-key)' },
      { '<leader>\'', desc = 'Switch to Other Buffer' },
      { '<leader>|', desc = 'Split Window Right' },
      { '<leader> ', desc = 'Find Files (Root Dir)' },
      { '<leader>a', group = '+ai' },
      { '<leader>b', group = '+buffer' },
      { '<leader>c', group = '+code', mode = { 'n', 'x' } },

      -- Right Column - Feature Groups
      { '<leader>f', group = '+file/find' },
      { '<leader>g', group = '+git' },
      { '<leader>q', group = '+quit/session' },
      { '<leader>s', group = '+search' },
      { '<leader>t', group = '+test' },
      { '<leader>u', group = '+ui' },
      { '<leader>w', group = '+windows' },
      { '<leader>x', group = '+diagnostics/quickfix' },
      { '<leader><Tab>', group = '+tabs' },
    },
  },
}
