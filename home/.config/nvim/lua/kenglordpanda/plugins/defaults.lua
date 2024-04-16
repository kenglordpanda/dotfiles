return {
	{
		"nvim-lua/plenary.nvim",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"CursorColumn",
				"Whitespace",
			}
			require("ibl").setup({
				indent = { highlight = highlight, char = "" },
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		event = "VeryLazy",
	},
	{
		"rafamadriz/friendly-snippets",
		lazy = false,
	},

	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("leap").add_default_mappings()
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	},
	{
		"onsails/lspkind.nvim",
	},
}
