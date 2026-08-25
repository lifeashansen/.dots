require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "clangd",
        "svelte",
        "ruff",
        "ty",
        "ts_ls",
        "terraformls",
        "cssls",
        "ansiblels",
        "sqls",
        "angularls",
        "rust_analyzer"
    },
    automatic_enable = {
        "lua_ls",
        "go",
        "clangd",
        "svelte-language-server",
        "ruff",
        "ty",
        "ts_ls",
        "terraformls",
        "cssls",
        "ansiblels",
        "sqls",
        "angularls",
        "rust_analyzer"
        -- exclude = {},
    },
})
