return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		opts = {
			ensure_installed = {
				"actionlint",
				"stylua",
				"gopls",
				"eslint_d",
				"prettierd",
				"prettier",
				"tflint",
			},
			integrations = {
				["mason-lsp-config"] = true,
			},
		},
	},
}
