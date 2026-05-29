return {
	{
		url = "https://codeberg.org/evergarden/nvim.git",
		name = "evergarden",
		priority = 1000,
		config = function()
			require("evergarden").setup({
				theme = {
					variant = "winter",
					accent = "orange",
				},
				editor = {
					transparent_background = false,
					sign = { color = "none" },
					float = {
						color = "mantle",
						solid_border = false,
					},
					completion = {
						color = "surface0",
					},
				},
			})

			vim.cmd("colorscheme evergarden")
		end,
	},
}
