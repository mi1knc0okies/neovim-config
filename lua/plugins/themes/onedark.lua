return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			filetypes = { markdown = false },
			render_markdown = false,
			highlights = {
				CurSearch = { fg = "#0a805c", bg = "#add1d7", style = "reverse" },
			},
			options = {
				cursorline = false,
				terminal_colors = true,
				transparency = true,
			},
		})
	  vim.cmd.colorscheme("onedark_dark")	
		for i = 1, 6 do
			vim.cmd("highlight clear markdownH" .. i)
		end
	end,
}
