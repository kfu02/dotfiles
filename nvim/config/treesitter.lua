require'nvim-treesitter.configs'.setup {
  -- keep these installed
  -- :TSInstallInfo to check
  ensure_installed = { "cpp", "python", "c", "lua", "vim" },

  -- more syntax highlights (I think this is too much color)
  highlight = {
    enable = false,
    -- additional_vim_regex_highlighting = false,
  },

  -- indent better based on syntax
  indent = {
    enable = true
  },
}
