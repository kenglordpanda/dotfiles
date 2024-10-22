return {

	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function(_, opts)
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					cpp = { "clang-format" },
					markdown = { "markdownlint" },
					javascript = { "prettierd" },
					typescript = { "prettierd " },
					html = { "prettierd" },
					css = { "prettierd" },
					scss = { "prettierd" },
					latex = { "bibtex-tidy", "latexindent" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				cpp = { "cpplint" },
				lua = { "luacheck" },
				python = { "flake8" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				css = { "stylelint" },
				scss = { "stylelint" },
				latex = { "vale" },
				html = { "htmlhint" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
