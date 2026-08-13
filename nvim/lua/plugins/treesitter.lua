require("nvim-treesitter").setup({
	ensure_installed = {
		"help",
		"lua",
		"c",
		"cpp",
		"go",
		"python",
		"rust",
		"svelte",
		"typescript",
		"javascript",
		"css",
		"bash",
		"json",
		"yaml",
		"toml",
		"ansible",
		"terraform",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})

local langs = { "svelte", "c", "cpp", "python", "javascript", "typescript", "css", "terraform", "ansible", "sql" }

for _, lang in pairs(langs) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { lang },
		callback = function()
			vim.treesitter.start()
		end,
	})
end
