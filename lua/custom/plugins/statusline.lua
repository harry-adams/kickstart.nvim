-- lua/custom/plugins/statusline.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false, -- 👈 force it to load immediately
    priority = 1000, -- 👈 (optional) load early
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = vim.g.have_nerd_font,
          theme = 'gruvbox',
          section_separators = '',
          component_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename' },
          lualine_x = { 'diagnostics', 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
