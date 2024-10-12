local lsp_zero = require('lsp-zero')
local lspConfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'ruff_lsp', 'angularls', 'svelte', 'cssls', 'intelephense', 'gopls', 'psalm' },
  handlers = {
    function(server_name)
      lspConfig[server_name].setup({})

      if server_name == "psalm" then
        lspConfig[server_name].setup({
          root_dir = function(fname)
            -- Look for psalm.xml, composer.json, or .git to determine the project root
            return require('lspconfig').util.root_pattern('psalm.xml', 'psalm.xml.dist', 'composer.json', '.git')(fname) or vim.fn.getcwd()
          end,
        })
      end
      if server_name == "angularls" then
        lspConfig.angularls.setup {
          filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' }
        }

        lspConfig.angularls.setup {
          root_dir = lspConfig.util.root_pattern('angular.json', 'workspace.json', '.git'),  -- Znajduje katalog root
          cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations", "/Users/dorian/.local/share/nvim/mason/packages/angular-language-server/node_modules", 
            "--ngProbeLocations", "/Users/dorian/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules"
          },
        }
      end
    end, 
  },
})

-- here you can edit shortcuts
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),  -- Użycie Tab do akceptacji sugestii
    ['<C-Space>'] = cmp.mapping.complete(),  -- Użycie Ctrl+Space do wywołania manualnie autouzupełnienia
    ['<CR>'] = cmp.mapping.confirm({ select = false }),  -- Użycie Enter do akceptacji tylko wybranych sugestii
    -- Możesz też skonfigurować Shift+Tab do poruszania się wstecz
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
})
