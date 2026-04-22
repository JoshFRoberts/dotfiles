return {
    {
        "sainnhe/everforest",
        priority = 1000,
        config = function()
            -- Settings for colorscheme
            vim.api.nvim_set_var("everforest_background", "hard")
            vim.api.nvim_set_var("everforest_transparent_background", "1")
            vim.api.nvim_set_var("everforest_ui_contrast", "low")
            vim.api.nvim_set_var("everforest_show_eob", "0")
            vim.api.nvim_set_var("everforest_enable_bold", "1")
            vim.api.nvim_set_var("everforest_enable_italic", "1")
            vim.api.nvim_set_var("everforest_better_performance", "1")
            vim.cmd([[colo everforest]])

            -- Settings to override colorscheme
            -- vim.api.nvim_set_hl(0, "ModeMsg", { bold = true, fg = "#d8a657"})
            -- colors of tabline
            vim.api.nvim_set_hl(0, "TabLine", { bg = "#272e33", fg = "#dfa000" })
            vim.api.nvim_set_hl(0, "TabLineFil", { bg = "#374145" })
            vim.api.nvim_set_hl(0, "TabLineSel", { bold = true, bg = "none", fg = "#d8a657" })
            -- color of statusline
            vim.api.nvim_set_hl(0, "StatusLine", { bold = false, bg = "#1d2021", fg = "#89b482" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1d2021", fg = "#5b534d" })
            -- color of vertical split line
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "#141617", fg = "#141617" })
            -- color of the cursorline and cursorlinenumber
            vim.api.nvim_set_hl(0, "Cursorline", { bg = "#3a464c" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#dbbc7f" })
            -- color of Floats and FloatBorders
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = none, fg = none })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = none, fg = "#9da9a0" })
            vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = none, fg = "#dfa000" })
            vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = none, fg = "#f85552" })
            vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = none, fg = "#35a77c" })
            vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = none, fg = "#8da101" })
            vim.api.nvim_set_hl(0, "Nontext", { bg = none, fg = "#859289" })

            -- autocommand for overrides
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "everforest",
                callback = function()
                    vim.api.nvim_set_hl(0, "TabLine", { bg = "#272e33", fg = "#dfa000" })
                    vim.api.nvim_set_hl(0, "TabLineFil", { bg = "#374145" })
                    vim.api.nvim_set_hl(0, "TabLineSel", { bold = true, bg = "none", fg = "#d8a657" })
                    -- color of statusline
                    vim.api.nvim_set_hl(0, "StatusLine", { bold = false, bg = "#1d2021", fg = "#89b482" })
                    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1d2021", fg = "#5b534d" })
                    -- color of vertical split line
                    vim.api.nvim_set_hl(0, "VertSplit", { bg = "#141617", fg = "#141617" })
                    -- color of the cursorline and cursorlinenumber
                    vim.api.nvim_set_hl(0, "Cursorline", { bg = "#3c464c" })
                    vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#dbbc7f" })
                    -- color of Floats and FloatBorders
                    vim.api.nvim_set_hl(0, "NormalFloat", { bg = none, fg = none })
                    vim.api.nvim_set_hl(0, "FloatBorder", { bg = none, fg = "#9da9a0" })
                    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = none, fg = "#dfa000" })
                    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = none, fg = "#f85552" })
                    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = none, fg = "#35a77c" })
                    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = none, fg = "#8da101" })
                    vim.api.nvim_set_hl(0, "Nontext", { bg = none, fg = "#859289" })
                end,
            })
        end,
    },
}
