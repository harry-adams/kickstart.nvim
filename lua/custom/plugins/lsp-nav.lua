-- lua/custom/plugins/lsp-nav.lua

return {
  {
    'rmagatti/goto-preview',
    dependencies = { 'folke/which-key.nvim' },
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

      -- Preview group removed - causing issues
    end,
  },
}
