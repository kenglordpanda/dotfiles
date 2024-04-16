return {
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "treesitter", "lsp" },
			layout = {
				max_width = { 40, 0.175 },
				width = nil,
				min_width = 10,
				default_direction = "prefer_right",
				placement = "edge",
				resize_to_content = true,
				preserve_equality = false,
			},
			attach_mode = "window",
			ignore = {
				unlisted_buffers = false,
				filetypes = {},
				buftypes = "special",
				wintypes = "special",
			},
			autojump = true,
			manage_folds = true,
			link_folds_to_tree = true,
			link_tree_to_folds = true,
			nerd_font = "auto",
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>at",
					":AerialToggle<CR>",
					{ desc = "Toggle Aerial Window", noremap = true, silent = true }
				)
				-- vim.keymap.set(
				-- 	"n",
				-- 	"<leader>aa",
				-- 	":AerialNavToggle<CR>",
				-- 	{ desc = "Toggle Aerial Nav", noremap = true, silent = true }
				-- )
				vim.keymap.set("n", "an", function()
					local count = vim.v.count
					local command = string.format(":%d%s", count, "AerialNext")
					vim.cmd(command)
				end, { desc = "Aerial Next {count} Symbols", silent = true, noremap = true })
				vim.keymap.set("n", "ap", function()
					local count = vim.v.count
					local command = string.format(":%d%s", count, "AerialPrev")
					vim.cmd(command)
				end, { desc = "Aerial Previous {count} Symbols", silent = true, noremap = true })
				vim.keymap.set("n", "ag", function()
					local count = vim.v.count
					local command = string.format(":%d%s", count, "AerialGo")
					vim.cmd(command)
				end, { desc = "Aerial Goto {count} Symbol", silent = true, noremap = true })
			end,
			on_first_symbols = function(bufnr) end,
			close_on_select = false,
			show_guides = true,
			open_automatic = false,
			guides = {
				mid_item = "├─",
				last_item = "└─",
				nested_top = "│ ",
				whitespace = "  ",
			},

			lsp = {
				diagnostics_trigger_update = true,
				update_when_errors = true,
			},
			treesitter = {
				update_delay = 300,
			},
		},
	},
}
