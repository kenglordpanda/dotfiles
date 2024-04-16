return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		opts = {},
		config = function()
			vim.o.completeopt = "menuone,noselect"
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "nvim_lsp_signature_help", max_item_count = 3 },
					{ name = "luasnip", max_item_count = 5 }, -- For luasnip users.
					{ name = "buffer", keyword_length = 1, max_item_count = 3 },
					{ name = "path", max_item_count = 2 },
					-- { name = "cmdline", max_item_count = 2 },
				}),

				formatting = {

					format = function(entry, vim_item)
						-- fancy icons and a name of kind
						local import_lspkind, lspkind = pcall(require, "lspkind")
						if import_lspkind then
							vim_item.kind = lspkind.presets.default[vim_item.kind]
						end

						-- limit completion width
						local ELLIPSIS_CHAR = "…"
						local MAX_LABEL_WIDTH = 40
						local label = vim_item.abbr
						local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
						if truncated_label ~= label then
							vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
						end

						-- set a name for each source
						vim_item.menu = ({
							buffer = "[Buff]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							path = "[PATH]",
							cmdline = "[CMD]",
						})[entry.source.name]
						return vim_item
					end,
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v2.*",
		build = "make install_jsregexp",
		lazy = false,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
