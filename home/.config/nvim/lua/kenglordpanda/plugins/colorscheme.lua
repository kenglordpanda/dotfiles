return {
	"Mofiqul/dracula.nvim",
	opts = {
		transparent_bg = true,
		italic_comment = true,
	},
	config = function(_, opts)
		require("dracula").setup(opts)
	end,
}
