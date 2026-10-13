vim.g.mapleader = " "

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
    virtual_text = true,
    virtual_lines = false,
})

-- PACKAGE MANAGER --


local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.pack.add({
    { src = gh("nvim-treesitter/nvim-treesitter"), name = "nvim-treesitter" },
    { src = gh("nvim-mini/mini.nvim"),             name = "mini.nvim" },
    -- Blink cmp
    { src = gh("saghen/blink.lib"),                name = "blink.lib" },
    { src = gh("saghen/blink.cmp"),                name = "blink.cmp" },

    { src = gh("folke/todo-comments.nvim"),        name = "todo-comments.nvim" },

    { src = gh("stevearc/conform.nvim"),           name = "conform" },
    { src = gh("stevearc/oil.nvim"),               name = "oil.nvim" },
    { src = gh("wakatime/vim-wakatime"),           name = "wakatime" },
    { src = gh("catppuccin/nvim"),                 name = "catppuccin" },
    { src = gh("ibhagwan/fzf-lua"),                name = "fzf-lua" },

    -- Mason + Lsp
    { src = gh("mason-org/mason.nvim"),            name = "mason.nvim" },
    { src = gh("mason-org/mason-lspconfig.nvim"),  name = "mason.lspconfig" },
    { src = gh("neovim/nvim-lspconfig"),           name = "nvim-lspconfig" },

    --Trouble
    -- { src = gh("folke/trouble.nvim"),              name = "trouble.nvim" },

    { src = gh("windwp/nvim-ts-autotag"),          name = "nvim-ts-autotag" },
    { src = gh("j-hui/fidget.nvim"),               name = "fidget.nvim" },
})

local is_first_install = false

-- Only after first installation or updates
if is_first_install then
    local blink_cmp = require("blink.cmp")
    blink_cmp.build():pwait()
end

-- ACTIVATE PLUGINS --
require("blink.cmp").setup({
    keymap = {
        preset = "enter"
    }
})
require("nvim-ts-autotag").setup()
require("blink.cmp").setup()
require("fidget").setup()
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
require("oil").setup({
    delete_to_trash = true
})
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
})

-- require("mini.starter").setup()
require("mini.icons").setup()
-- require("mini.files").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()
-- require("mini.statusline").setup()
-- require("mini.starter").setup()
-- require("mini.completion").setup()
--
-- require("trouble").setup({})
require("wakatime").setup()

require("mason").setup()

local enabled_lsps = {
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
    "rust_analyzer",
    "dockerls"

}
require("mason-lspconfig").setup({
    ensure_installed = enabled_lsps,
    automatic_enable = enabled_lsps,
})

local treesitter_enabled = {
    "help",
    "lua",
    "c",
    "cpp",
    "make",
    "cmake",
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
}
require("nvim-treesitter").setup({
    auto_install = true,
    ensure_installed = treesitter_enabled,
    highlight = {
        enable = true,
    },
})


for _, lang in pairs(treesitter_enabled) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { lang },
        callback = function()
            vim.treesitter.start()
        end,
    })
end
require("todo-comments").setup()

vim.cmd.colorscheme("catppuccin-mocha")

-- KEYMAPS --

-- vim.keymap.set("n", "<Leader>e", "<CMD>Neotree position=float<Cr>")
vim.keymap.set("n", "<Leader>e", "<CMD>Oil<Cr>", { desc = "Open oil file explorer" })
vim.keymap.set("n", "<Leader>ff", "<CMD>FzfLua files<Cr>")
vim.keymap.set("n", "<Leader>fb", "<CMD>FzfLua buffers<Cr>")
vim.keymap.set("n", "<Leader>d", function()
    vim.diagnostic.setqflist({ bufnr = 0 })
end)
vim.keymap.set("n", "<Leader>dx", "<CMD>cclose<Cr>")

vim.keymap.set("n", "<Leader>x", "<CMD>bdelete<Cr>")
-- Yank to system clipboard
vim.keymap.set("v", "Y", '"+y')


vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<Cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<Cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>td", function()
    local is_virtual_text_enabled = vim.diagnostic.config().virtual_text

    vim.diagnostic.config({
        virtual_text = ! is_virtual_text_enabled,
        virtual_lines = is_virtual_text_enabled,
    })
end, { desc = "Toggle diagnostics" })
