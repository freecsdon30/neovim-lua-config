return {
	url = "https://github.com/skylarmb/torchlight.nvim.git",
	branch = "main",
	priority = 1000,
	config = function()
		require("torchlight").setup({
			"skylarmb/torchlight.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				contrast = "medium", -- possible values: soft, medium, hard, stark
			},
		})
	end,
}
