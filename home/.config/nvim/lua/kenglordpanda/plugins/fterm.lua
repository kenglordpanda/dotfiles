return {

	{
		"numToStr/Fterm.nvim",
		opts = {
			vim.keymap.set(
				"n",
				"<A-i>",
				'<CMD>lua require("FTerm").toggle()<CR>',
				{ desc = "Toggle Terminal", silent = true, noremap = true }
			),
			vim.keymap.set(
				"t",
				"<A-i>",
				'<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
				{ desc = "Toggle Terminal", silent = true, noremap = true }
			),
			border = "double",
			dimensions = {
				height = 0.65,
				width = 0.65,
			},
		},
		config = function(_, opts)
			require("FTerm").setup(opts)
		end,
		lazy = true,
	},
}
