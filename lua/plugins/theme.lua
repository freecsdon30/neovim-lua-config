return {
	{
		url = "https://github.com/projekt0n/github-nvim-theme",
		name = "github-theme",
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = false,
				},
				groups = {
					all = {
						Normal = { bg = "#000000" },
						NormalFloat = { bg = "#000000" },
						SignColumn = { bg = "#000000" },
						EndOfBuffer = { bg = "#000000" },
					},
				},
			})

			vim.cmd("colorscheme github_dark")
		end,
	},
}
