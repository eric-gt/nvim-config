local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require("dap").configurations["rust"] = {
    {     
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
    }
    
}
