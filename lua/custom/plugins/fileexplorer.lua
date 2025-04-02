return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      show_hidden = true,
      show_preview = true,
    },
    skip_confirm_for_simple_edits = true,
    columns = { 'icon', 'size', 'mtime' },
    use_default_keymaps = true,
    float = {
      padding = 2,
      max_width = 160,
      max_height = 25,
      border = 'rounded',
      win_options = {
        winblend = 0,
      },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
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
        max_width = math.huge, -- Take up nearly full screen width
        max_height = math.huge, -- Take up nearly full screen height
        border = 'rounded',
        win_options = {
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    }
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'OilFile', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'OilDir', { link = 'Directory' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    -- Highlight tweaks (optional)
    vim.api.nvim_set_hl(0, 'OilDir', { link = 'Directory' })
    vim.api.nvim_set_hl(0, 'OilFile', { link = 'Normal' })

    -- Open Oil in floating window (centered by above config)
    vim.keymap.set('n', '<leader>e', require('oil').open_float, { desc = 'Open [E]xplorer (Oil Float)' })
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
