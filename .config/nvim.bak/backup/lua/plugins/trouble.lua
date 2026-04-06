return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
        }

        vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end, 
            {
                desc = "Trouble: [T]oggle [T]rouble"
            }
        )

        vim.keymap.set("n", "<leader>tn", function()
                require("trouble").next({
                skip_groups = true,
                jump = true
            });
            end, 
            {
                desc = "Trouble: [T]oggle [N]ext"
            }
        )

        vim.keymap.set("n", "<leader>tp", function()
                require("trouble").next({
                skip_groups = true,
                jump = true
            });
            end, 
            {
                desc = "Trouble: [T]oggle [P]revious"
            }
        )


        end
}
