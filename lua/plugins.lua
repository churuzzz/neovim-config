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
      use 'wbthomason/packer.nvim'
      -- My plugins here
      -- use 'foo1/bar1.nvim'
      -- use 'foo2/bar2.nvim'

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
            require('packer').sync()
      end
      
      -- lualine
      use {
            "nvim-lualine/lualine.nvim",
            requires = { 'nvim-tree/nvim-web-devicons' },
      }
      require('lualine').setup()

      -- neotree
      use {
            "nvim-neo-tree/neo-tree.nvim",
            requires = {
                  'MunifTanjim/nui.nvim',
                  'nvim-lua/plenary.nvim',
                  'nvim-tree/nvim-web-devicons'
            },
      }
      require('neo-tree').setup()

      -- treesitter
      use {
            'nvim-treesitter/nvim-treesitter',
            run = 'TSUpdate',
      }
      require'nvim-treesitter.configs'.setup({
            ensure_installed = { "lua", "markdown", "typescript", "javascript", "c", "cpp", "css", "html", "python", "java" },
            sync_install = true,
            auto_install = true,
            highlight = {
                  enable = true,
                  additional_vim_regex_highlighting = false,
            }
      })

      -- vague theme
      use {
            "vague2k/vague.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                  vim.cmd("colorscheme vague")
            end
      }
end)
