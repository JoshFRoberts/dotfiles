return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        -- event = "BufReadPre",
        opts = {
            ensure_installed = {
                "c",
                "lua",
                "rust",
                "latex",
                "bibtex",
                "python",
                "vim",
                "yaml",
                "json",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
