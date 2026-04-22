-- remaps

-- leaderkey
vim.keymap.set("n", "<Space>", "", {})
vim.g.mapleader = " "

-- movements in commandmode
vim.api.nvim_set_keymap("c", "<C-h>", "<Left>", {})
vim.api.nvim_set_keymap("c", "<C-l>", "<Right>", {})
vim.api.nvim_set_keymap("c", "<C-j>", "<Down>", {})
vim.api.nvim_set_keymap("c", "<C-k>", "<Up>", {})

-- buffer operations
vim.api.nvim_set_keymap("n", "<leader><tab>", "<C-^>", {})
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>bd<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>bn", "<cmd>bnext<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>bprevious<cr>", {})

-- quickfix operations
vim.api.nvim_set_keymap("n", "<leader>qc", "<cmd>ccl<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qw", "<cmd>cw<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>cnext<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>cprev<cr>", {})

-- moving visual blocks
vim.api.nvim_set_keymap("v", "J", ":m '>+1<cr>gv=gv", {})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<cr>gv=gv", {})

-- delete without overwriting the '+'-register
vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", {})
vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", {})

-- paste without yanking selected text
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], {})

-- copy to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", {})
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", {})
vim.api.nvim_set_keymap("n", "<leader>Y", "\"+Y", {})

-- paste from system clipboard
vim.api.nvim_set_keymap("n", "<leader>P", "\"+p", {})

-- <leader><leader> for fast save
vim.api.nvim_set_keymap("n", "<leader><leader>", ":exec 'w'<cr>", {silent = true})

-- <leader>r for redo
vim.api.nvim_set_keymap("n", "<leader>r", ":redo <cr>", {silent = true})

-- better ZQ
vim.api.nvim_set_keymap("n", "zq", ":q!<cr>", {})

-- even better
vim.api.nvim_set_keymap("n", "<leader>XX", ":qa!<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>XZZ", ":wqa!<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>x", ":q<cr>", {})

-- faster substitution
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})
-- single line
vim.api.nvim_set_keymap("n", "<leader>S", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})
-- selection mode
vim.api.nvim_set_keymap("v", "<leader>s", [[:s//gI<Left><Left><Left>]], {})

-- vertical resize
vim.api.nvim_set_keymap("n", "<leader>vr", ":vertical-resize ", {})

vim.cmd([[
function! CenterPane()
   exec 'Lex %'
   wincmd w
 endfunction
]])

vim.api.nvim_set_keymap("n", "<leader>C", ":call CenterPane()<cr>", {})

vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lnext<CR>zz", {})
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lprev<CR>zz", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cnext<CR>zz", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cprev<CR>zz", {})

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})

vim.api.nvim_set_keymap("n", "<A-f>", "<cmd>Ex<cr>", {})
vim.api.nvim_set_keymap("n", "<A-e>", "<cmd>Floatterm<cr>", {})
vim.api.nvim_set_keymap("t", "<A-e>", "<cmd>Floatterm<cr>", {})
vim.api.nvim_set_keymap("i", "<A-e>", "<cmd>Floatterm<cr>", {})

-- easy window commands
vim.api.nvim_set_keymap("n", "<A-h>", "<C-W>h", {})
vim.api.nvim_set_keymap("n", "<A-k>", "<C-W>k", {})
vim.api.nvim_set_keymap("n", "<A-j>", "<C-W>j", {})
vim.api.nvim_set_keymap("n", "<A-l>", "<C-W>l", {})

vim.api.nvim_set_keymap("i", "<A-h>", "<esc><C-W>h", {})
vim.api.nvim_set_keymap("i", "<A-k>", "<esc><C-W>k", {})
vim.api.nvim_set_keymap("i", "<A-j>", "<esc><C-W>j", {})
vim.api.nvim_set_keymap("i", "<A-l>", "<esc><C-W>l", {})

vim.api.nvim_set_keymap("n", "<A-c>", "<C-W>c", {})
vim.api.nvim_set_keymap("n", "<A-q>", "<C-W>q", {})

vim.api.nvim_set_keymap("n", "<A-n>", "<C-W>n", {})
vim.api.nvim_set_keymap("n", "<A-s>", "<C-W>s", {})
vim.api.nvim_set_keymap("n", "<A-v>", "<C-W>v", {})

vim.api.nvim_set_keymap("n", "<Leader>cf", "gg=G''", {})
vim.api.nvim_set_keymap("v", "<Leader>cf", "=", {})
