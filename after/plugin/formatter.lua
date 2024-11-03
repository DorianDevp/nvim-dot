local formatter = require('formatter')

vim.keymap.set("n", "<leader>ff", ":FormatWrite<CR>", { silent = false })

formatter.setup({
    -- Definiowanie konfiguracji formatowania
    filetype = {
        go = {
            function()
                return {
                    exe = "gofmt",  -- Using gofmt to directly format the file
                    args = {},
                    stdin = true  -- Try setting stdin to true to avoid temp files
                }
            end
        },
        php = {
            -- Definiowanie sposobu formatowania plików PHP
            function()
                return {
                    exe = "php-cs-fixer",  -- Komenda do uruchomienia
                    args = {
                        "fix",  -- Komenda do działania (formatowanie)
                        vim.api.nvim_buf_get_name(0),  -- Ścieżka do bieżącego pliku
                        "--config", "~/.config/formatter/.php-cs-formatter.php",  -- Ścieżka do pliku konfiguracyjnego php-cs-fixer
                        "--using-cache=no",  -- Wyłączenie pamięci cache (opcjonalnie)
                    },
                }
            end
        }
    }
})

