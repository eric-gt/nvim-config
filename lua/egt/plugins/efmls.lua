return {
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		lazy = false,
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			-- Register linters and formatters per language
			local eslint_d = require("efmls-configs.linters.eslint_d")
			local eslint = require("efmls-configs.linters.eslint")
			local prettier = require("efmls-configs.formatters.prettier")
			local prettier_d = require("efmls-configs.formatters.prettier_d")
			local stylua = require("efmls-configs.formatters.stylua")
			local terraform_fmt = require("efmls-configs.formatters.terraform_fmt")
			local dprint = require("efmls-configs.formatters.dprint")

			local languages = {
				typescript = { prettier, prettier_d, eslint_d, eslint },
				lua = { stylua },
				tf = { terraform_fmt },
				terraform = { terraform_fmt },
				toml = { dprint },
			}

			-- Or use the defaults provided by this plugin
			-- check doc/SUPPORTED_LIST.md for the supported languages
			--
			-- local languages = require('efmls-configs.defaults').languages()

			local efmls_config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					rootMarkers = { ".git/" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}

			vim.lsp.config(
				"efm",
				vim.tbl_deep_extend("force", efmls_config, {
					-- Pass your custom lsp config below like on_attach and capabilities
					--
					-- on_attach = on_attach,
					-- capabilities = capabilities,
				})
			)
			vim.lsp.enable("efm")
		end,
	},
}
