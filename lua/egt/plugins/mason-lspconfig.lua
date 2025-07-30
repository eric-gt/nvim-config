return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				exclude = { "ts_ls", "rust_analyzer", "htmx" },
			},
			ensure_installed = {
				"gopls",
				"templ",
				"htmx",
				"html",
				"tailwindcss",
				"yamlls",
				"lua_ls",
				"terraformls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
