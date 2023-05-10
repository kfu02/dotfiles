-- install lazy.nvim if not already installed
--
-- lazy.nvim - plugin manager with lockfile (to keep plugin versions
-- consistent), auto-calls to "require(...)", & extra configuration at install
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Import all old vim mappings
vim.cmd([[source ~/.config/nvim/mappings.vim]])

-- toggle LSP diagnostics (warning msgs)
-- (default off)
vim.diagnostic.disable()
local showDiagnostics = false

-- Function to toggle diagnostic messages
function toggleDiagnostics()
    if showDiagnostics then
        vim.diagnostic.disable()
    else
        vim.diagnostic.enable()
    end
    showDiagnostics = not showDiagnostics
end

-- Create a keybind to toggle diagnostic messages
vim.api.nvim_set_keymap('n', '<Leader>d', '<Cmd>lua toggleDiagnostics()<CR>', { noremap = true, silent = true })

-- Install and configure plugins with lazy.nvim
require("lazy").setup({
    -- vim-sleuth - tpope plugin to auto-indent based on context
    -- https://github.com/tpope/vim-sleuth
    {'tpope/vim-sleuth'},

    -- markdown-preview.nvim - render markdown in browser directly from nvim
    -- https://github.com/iamcco/markdown-preview.nvim
    {'iamcco/markdown-preview.nvim', 
        config = function() 
            vim.fn["mkdp#util#install"]()
        end,
        -- config = "cd app && yarn install",
        -- TODO: this install don't work
    },

    -- git-conflict.nvim - highlight git conflicts and help remove them
    -- https://github.com/akinsho/git-conflict.nvim
    {'akinsho/git-conflict.nvim',
        config = function()
            require('git-conflict').setup {
                default_mappings = false
            }

            -- make these keymaps global + use leader
            vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)')
            vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)')
            vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)')
            vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)')
            vim.keymap.set('n', '<leader>ck', '<Plug>(git-conflict-prev-conflict)')
            vim.keymap.set('n', '<leader>cj', '<Plug>(git-conflict-next-conflict)')
            vim.keymap.set('n', '<leader>cl', '<cmd>GitConflictListQf<CR>')
        end,
    },

    -- gitsigns.nvim - show changes since last commit
    -- https://github.com/lewis6991/gitsigns.nvim
    {'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{
              on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                  opts = opts or {}
                  opts.buffer = bufnr
                  vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                  if vim.wo.diff then return ']c' end
                  vim.schedule(function() gs.next_hunk() end)
                  return '<Ignore>'
                end, {expr=true})

                map('n', '[c', function()
                  if vim.wo.diff then return '[c' end
                  vim.schedule(function() gs.prev_hunk() end)
                  return '<Ignore>'
                end, {expr=true})

                -- Actions
                map({'n'}, '<leader>gs', ':Gitsigns toggle_signs<CR>') -- toggle signs on ,gs
                map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                map('n', '<leader>hS', gs.stage_buffer)
                map('n', '<leader>hu', gs.undo_stage_hunk)
                map('n', '<leader>hR', gs.reset_buffer)
                map('n', '<leader>hp', gs.preview_hunk)
                map('n', '<leader>hb', function() gs.blame_line{full=true} end)
                map('n', '<leader>tb', gs.toggle_current_line_blame)
                map('n', '<leader>hd', gs.diffthis)
                map('n', '<leader>hD', function() gs.diffthis('~') end)
                map('n', '<leader>td', gs.toggle_deleted)

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
              end
            }
        end,
    },

    -- open-browser.vim - open links in buffers in browser
    -- gx (while over a link) - open link with xdg-open/open
    -- https://github.com/tyru/open-browser.vim
    {'tyru/open-browser.vim',
    },
    -- open-browser-github.vim - open things in browser GitHub
    -- ,gh - open current spot in file in browser GitHub
    -- https://github.com/tyru/open-browser-github.vim
    {'tyru/open-browser-github.vim',
        dependencies = {"tyru/open-browser.vim"},
    },

    -- filetype.nvim - make filetype detection faster, allow extension changes 
    -- https://github.com/nathom/filetype.nvim
    {'nathom/filetype.nvim',
        config = function()
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
        end,
    },
        
    -- vim-tmux-navigator - switch between vim panes and tmux tabs seamlessly
    -- https://github.com/christoomey/vim-tmux-navigator
    {"christoomey/vim-tmux-navigator", 
    },

    -- oil.nvim - better file tree navigation (improved tpope's vinegar.vim)
    -- https://github.com/stevearc/oil.nvim
    {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.opt.conceallevel = 0
        require("oil").setup()
        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
    },
    
    -- github-nvim-theme - clone of GitHub's colors
    -- https://github.com/projekt0n/github-nvim-theme
    {
        "projekt0n/github-nvim-theme",
         config = function()
            -- apply colorscheme
            require('github-theme').setup()
            vim.cmd('colorscheme github_dark')
         end,

    },

    -- Lualine - pretty status line w/ icons, colors, themes
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
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
        end,
    },

    -- mason.nvim - handle LSP servers for nvim-cmp
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
    'williamboman/mason-lspconfig.nvim',
        dependencies = {'williamboman/mason.nvim'},
        config = function()
            require("mason").setup()
            -- TODO: sync with Treesitter's ensure_installed list
            require("mason-lspconfig").setup {
                -- TODO: sync with nvim-cmp's list below
                ensure_installed = { "lua_ls", "pyright" },
            }
        end,
    },

    -- nvim-cmp - autocompletion with LSP
    -- https://github.com/hrsh7th/nvim-cmp/
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- link with LSP
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            -- complete w/ buffer/path/cmdline
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- autocomplete snippets
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            "rafamadriz/friendly-snippets",
            -- install LSP easily
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            local cmp = require'cmp'

            cmp.setup({
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },

            completion = {
                autocomplete = false,
            },

            mapping = cmp.mapping.preset.insert({
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                
                -- supertab-like completion
                -- to create Supertab-like mapping for completion
                -- (only show auto-completion on <Tab>, scroll options with <Tab>/<S-Tab>)
                -- (sometimes snippets don't work, hence confirm mapping above)
                ["<Tab>"] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_next_item()
                      elseif vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                      elseif has_words_before() then
                        cmp.complete()
                      else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                      end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function()
                      if cmp.visible() then
                        cmp.select_prev_item()
                      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                      end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' }, -- For vsnip users.
            }, {
              { name = 'buffer' },
            })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
              { name = 'buffer' },
            })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['lua_ls'].setup {
                capabilities = capabilities
            }
            require('lspconfig')['pyright'].setup {
                capabilities = capabilities
            }
            
        end,
    }, -- end nvim-cmp setup
    
    -- Comment.nvim - gc<motion> to comment things (Lua fork of tpope's commentary.vim)
    -- https://github.com/numToStr/Comment.nvim
    {'numToStr/Comment.nvim',
        config = true
    },

    -- Telescope - fuzzy-find everything (files, buffers, text)
    -- https://github.com/nvim-telescope/telescope.nvim
    -- **requires external dependency: ripgrep**
    {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
    },

    -- Treesitter - general-purpose language parser. Used for syntax
    -- highlighting, comments, etc. by a variety of other plugins.
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {"nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
              -- keep these installed
              -- :TSInstallInfo to check
              ensure_installed = { "cpp", "python", "c", "lua", "vim" },

              -- more syntax highlights
              highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = false,
              },

              -- indent better based on syntax
              -- **disabled for not being very good**
              -- indent = {
              --   enable = true
              -- },
            }
        end,
    },
})
