vim.keymap.set("n", "<leader>jq", function()
	vim.cmd("%!jq '.'")
	vim.cmd.write()
end, { desc = "Format [J]SON with J[Q]" })
