require("dap-go").setup()
vim.keymap.set("n", "<leader>dgt", function()
	require("dap.ext.vscode").load_launchjs()
	require("dap").debug_test()
end)
