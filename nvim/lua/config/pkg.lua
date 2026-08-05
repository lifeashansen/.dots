local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.pack.add({
    { src = gh("nvim-treesitter/nvim-treesitter"), name = "nvim-treesitter" },
    { src = gh("nvim-mini/mini.nvim"),             name = "mini.nvim" },
    -- Blink cmp
    { src = gh("saghen/blink.lib"),                name = "blink.lib" },
    { src = gh("saghen/blink.cmp"),                name = "blink.cmp" },

    { src = gh("stevearc/conform.nvim"),           name = "conform" },
    { src = gh("vyfor/cord.nvim"),                 name = "cord" },
    { src = gh("wakatime/vim-wakatime"),           name = "wakatime" },
    { src = gh("catppuccin/nvim"),                 name = "catppuccin" },
    { src = gh("ibhagwan/fzf-lua"),                name = "fzf-lua" },

    -- Neotree
    { src = gh("nvim-neo-tree/neo-tree.nvim") },
    -- dependencies
    { src = gh("nvim-lua/plenary.nvim"),           name = "plenary" },
    { src = gh("MunifTanjim/nui.nvim"),            name = "nui" },
    -- optional, but recommended
    { src = gh("nvim-tree/nvim-web-devicons"),     name = "nvim-web-devicons" },

    -- Mason + Lsp
    { src = gh("mason-org/mason.nvim"),            name = "mason.nvim" },
    { src = gh("mason-org/mason-lspconfig.nvim"),  name = "mason.lspconfig" },
    { src = gh("neovim/nvim-lspconfig"),           name = "nvim-lspconfig" },

    --Trouble
    { src = gh("folke/trouble.nvim"),              name = "trouble.nvim" },
})

local is_first_install = false

-- Only after first installation or updates
if is_first_install then
    local cmp = require("blink.cmp")
    cmp.build():pwait()
    cmp.setup()
end
