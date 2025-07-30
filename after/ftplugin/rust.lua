local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, { desc = "[C]ode [A]ctions", silent = true, buffer = bufnr })

vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { desc = "Hover Text", silent = true, buffer = bufnr })
