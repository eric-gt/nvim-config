return {
	{
		"MunifTanjim/prettier.nvim",
		lazy = true,
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			local prettier = require("prettier")

			prettier.setup({
				bin = "prettierd", -- or `'prettier'` (v0.23.3+)
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
			})
		end,
	},
}
