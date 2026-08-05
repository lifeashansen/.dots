require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        css = { "prettierd" },
        html = { "prettierd" },
        go = { "gofmt" },
        rust = { "rustfmt" },
        py = { "ruff" },
        svelte = { "prettierd" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        sql = { "pg_format" },
        docker = { "dockerfmt" },
        yaml = { "yamlfmt" },
        nginx = { "nginx" },
    },
    formatters = {
        pg_format = {
            command = "/usr/bin/pg_format",
            prepend_args = { "-p", "\\$\\d+" },
        }

    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
