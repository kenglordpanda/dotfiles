require("kenglordpanda.core")
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
if vim.fn.exists("g:vscode") ~= 0 then
	require("lazy").setup({
		spec = {
			{ import = "kenglordpanda.vscode-plugins" },
		},
	})
	require("kenglordpanda.vscode-keymaps")
else
	require("lazy").setup({
		spec = {
			{ import = "kenglordpanda.plugins" },
		},
	})
	vim.keymap.set("n", "<Leader>la", ":Lazy<CR>", { desc = "Open Lazy Manager" })
	require("kenglordpanda.lsp")
	vim.cmd("colorscheme onedark")
	vim.cmd("set hidden")
	vim.cmd("set clipboard=unnamedplus")
	vim.cmd("set clipboard+=unnamed")
end
