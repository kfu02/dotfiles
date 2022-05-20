-- consistent syntax highlights
-- doesn't work
-- https://vi.stackexchange.com/questions/34496/syntax-highlighting-is-incomplete-on-neovim-fixed-by-calling-telescope
-- https://github.com/nvim-treesitter/nvim-treesitter#highlight
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
