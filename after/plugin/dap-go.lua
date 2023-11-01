local dapGo = require('dap-go')
dapGo.setup()

vim.keymap.set("n", "<leader>dgt", function() dapGo.debug_test() end)
