-- lua/custom/plugins/navic.lua

return {
  'SmiteshP/nvim-navic',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  opts = {
    highlight = true,
    separator = ' > ',
    depth_limit = 5,
  },
  config = function(_, opts)
    local navic = require 'nvim-navic'
    navic.setup(opts)

    local ignore_filetypes = {
      'TelescopePrompt',
      'neo-tree',
      'neo-tree-popup',
      'lazy',
      'help',
      'trouble',
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        if vim.tbl_contains(ignore_filetypes, ft) then
          return
        end

        if client and client.server_capabilities and client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
          vim.schedule(function()
            local win = vim.fn.bufwinid(bufnr)
            if win ~= -1 then
              vim.api.nvim_set_option_value('winbar', "%{%v:lua.require'nvim-navic'.get_location()%}", { win = win })
            end
          end)
        end
      end,
    })
  end,
}
