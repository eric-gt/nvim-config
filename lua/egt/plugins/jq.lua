return {
	{
		"jrop/jq.nvim",
		ft = { "json" },
		config = function()
			local augroup = vim.api.nvim_create_augroup("jq", { clear = true })
			vim.api.nvim_clear_autocmds({ group = augroup })
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = { "*.json" },
				group = augroup,
				callback = function()
					-- format JSON files
					vim.keymap.set("n", "<leader>jq", function()
						vim.cmd("%!jq '.'")
						vim.cmd.write()
					end, { desc = "Format [J]SON with J[Q]" })
				end,
			})
			vim.api.nvim_create_autocmd({ "BufExit" }, {
				pattern = { "*.json" },
				group = augroup,
				callback = function()
					vim.keymap.del("n", "<leader>jq")
				end,
			})
		end,
	},
}
