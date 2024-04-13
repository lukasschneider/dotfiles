local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {
    desc = '[P]roject [F]iles'
})

-- Live Grep with Telescope
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
    desc = '[F]ind with [G]rep'
})

-- Search Buffers with Telescope
vim.keymap.set('n', '<leader>fb', builtin.buffers, {
    desc = '[F]ind [B]uffers'
})

-- Search Help tags with Telescope
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
    desc = '[F]ind [H]elp Tags'
})

-- Search Git files with Telescope
vim.keymap.set('n', '<C-p>', builtin.git_files, {
    desc = 'Search Git Files'
})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {
    desc = 'Search with Grep but not Telescope'
})

vim.keymap.set('n', '<leader>fk', builtin.keymaps, {
    desc = '[F]ind [K]eymaps'
}
)
vim.keymap.set('n', '<leader>fs', builtin.builtin, {
    desc = '[F]ind [S]elect Telescope'
})

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
    desc = '[S]earch [D]iagnostics'
})

vim.keymap.set('n', '<leader>sr', builtin.resume, {
    desc = '[S]earch [R]esume'
})

vim.keymap.set('n', '<leader>s.', builtin.oldfiles, {
    desc = '[S]earch Recent Files ("." for repeat)'
})

vim.keymap.set('n', '<leader><leader>', builtin.buffers, {
    desc = '[ ] Find existing buffers'
})
