return {
	{
		"nvim-tree/nvim-tree.lua",
		event = "VimEnter",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
			require("nvim-tree").setup()
		end,
	},
}
