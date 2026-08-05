local languages = {
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
    "treesitter",
    "nginx"
}

require("nvim-treesitter").setup({
    ensure_installed = languages,
    auto_install = true,
    highlight = {
        enable = true,
    },
})


for _, language in pairs(languages) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { language },
        callback = function()
            vim.treesitter.start()
        end,
    })
end
