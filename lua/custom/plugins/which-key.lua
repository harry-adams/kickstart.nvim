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
      mappings = vim.g.have_nerd_font,
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

    -- Only define groups that have globally-registered keymaps.
    -- Groups that only exist via buffer-local maps (git, windows/LSP) are
    -- omitted here — which-key discovers them automatically when relevant.
    spec = {
      { '<leader>b', group = 'buffer' },
      { '<leader>c', group = 'code', mode = { 'n', 'x' } },
      { '<leader>f', group = 'find' },
      { '<leader>q', group = 'quit/session' },
      { '<leader>s', group = 'search' },
      { '<leader>t', group = 'test' },
      { '<leader>x', group = 'diagnostics' },
    },
  },
}
