vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
})
