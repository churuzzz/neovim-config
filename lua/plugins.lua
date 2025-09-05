local ensure_packer = function()
      local fn = vim.fn
      local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
      if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
            vim.cmd [[packadd packer.nvim]]
            return true
      end
      return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
      -- GLOBAL DEPS
      use "wbthomason/packer.nvim"
      use "nvim-lua/plenary.nvim"
      use "nvim-tree/nvim-web-devicons"

      -- COLORSCHEME: VAGUE THEME
      use ({
            'vague2k/vague.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                  -- NOTE: you do not need to call setup if you don't want to.
                  require("vague").setup({
                        transparent = true,
                  })
                  vim.cmd("colorscheme vague")
            end
      })

      --- ENVIRONMENT COMPONENTS
      ---
      -- STATUSLINE: LUALINE
      use({
            "nvim-lualine/lualine.nvim",
            event = "BufEnter",
            config = function()
                  require("configs.lualine")
            end,
            requires = { "nvim-web-devicons" },
      })

      -- FINDER: TELESCOPE
      use({
	      "nvim-telescope/telescope.nvim",
	      tag = "0.1.1",
	      requires = {
		      { "nvim-lua/plenary.nvim" }
	      }
      })

      -- FILETREE: NEOTREE
      use ({
            "nvim-neo-tree/neo-tree.nvim",
	    branch = "v2.x",
            requires = {
                  'MunifTanjim/nui.nvim',
                  'nvim-lua/plenary.nvim',
                  'nvim-tree/nvim-web-devicons'
            },
      })
      require('neo-tree').setup()



      --- ENVIRONMENT UTILS
      ---
      -- TREESITTER
      use({
            "nvim-treesitter/nvim-treesitter",
            run = function()
                  require("nvim-treesitter.install").update({ with_sync = true })
            end,
            config = function()
                  require("configs.treesitter")
            end,
      })
      use({
            "windwp/nvim-ts-autotag",
            after = "nvim-treesitter"
      })

      -- GITSIGNS
      use({
	      "lewis6991/gitsigns.nvim",
	      config = function()
		      require("configs.gitsigns")
	      end,
      })

      -- MD PREVIEW
      use({
	      "iamcco/markdown-preview.nvim",
	      run = function()
		      vim.fn["mkdp#util#install"]()
	      end,
      })

      use({
	      "windwp/nvim-autopairs",
	      config = function()
		      require("configs.autopairs")
	      end,
      })


      -- LSP SETUP: LAZY LSP NVIM
      -- Ensure NIX PM is installed
      use({
            "dundalek/lazy-lsp.nvim",
            requires = {
                  "neovim/nvim-lspconfig",
                  {
                        "VonHeikemen/lsp-zero.nvim",
                        branch = "v3.x"
                  },
                  "hrsh7th/cmp-nvim-lsp",
                  "hrsh7th/nvim-cmp",
            },
            config = function()
                  local lsp_zero = require("lsp-zero")
                  
                  lsp_zero.on_attach(function(client, bufnr)
                        lsp_zero.default_keymaps({
                              buffer = bufnr,
                              preserve_mappings = false
                        })
                  end)
                  require("lazy-lsp").setup {}
            end,
      })

      --- PACKER REINSTALLER
      if packer_bootstrap then
            require('packer').sync()
    end
end)
