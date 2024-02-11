local group = vim.api.nvim_create_augroup("vim_auto_run", { clear = true })
function Attach_To_Buffer (event, pattern, command)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = function(_, data)
                    if data then
                        print(data)
                    end
                end,
                on_stderr = function(_, data)
                    if data then
                        print(data)
                    end
                end
            })
        end
    })
end

vim.api.nvim_create_user_command("AutoRun", function()
    local event = vim.fn.input "Event: "
    local pattern = vim.fn.input "Pattern: "
    local command = vim.split(vim.fn.input "Command: ", " ")
    Attach_To_Buffer(event, pattern, command)
end, {})
