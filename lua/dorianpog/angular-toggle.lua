-- Funkcja do otwierania pliku
local function open_matching_file(pattern)
  local dir_path = vim.fn.expand('%:p:h')

  local match = vim.fn.glob(dir_path .. '/' .. pattern)
  
  if match ~= "" then
    vim.cmd('edit ' .. match)
  else
    print("Nie znaleziono pliku, który pasuje do '" .. pattern .. "'")
  end
end

local function toggle()
  local file_extension = vim.fn.expand('%:e')

  if file_extension == "ts" then
    open_matching_file("*component.html")
  elseif file_extension == "html" then
    open_matching_file('*component.ts')
  else
    print("To rozszerzenie nie jest obsługiwane przez ten skrypt. Ext: " .. file_extension)
  end
end

vim.keymap.set("n", "<leader>tt", toggle)

vim.keymap.set("n", "<leader>tq", function() open_matching_file('*.component.ts') end)
vim.keymap.set("n", "<leader>tw", function() open_matching_file('*.component.html') end)
vim.keymap.set("n", "<leader>te", function() open_matching_file('*.component*css') end)
vim.keymap.set("n", "<leader>tr", function() open_matching_file('*.spec.ts') end)

