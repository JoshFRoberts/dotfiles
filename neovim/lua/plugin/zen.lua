return {
    {
        "folke/zen-mode.nvim",
        lazy = true,
        opts = {
            window = {
                backdrop = 1,
                width = 120,
            },
            plugins = {
                options = {
                    enabled = true,
                    showcmd = true,
                    laststatus = 3,
                },
                gitsigns = { enabled = false }
            },
        },
        keys = {
          {"<leader>zz", function() require("zen-mode").toggle() end, desc = "toggle zenmode"}
        }
    }
}
