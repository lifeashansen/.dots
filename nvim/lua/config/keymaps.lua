vim.keymap.set("n", "<Leader>e", "<CMD>Neotree position=float<Cr>")
vim.keymap.set("n", "<Leader>ff", "<CMD>FzfLua files<Cr>")
vim.keymap.set("n", "<Leader>fb", "<CMD>FzfLua buffers<Cr>")
vim.keymap.set("n", "<Leader>d", function()
    vim.diagnostic.setqflist({ bufnr = 0 })
end)
vim.keymap.set("n", "<Leader>dx", "<CMD>cclose<Cr>")

vim.keymap.set("n", "<Leader>x", "<CMD>bdelete<Cr>")

vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<Cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<Cr>", { noremap = true, silent = true })
