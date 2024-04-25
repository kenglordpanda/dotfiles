return {
	{
		"nvim-lua/plenary.nvim",
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

	{
		"elkowar/yuck.vim",
	},
	{
		"gpanders/nvim-parinfer",
	},
}
