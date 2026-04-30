return {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- options: macchiato, frappe, latte, mocha
				background = {
					dark = "macchiato", -- Adjust as needed
					light = "latte", -- Adjust as needed
				},
				transparent_background = true,
				term_colors = true,
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
