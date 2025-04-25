-- lua/custom/plugins/statusline.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function lsp_name()
        local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }
        if not clients or vim.tbl_isempty(clients) then
          return '  LSP Inactive'
        end
        local client_names = {}
        for _, client in pairs(clients) do
          if client.name ~= 'copilot' then
            table.insert(client_names, client.name)
          end
        end
        return '  ' .. table.concat(client_names, ', ')
      end
      local function python_venv()
        local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_DEFAULT_ENV'
        return venv and string.format(' %s', vim.fn.fnamemodify(venv, ':t')) or ''
      end

      require('lualine').setup {
        options = {
          icons_enabled = vim.g.have_nerd_font,
          theme = 'gruvbox',
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = { 'oil' },
        },
        sections = {
          lualine_a = { { 'mode', icon = '' } },
          lualine_b = { 'branch' },
          lualine_c = {
            { 'diff' },
            { 'filename', path = 1, symbols = { modified = '●', readonly = '' } },
          },
          lualine_x = { python_venv, lsp_name, 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
