return {
	{
		"yorickpeterse/nvim-pqf",
		config = function()
			require("pqf").setup({
				signs = {
					error = "E",
					warning = "W",
					info = "I",
					hint = "H",
				},
				show_multiple_lines = false,
				max_filename_length = 0,
			})
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		depedencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
