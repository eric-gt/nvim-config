return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "[F]ormat Buffer",
			},
		},
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			notify_on_error = false,
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimport", stop_after_first = true },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "yamllint" },
			},
			formatters = {
				shfmt = {
					prepen_args = { "-i", "2" },
				},
			},
		},
	},
}
