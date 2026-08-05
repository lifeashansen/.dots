vim.keymap.set("n", "<Leader>e", "<CMD>Neotree position=float<Cr>")
vim.keymap.set("n", "<Leader>ff", "<CMD>FzfLua files<Cr>")
vim.keymap.set("n", "<Leader>fb", "<CMD>FzfLua buffers<Cr>")
vim.keymap.set("n", "<Leader>d", function()
    vim.diagnostic.setqflist({ bufnr = 0 })
end)
vim.keymap.set("n", "<Leader>dx", "<CMD>cclose<Cr>")

vim.keymap.set("n", "<Leader>x", "<CMD>bdelete<Cr>")

vim.keymap.set("n", "<Leader>de", function()
    local cfg = not vim.diagnostic.config().virtual_lines

    vim.diagnostic.config({
        virtual_lines = cfg
    })
end
, { desc = "Toggle diagnostic virtual_lines" })

vim.keymap.set("n", "C-n", "<CMD>bn<Cr>", { desc = "Move to next buffer" })
vim.keymap.set("n", "C-p", "<CMD>bp<Cr>", { desc = "Move to previous buffer" })
vim.keymap.set("v", "Y", '"+y', { desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
end, { desc = "Show function documentation" })
