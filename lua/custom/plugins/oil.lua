return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>e', function() require('oil').open_float() end, desc = 'Open [E]xplorer (Oil Float)' },
  },
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
        show_preview = true,
      },
      skip_confirm_for_simple_edits = true,
      columns = { 'icon', 'size', 'mtime' },
      use_default_keymaps = true,
      float = {
        padding = 10,
        max_width = math.huge,
        max_height = math.huge,
        border = 'rounded',
        win_options = {
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    }

    vim.api.nvim_set_hl(0, 'OilFile', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'OilDir', { link = 'Directory' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function(args)
        vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', {
          buffer = args.buf,
          desc = 'Close Oil with Esc',
        })
      end,
    })
  end,
}
