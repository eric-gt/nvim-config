return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "vale" },
				yaml = { "actionlint" },
				javascript = { "eslint_d", "eslint" },
				typescript = { "eslint_d", "eslint" },
			}
			vim.api.nvim_create_autocmd({ "TextChanged" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
