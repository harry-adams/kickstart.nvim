-- lua/custom/plugins/lsp-nav.lua

return {
  {
    'rmagatti/goto-preview',
    lazy = false,
    config = function()
      local gp = require 'goto-preview'
      gp.setup {
        post_open_hook = function(buf, win)
          vim.keymap.set('n', '<Esc>', function()
            if vim.api.nvim_win_is_valid(win) then
              vim.api.nvim_win_close(win, true)
            end
          end, { buffer = buf, desc = 'Close goto-preview window' })
        end,
      }

      local map = vim.keymap.set
      map('n', '<leader>pd', gp.goto_preview_definition, { desc = '[P]review [D]efinition' })
      map('n', '<leader>pi', gp.goto_preview_implementation, { desc = '[P]review [I]mplementation' })
      map('n', '<leader>pt', gp.goto_preview_type_definition, { desc = '[P]review [T]ype' })
      map('n', '<leader>pC', gp.close_all_win, { desc = '[P]review [C]lose all' })
    end,
  },
}
