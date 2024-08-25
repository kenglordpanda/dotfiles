vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.backup = false

--setting home dir
local home = os.getenv("HOME") -- linux
if not home then
	home = os.getenv("USERPROFILE") -- windows
end
if home then
	vim.opt.undodir = home .. "/.nvim/undodir"
end
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.cmd("set t_Co=256")
-- render xaml as xml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = { "*.xaml" }, command = "setf xml" })
