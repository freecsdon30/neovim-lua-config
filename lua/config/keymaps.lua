local workDirPath = "/home/harshitkumar/Work/Digantara"
local runners = {
	go = "cd " .. workDirPath .. " && go build -o katana/build/katana" .. " && ./katana/build/katana s katana",
	python = "python %",
	javascript = "node %",
	cpp = "g++ -std=c++17 -O2 % -o %:r && %:r",
}

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>n", ":BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>d", ":BufferClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Git [D]iff [V]iew" })
vim.keymap.set(
	"n",
	"<leader>dvc",
	":DiffviewClose<CR>",
	{ noremap = true, silent = true, desc = "Git [D]iff [V]iew [C]lose" }
)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--auto complete brackets
vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true })
--

vim.keymap.set("n", "<leader>r", function()
	vim.cmd("write")

	local ft = vim.bo.filetype
	local cmd = runners[ft]

	if not cmd then
		print("No runner for " .. ft)
		return
	end

	cmd = cmd:gsub("%%:r", vim.fn.expand("%:r"))
	cmd = cmd:gsub("%%", vim.fn.expand("%"))

	local dir = vim.fn.expand("%:p:h")

	vim.fn.jobstart({
		"x-terminal-emulator",
		"-e",
		"bash",
		"-lc",
		"cd '" .. dir .. "' && " .. cmd .. "; echo; read -p 'Press enter to close...'",
	}, { detach = true })
end)
