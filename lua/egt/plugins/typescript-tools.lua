return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		lazy = true,
		ft = { "typescript", "typescriptreact" },
		cmd = {
			"TSToolsOrganizeImports",
			"TSToolsSortImports",
			"TSToolsRemoveUnused",
			"TSToolsAddMissingImports",
			"TSToolsFixAll",
			"TSToolsRenameFile",
		},
		opts = {
			settings = {
				expose_as_code_actions = "all",
				complete_function_calls = true,
				include_completions_with_insert_text = true,
			},
		},
	},
}
