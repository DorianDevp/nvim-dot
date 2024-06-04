local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'ruff_lsp', 'angularls','svelte', 'cssls', 'html', 'intelephense' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end, 
  },
})
