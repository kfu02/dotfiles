-- Config: Lualine (fancy statusline)
require('lualine').setup {
  options = {
    theme = 'auto', -- set theme to match colorscheme (or make a sensible default)
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff'},
    lualine_x = {'diagnostics'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'filename'}, -- filename is bolded now to make splits more obvious
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype'},
    lualine_z = {}
  },
}
