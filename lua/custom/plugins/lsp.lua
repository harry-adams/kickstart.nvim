-- lua/custom/plugins/lsp.lua
return {
  {
    -- Lua LSP helper for Neovim config and plugins
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  {
    -- Main LSP setup
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Enhanced hover + diagnostics (keep K for default man pages)
          map('gh', function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
              return
            end

            local client = clients[1]
            local params = vim.lsp.util.make_position_params(0, client.offset_encoding)

            -- Get diagnostics for current line
            local line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local line_diagnostics = vim.diagnostic.get(0, { lnum = line })

            vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result)
              local all_contents = {}
              local code_lang = nil

              -- Process hover content
              if result and result.contents then
                local hover_contents = {}
                if type(result.contents) == 'table' and result.contents.kind == 'markdown' then
                  hover_contents = vim.split(result.contents.value, '\n')
                elseif type(result.contents) == 'table' then
                  for _, content in ipairs(result.contents) do
                    if type(content) == 'string' then
                      vim.list_extend(hover_contents, vim.split(content, '\n'))
                    elseif content.value then
                      vim.list_extend(hover_contents, vim.split(content.value, '\n'))
                    end
                  end
                end

                -- Parse hover content to extract code
                local in_code_block = false
                for _, line_content in ipairs(hover_contents) do
                  local lang_match = line_content:match('^```(.*)$')
                  if lang_match then
                    if not in_code_block then
                      code_lang = lang_match ~= '' and lang_match or nil
                      in_code_block = true
                    else
                      in_code_block = false
                    end
                  else
                    table.insert(all_contents, line_content)
                  end
                end
              end

              -- Add diagnostics if present
              if #line_diagnostics > 0 then
                if #all_contents > 0 then
                  table.insert(all_contents, '')
                  table.insert(all_contents, '─ Diagnostics ─')
                  table.insert(all_contents, '')
                end

                for _, diagnostic in ipairs(line_diagnostics) do
                  local severity_icons = {
                    [vim.diagnostic.severity.ERROR] = '✘ ERROR',
                    [vim.diagnostic.severity.WARN] = '▲ WARNING',
                    [vim.diagnostic.severity.INFO] = 'ℹ INFO',
                    [vim.diagnostic.severity.HINT] = '⚑ HINT',
                  }
                  local severity = severity_icons[diagnostic.severity] or 'DIAGNOSTIC'
                  table.insert(all_contents, severity .. ': ' .. diagnostic.message)
                  if diagnostic.source then
                    table.insert(all_contents, '  Source: ' .. diagnostic.source)
                  end
                  table.insert(all_contents, '')
                end
              end

              -- If no content at all, show message and return
              if #all_contents == 0 then
                print('No hover information or diagnostics available')
                return
              end

              -- Create floating window
              local buf = vim.api.nvim_create_buf(false, true)
              local max_width = math.floor(vim.o.columns * 0.8)
              local max_height = math.floor(vim.o.lines * 0.6)

              -- Calculate dimensions
              local width = math.min(max_width, math.max(50, math.max(unpack(vim.tbl_map(function(line_content) return #line_content end, all_contents)))))
              local height = math.min(max_height, #all_contents + 2)

              local win = vim.api.nvim_open_win(buf, true, {
                relative = 'editor',
                width = width,
                height = height,
                row = math.floor((vim.o.lines - height) / 2),
                col = math.floor((vim.o.columns - width) / 2),
                style = 'minimal',
                border = 'rounded',
              })

              -- Set content
              vim.api.nvim_buf_set_lines(buf, 0, -1, false, all_contents)
              vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf })

              -- Set syntax highlighting for hover content if detected
              if code_lang and code_lang ~= '' then
                vim.api.nvim_set_option_value('filetype', code_lang, { buf = buf })
                vim.cmd(string.format('setlocal syntax=%s', code_lang))
              else
                vim.api.nvim_set_option_value('filetype', 'text', { buf = buf })
              end

              vim.api.nvim_set_option_value('modifiable', false, { buf = buf })

              -- Add close keymaps
              vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
              vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>close<CR>', { noremap = true, silent = true })
            end)
          end, '[G]o [H]over + Diagnostics')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic sign configuration (modern API)
      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = 'ℹ',
          },
        },
        float = {
          border = 'rounded',
        },
      }

      -- LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local util = require 'lspconfig.util'
      local root = util.root_pattern '.git'(vim.fn.getcwd()) or vim.fn.getcwd()

      local servers = {
        basedpyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'strict',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
                reportAny = 'none',
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Configure signature help with borders (hover is handled by custom function above)
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
      })
    end,
  },
}
