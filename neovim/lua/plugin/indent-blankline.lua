return {
    {
        "lukas-reineke/indent-blankline.nvim",
        -- event = "BufReadPre",
        main = 'ibl',
        config = function()
            require("ibl").setup({
                enabled = true,
                indent = {
                    char = "│",
                    smart_indent_cap = true
                },
                whitespace = {
                    remove_blankline_trail = true,
                },
                scope = {
                    exclude = {
                        language = { "help", "lazy" }
                    }
                },
            })
        end,
    },
}
