local formatter = require('formatter')

formatter.setup({
  -- Definiowanie konfiguracji formatowania
  filetype = {
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

