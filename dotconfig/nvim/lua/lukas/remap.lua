-- Leader/Prefix to Spacebar
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Go back to Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
    desc = 'Set: Back to Netrw'
})

-- Move a whole line up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
    desc = 'Set: Move a line up'
})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
    desc = 'Set: Move a line down'
})

-- Move half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = 'Set: Move half a page down'
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = 'Set: Move half a page up'
})

-- Move search up and down
vim.keymap.set("n", "n", "nzzzv", {
    desc = 'Set: Move Search down'
})
vim.keymap.set("n", "N", "Nzzzv", {
    desc = 'Set. Move Search up'
})

-- Remap Ecs to Ctrl-C
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww ~/.local/bin/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Refactor Keymap
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
    desc = 'Set: Refactor the hover'
})

-- Make file exectuable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
    silent = true,
    desc = 'Set: Make the current File exectuable'
})

-- Yank in normal mode also with leader
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Format the file with gg=G like InteliJ
vim.keymap.set("n", "<C-M-l>", function()
    local cur_pos = vim.fn.getcurpos()

    vim.cmd("normal! gg=G")

    vim.fn.setpos(".", cur_pos)
end, { desc = 'Set: Format like InteliJ' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {
    desc = 'Move focus to the left window'
})

vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {
    desc = 'Move focus to the right window'
})

vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {
    desc = 'Move focus to the lower window'
})

vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {
    desc = 'Move focus to the upper window'
})
