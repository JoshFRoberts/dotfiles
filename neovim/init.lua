local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core.settings")
require("core.term")
require("core.remap")

require("lazy").setup({
    spec = {
        import = "plugin",
    },
    ui = {
        border = "rounded",
    },
    install = {
        colorscheme = { "everforest" }
    },
    change_detection = { notify = false }
})
vim.api.nvim_set_keymap("n", "<Leader>L", "<cmd>Lazy<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>M", "<cmd>Mason<cr>", {})


vim.opt.spell = false

require("core.autocmd")
require("core.statusline")
