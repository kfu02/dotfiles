-- init.lua - single-file Neovim config (Lazy.nvim + Mason + vsnip + nvim-cmp)
-- Neovim >= 0.11 expected

-- ====================================================================
-- Bootstrap lazy.nvim (plugin manager)
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Import old vim mappings if you have them (optional)
local mappings_vim = vim.fn.stdpath("config") .. "/mappings.vim"
if vim.loop.fs_stat(mappings_vim) then
  vim.cmd([[source ]] .. mappings_vim)
end

-- ====================================================================
-- Plugin setup via lazy.nvim
-- ====================================================================
require("lazy").setup({
  -- ufo (folding)
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      require("ufo").setup({})
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },

  -- vim-sleuth
  { "tpope/vim-sleuth" },

  -- markdown preview (browser). Only load on ft=markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    config = function()
      -- installer will be no-op if already installed
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- git conflict helper
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup({ default_mappings = false })
      local km = vim.keymap.set
      km("n", "<leader>co", "<Plug>(git-conflict-ours)")
      km("n", "<leader>ct", "<Plug>(git-conflict-theirs)")
      km("n", "<leader>cb", "<Plug>(git-conflict-both)")
      km("n", "<leader>c0", "<Plug>(git-conflict-none)")
      km("n", "<leader>ck", "<Plug>(git-conflict-prev-conflict)")
      km("n", "<leader>cj", "<Plug>(git-conflict-next-conflict)")
      km("n", "<leader>cl", "<cmd>GitConflictListQf<CR>")
    end,
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })
          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map({ "n" }, "<leader>gs", ":Gitsigns toggle_signs<CR>")
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function() gs.blame_line{ full = true } end)
          vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function() gs.diffthis("~") end)
          map("n", "<leader>td", gs.toggle_deleted)
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },

  -- open-browser
  { "tyru/open-browser.vim" },
  { "tyru/open-browser-github.vim", dependencies = { "tyru/open-browser.vim" } },

  -- tmux navigator
  { "christoomey/vim-tmux-navigator" },

  -- vinegar (simpler file browsing)
  { "tpope/vim-vinegar" },

  -- github theme
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_dark")
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "auto" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filename" },
          lualine_c = { "branch", "diff" },
          lualine_x = { "diagnostics" },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_y = { "filetype" },
        },
      })
    end,
  },

  -- mason + mason-lspconfig (install & manage LSP servers)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      -- servers we want installed via mason
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd" },
      })
    end,
  },

  -- nvim-cmp + vsnip completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- completion sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- snippet engine + adapter
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
    },
    config = function()
      -- keep vsnip treesitter disabled (prevents some early-time errors)
      vim.g.vsnip_enable_treesitter = 0

      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- cmdline for / and ?
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- cmdline for :
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },

  -- comment.nvim
  { "numToStr/Comment.nvim", config = true },

  -- telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },

  -- treesitter (load early)
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "python", "vim", "bash", "cpp", "json" },
      })
    end,
  },
})

-- ====================================================================
-- Post-bootstrap: Mason-installed servers -> configure via new LSP API
-- ====================================================================
-- Build LSP capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- List servers you want to enable (mason will install these if configured above)
local servers = { "lua_ls", "pyright", "clangd" }

-- Configure each server with the new Neovim 0.11 API
for _, srv in ipairs(servers) do
  -- some servers may want additional settings; this keeps default minimal
  vim.lsp.config(srv, {
    capabilities = capabilities,
  })
  -- enable makes LSP attachers active for this server
  vim.lsp.enable(srv)
end

-- ====================================================================
-- Final small things: modelines, provider checks, etc.
-- ====================================================================
-- recommended: wrap up with checkhealth hint (not auto-run)
-- print a subtle message to help debugging plugin loads (optional)
-- vim.notify("Neovim config loaded", vim.log.levels.INFO)

-- End of init.lua

