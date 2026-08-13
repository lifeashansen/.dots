require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "prettierd" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		py = { "ruff" },
		svelte = { "prettierd" },
		typescript = { "prettierd" },
		javascript = { "prettierd" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
