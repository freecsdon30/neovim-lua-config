return {
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		config = function()
			require("toggleterm").setup()
			vim.keymap.set("n", "tt", ":ToggleTerm<CR>", { silent = true })
		end,
	},
}
