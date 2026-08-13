local o = vim.opt

o.number = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.undofile = true
o.swapfile = false
o.termguicolors = true
o.scrolloff = 10

o.winborder = "single"

vim.diagnostic.config({
	virtual_lines = false,
})
