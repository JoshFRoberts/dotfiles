return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require('treesitter-context').setup {
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
            }
            local custom_treesitter_augroup = vim.api.nvim_create_augroup('custom_treesitter_augroup', {})
            vim.api.nvim_create_autocmd({"BufWinEnter"}, {
              group = custom_treesitter_augroup,
              pattern = "*.md",
              command = "TSContext disable",
            })
            vim.api.nvim_create_autocmd({"BufWinLeave"}, {
              group = custom_treesitter_augroup,
              pattern = "*.md",
              command = "TSContext enable",
            })
        end
    }
}
