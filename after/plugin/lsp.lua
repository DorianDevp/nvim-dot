local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'ruff_lsp', 'angularls','svelte', 'cssls', 'html', 'intelephense', 'gopls' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
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
