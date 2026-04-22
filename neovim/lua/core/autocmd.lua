-- autocmd

-- Disable autocommenting on new lines under commented ones

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom_augroup = augroup('custom_augroup', {})

autocmd("Filetype", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- -- persistent folds
-- autocmd({ "BufWinLeave" }, {
--   group = custom_augroup,
--   pattern = { "*.*" },
--   desc = "save view (folds), when closing file",
--   command = "mkview",
-- })
-- autocmd({ "BufWinEnter" }, {
--   group = custom_augroup,
--   pattern = { "*.*" },
--   desc = "load view (folds), when opening file",
--   command = "silent! loadview"
-- })

autocmd("WinEnter", {
  group = custom_augroup,
  callback = function()
    vim.wo.cursorline = true
  end,
})

autocmd("WinLeave", {
  group = custom_augroup,
  callback = function()
    vim.wo.cursorline = false
  end,
})

-- remove trailing whitespace
autocmd({ "BufWritePre" }, {
  group = custom_augroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd({ "BufWinEnter" }, {
  group = custom_augroup,
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.sh", "*.typ", "*.lua" },
  callback = function()
    vim.opt.colorcolumn = "81"
  end,
})

autocmd({ "BufWinLeave", }, {
  group = custom_augroup,
  pattern = { "*.*" },
  callback = function()
    vim.opt.colorcolumn = ''
  end,
})

autocmd("LspAttach", {
  group = custom_augroup,

  callback = function(e)
    -- keymaps --
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover { border = "rounded" } end, opts)
    vim.keymap.set('n', '<space>cl', "<cmd>LspInfo<cr>", opts)
    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>cf', function() vim.lsp.buf.format { async = true } end, opts)
    -- vim.keymap.set('v', '<space>cf', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help { border = "rounded" } end, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cw", function() vim.lsp.buf.rename() end, opts)
  end,
})
