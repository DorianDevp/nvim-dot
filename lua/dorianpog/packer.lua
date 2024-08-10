-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ({ 
        "catppuccin/nvim", as = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })
    use ({ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} })
    use ({ 'nvim-treesitter/playground' })
    use ({ 'theprimeagen/harpoon' })
    use ({ 'mbbill/undotree' })
    use ({ 'tpope/vim-fugitive' })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use("lukas-reineke/indent-blankline.nvim")
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })
    use({ "norcalli/nvim-colorizer.lua" })
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    })
    use 'AlexvZyl/nordic.nvim'
    
    use ({ 'projekt0n/github-nvim-theme' })
    use { 'mhartington/formatter.nvim' }
end)
