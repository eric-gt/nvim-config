-- [[ Globally Accessible Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- open file tree
set("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "open file tree" })

-- Diagnostic keymaps
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- update Lazy packages
set("n", "<leader>LU", "<cmd>Lazy update<CR>", { desc = "Check and [U]pdate packages managed by [L]azy" })

--  paste and persist in buffer, aka ThePrimeagen's "greatest remap ever"
set("x", "<leader>p", [["_dP]], { desc = "[P]aste and preserve buffer" })

-- yank to OS clipboard, aka next greatest remap ever, from asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank line into OS clipboard" })
set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to end of line into OS clipboard" })

set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete to null buffer" })
-- goto last buffer
set("n", "<leader>lb", "<cmd>b#<CR>", { desc = "goto [L]ast [B]uffer" })

-- run the last executed Command Mode command. Very useful if you don't want your :s regexes to get out of hand
set("n", "<leader>lc", "@:", { desc = "execute [L]ast [C]ommand" })

-- move and re-format in Visual
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted line up one line and reformat" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted line down one line and reformat" })

-- don't move cursor after appending bottom line
set("n", "J", "mzJ`z", { desc = "[J]ump line below up to current line and preserve cursor position" })

-- page up/down and center on cursor
set("n", "<C-u>", "<C-u>zz", { desc = "Page [u]p and center" })
set("n", "<C-d>", "<C-d>zz", { desc = "Page [d]own and center" })

-- center on cursor when iterating through search results
set("n", "n", "nzzzv", { desc = "move forward to [n]ext result and center" })
set("n", "N", "Nzzzv", { desc = "move backwards to [N]ext result and center" })

-- start a find/replace on the word under the cursor
set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "[s]ubstitute current word under cursor" }
)
-- add executable permissions to current buffer
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "make current file e[X]ecutable" })
-- source the current file
set("n", "<leader>rc", "<cmd>source %<CR>", { desc = "[R]eload [C]urrent file" })
