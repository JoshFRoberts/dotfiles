return {
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup({
                preview_config = {
                    border = 'rounded',
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    map('n', '<leader>gB', function() gs.blame_line { full = true } end)
                    map('n', '<leader>gb', gs.toggle_current_line_blame)
                    map('n', '<leader>gs', gs.stage_hunk) -- git stage this
                    map('v', '<leader>gs', gs.stage_hunk) -- git stage this
                    map('n', '<leader>gus', gs.undo_stage_hunk) -- git undo stage this
                    map('v', '<leader>gus', gs.undo_stage_hunk) -- git undo stage this
                end
            })
        end,
    }
}
