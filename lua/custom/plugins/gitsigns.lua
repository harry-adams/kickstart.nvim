return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation (keep existing)
        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gs.nav_hunk('next')
          end
        end, { desc = 'Next Git [H]unk' })

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gs.nav_hunk('prev')
          end
        end, { desc = 'Prev Git [H]unk' })

        -- Actions under <leader>g
        map('n', '<leader>gs', gs.stage_hunk, { desc = '[G]it [S]tage hunk' })
        map('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [S]tage hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [R]eset hunk' })
        map('v', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [R]eset hunk' })
        map('n', '<leader>gS', gs.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = '[G]it [U]ndo stage' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = '[G]it [P]review hunk' })
        map('n', '<leader>gb', gs.blame_line, { desc = '[G]it [B]lame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [D]iff against index' })
        map('n', '<leader>gD', function() gs.diffthis('@') end, { desc = '[G]it [D]iff against last commit' })

        -- Toggles (keep under t group)
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gs.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    })
  end,
}
