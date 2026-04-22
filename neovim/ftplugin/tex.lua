-- Compile LaTeX from file
vim.api.nvim_buf_set_keymap(0, "n", "<leader>cc", ":exec 'w' <bar> :exec '!xelatex %'<cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":exec 'w' <bar> :exec  'w' <bar> :exec '!xelatex %'<cr>", {})
vim.api.nvim_buf_set_keymap(0, "i", "<F5>", "<esc> :exec 'w' <bar> :exec '!xelatex %'<cr>", {})
vim.api.nvim_buf_set_keymap(0, "v", "<F5>", "<esc> :exec 'w' <bar> :exec '!xelatex %'<cr>", {})

-- Open PDF-Viewer from LaTeX-file
vim.api.nvim_buf_set_keymap(0, "n", "<leader>cz", ":silent !zathura --fork %:r.pdf& <cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", "<F6>", ":silent !zathura --fork %:r.pdf& <cr>", {})
vim.api.nvim_buf_set_keymap(0, "i", "<F6>", "<esc> :silent !zathura --fork %:r.pdf& <cr>", {})
vim.api.nvim_buf_set_keymap(0, "v", "<F6>", "<esc> :silent !zathura --fork %:r.pdf& <cr>", {})
