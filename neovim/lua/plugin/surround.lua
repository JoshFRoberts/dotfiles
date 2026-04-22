return {
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
}

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surround_words             ysiw)           (surround_words)
--     make strings               ys$"            "make strings"
--     [delete around me!]        ds]             delete around me!
--     remove <b>HTML tags</b>    dst             remove HTML tags
--     'change quotes'            cs'"            "change quotes"
--     <b>or tag types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(function calls)     dsf             function calls

--    :h nvim-surround.usage
