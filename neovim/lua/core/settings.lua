-- Settings

-- cursor
-- vim.api.nvim_set_option("guicursor","n-v-c-sm:hor100-Cursor,i-ci-ve:ver100-iCursor,r-cr-o:hor40,a:blinkwait700-blinkoff400-blinkon250")
vim.api.nvim_set_option("guicursor", "n:block-blinkon500-blinkoff500,o:block,i-ci:ver40-blinkon500-blinkoff500,sm-c-cr-v-ve:hor40-blinkon500-blinkoff500,t:block-blinkon500-blinkoff500-TermCursor")

-- disable mouse
vim.api.nvim_set_option("mouse","")

-- relative numbers
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.signcolumn = 'yes:4'

-- setting completion menu for autocompletion
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.list = true

-- correct tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- enable foldcolumn
vim.wo.foldcolumn = "4"
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'

-- enable wrap
vim.opt.wrap = true

-- allow "@" in filenames
vim.opt.isfname:append("@-@")

-- smart indenting by vim
vim.api.nvim_set_option("smartindent",true)

-- highlightsearch off but incsearch on with smartcase and ignorecase
vim.api.nvim_set_option("hlsearch", false)
vim.api.nvim_set_option("incsearch", true)
vim.api.nvim_set_option("smartcase", true)
vim.api.nvim_set_option("ignorecase", true)

-- colors with gui-terminal and dark background
vim.api.nvim_set_option("termguicolors", true)
vim.api.nvim_set_option("background", "dark")

-- always center
-- vim.api.nvim_set_option("scrolloff",999)
vim.opt.scrolloff = 10

-- spellchecking
vim.wo.spell = true
vim.bo.spelllang = "de"

-- highlight the current linenumber
vim.wo.cursorline = true
vim.wo.cursorlineopt = "both"

-- splitting below and right
vim.api.nvim_set_option("splitbelow",true)
vim.api.nvim_set_option("splitright",true)

-- disable Netrw-Banner
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 26
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = "cp -r"

-- undotree file management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

-- message options
vim.opt.shortmess = "aItTF"

-- hide buffers instead of closing
vim.opt.hidden = true

vim.opt.updatetime = 50
