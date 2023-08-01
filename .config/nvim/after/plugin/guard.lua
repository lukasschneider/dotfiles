local ft = require('guard.filetype')

-- use clang-format and clang-tidy for c files
ft('c'):fmt('clang-format')

-- use stylua to format lua files and no linter
ft('lua'):fmt('stylua')

-- use lsp to format first then use golines to format
ft('go'):fmt('lsp')
        :append('golines')

-- call setup LAST
require('guard').setup({
    -- the only option for the setup function
    fmt_on_save = true,
})