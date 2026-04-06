return {
    "tpope/vim-fugitive",

    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
            desc = 'Fugitive: Open git with fugitive'
        })
    end
}
