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
      -- Keep only the working groups
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]est/Toggle' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>x', group = 'Trouble/E[x]plore' },

      -- Buffer and navigation
      { '<leader>[', desc = 'Buffer [P]revious' },
      { '<leader>]', desc = 'Buffer [N]ext' },

      -- File operations
      { '<leader>e', desc = 'Open [E]xplorer' },
      { '<leader>f', desc = '[F]ormat file' },

      -- Tools and utilities
      { '<leader>l', desc = '[L]int current file' },
      { '<leader>z', desc = 'Toggle Zen Mode' },

      -- Single diagnostic command (moved from q to Q to avoid conflict)
      { '<leader>Q', desc = 'Open diagnostic [Q]uickfix list' },

      -- Git operations (this group works correctly, so keeping it)
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },

      -- Debug operations
      { '<leader>b', desc = 'Toggle [B]reakpoint' },
      { '<leader>B', desc = 'Conditional [B]reakpoint' },
    },
  },
}
