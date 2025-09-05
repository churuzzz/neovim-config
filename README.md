# neovim config

This is my neovim config, eternally to be a work in progress. Feel free to fork it as a starting point for yours. Set up with nvim-packer, but as long as you know how to read the docs on other PMs you should be able to set it up similarly.

#### Credits
[dev.to article by Alejandro Londono](https://dev.to/slydragonn/how-to-set-up-neovim-for-windows-and-linux-with-lua-and-packer-2391) that was used as the base for the config. It was outdated at this point so I had to tweak and removed certain plugins I didn't need. I used a lot of his configs and they helped me get a better idea of how to set up configs in a more modular system.

# Dependencies
- [packer](https://github.com/wbthomason/packer.nvim) (plugin manager) Easy syntax. First one I learned, I'm just going to stick with it. Hasn't failed me.
- [plenary](https://github.com/nvim-lua/plenary.nvim) (general dep)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) (icons) Used for certain customizations.

# Plugins
- [vague](https://github.com/vague2k/vague.nvim) (colorscheme) a nice purple-ish softer colorscheme that works better for my eyes. It also has transparancy built in.
- [telescope](https://github.com/nvim-telescope/telescope.nvim) (fuzzy finder) Sticking with it because it's supported and consistent and customizable. Until further notice.
- [lualine](https://github.com/nvim-lualine/lualine.nvim) (status bar) Customizable, though I haven't changed it much for my use.
- [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) (directory finder) It's the first one I ever used, I'm going to stick with it because it's simple.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (better treesitter)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) (git support)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) (md previewing) Runs a local server that previews the MD on the browser. Great pick.
- [autopairs](https://github.com/windwp/nvim-autopairs) (better autopair)

## Language Server Configurations (LSPs)
I've set up the LSP support using the [lazy-lsp](https://github.com/dundalek/lazy-lsp.nvim) package created by dundalek. Handles automatic install of LSPs 
