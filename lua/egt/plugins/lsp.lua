return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			"hrsh7th/nvim-cmp",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.g["diagnostics_active"] = true
			local group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = function(event)
					local map = function(mode, keys, func, desc)
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					--Toggle the LSP Diagnostics (useful for places where you don't need working code)
					map("n", "<leader>td", function()
						if vim.g.diagnostics_active then
							vim.g.diagnostics_active = false
							vim.diagnostic.enable(false)
						else
							vim.g.diagnostics_active = true
							vim.diagnostic.enable()
						end
					end, "[T]oggle [D]iagnostics")
					-- Jump to the definition of the word under your cursor.
					map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					map("n", "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map(
						"n",
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor
					--  Most Language Servers support renaming across files, etc.
					map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap
					map("n", "K", vim.lsp.buf.hover, "Hover Documentation")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header
					map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("i", "<leader>hs", vim.lsp.buf.signature_help, "[S]how [S]ignature [H]elp")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--   When you move your cursor, the highlights will be cleared (the second autocommand).

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			vim.filetype.add({ extension = { templ = "templ" } })
		end,
	},
}
