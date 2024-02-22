function ColorMyTheme(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })

    vim.cmd('highlight RedVariable guifg=#FF0000') -- Ustawienie koloru czerwonego dla zmiennyc
    vim.cmd('autocmd Syntax * highlight RedVariable guifg=#FF0000') -- Dodać podświetlenie dla każdej składni
end

ColorMyTheme()
