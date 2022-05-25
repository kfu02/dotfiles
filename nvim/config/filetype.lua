-- see docs for more options
-- https://github.com/nathom/filetype.nvim#customization
require("filetype").setup({
    overrides = {
        extensions = {
            -- set filetype of .launch to .xml
            launch = "xml",
        },

        shebang = {
            -- Set the filetype of files with a dash shebang to sh
            dash = "sh",
        },
    },
})
