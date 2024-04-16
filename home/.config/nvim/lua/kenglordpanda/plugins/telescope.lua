return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {},
			extensions = { "harpoon" },
		},
		config = function(_, opts)
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({

				global_settings = {
					save_on_toggle = false,
					save_on_change = true,
					enter_on_sendcmd = false,
					tmux_autoclose_windows = false,
					excluded_filetypes = { "harpoon" },
					mark_branch = false,
					tabline = false,
					tabline_prefix = "   ",
					tabline_suffix = "   ",
				},
			})

			require("telescope").load_extension("harpoon")
			vim.keymap.set("n", "<Leader>fm", ":Telescope harpoon marks<CR>", { desc = "Harpoon find" })

			vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon add" })
			vim.keymap.set("n", "<leader>hm", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon show" })
			vim.keymap.set("n", "]h", require("harpoon.ui").nav_next, { desc = "Harpoon next" })
			vim.keymap.set("n", "[h", require("harpoon.ui").nav_prev, { desc = "Harpoon prev" })
			vim.keymap.set("n", "<leader>hg", function()
				local count = vim.v.count
				require("harpoon.ui").nav_file(count)
			end, { desc = "Harpoon go {count}" })
		end,
	},
}
