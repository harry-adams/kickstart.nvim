-- lua/custom/plugins/ufo.lua

return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'BufReadPost',
  opts = {
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
      default = { 'imports', 'comment' },
    },
    provider_selector = function(bufnr, filetype, _)
      local ft = vim.bo[bufnr].filetype
      local ts_ok, parsers = pcall(require, 'nvim-treesitter.parsers')
      if ts_ok and parsers.has_parser(ft) then
        return { 'treesitter', 'indent' }
      else
        return { 'indent' }
      end
    end,
  },
  config = function(_, opts)
    require('ufo').setup(opts)

    -- Set fold options
    vim.o.foldcolumn = '1' -- Show fold indicators in sign column
    vim.o.foldlevel = 99 -- Default to expanded
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Keybindings
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds (ufo)' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds (ufo)' })
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Open folds except kinds' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Close folds with level' })
  end,
}
