vim.keymap.set("n", "<Leader>e", "<CMD>Neotree position=float<Cr>")
vim.keymap.set("n", "<Leader>ff", "<CMD>FzfLua files<Cr>")
vim.keymap.set("n", "<Leader>fb", "<CMD>FzfLua buffers<Cr>")
vim.keymap.set("n", "<Leader>d", function()
	vim.diagnostic.setqflist({ bufnr = 0 })
end)
vim.keymap.set("n", "<Leader>dx", "<CMD>cclose<Cr>")

vim.keymap.set("n", "<Leader>x", "<CMD>bdelete<Cr>")
