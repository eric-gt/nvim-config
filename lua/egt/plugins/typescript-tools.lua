return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		lazy = true,
		ft = { "typescript", "typescriptreact" },
		opts = {
			settings = {
				expose_as_code_actions = { "all" },
			},
		},
	},
}
