return {
	{
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				highlight = { timer = 200 },
				ring = { history_length = 50 },
			})
			vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
			vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
		end,
	},
}
