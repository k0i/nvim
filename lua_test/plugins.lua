vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
   --use  { '4513ECHO/vim-colors-hatsunemiku'}
   use { 'wbthomason/packer.nvim', opt = true }
   use { 'easymotion/vim-easymotion' }
   use { 'rust-lang/rust.vim', ft = { 'rust' } }
   use { 'nvim-lua/completion-nvim' }
   use { 'neovim/nvim-lspconfig' }
   use { 'github/copilot.vim' }
   use { 'airblade/vim-gitgutter' }
   use { 'APZelos/blamer.nvim' }
   use { 'wakatime/vim-wakatime' }
   use { 'bluz71/vim-moonfly-colors', opt = true }
   use { 'hrsh7th/vim-vsnip' }
   use { 'hrsh7th/vim-vsnip-integ' }
   use { 'ryanoasis/vim-devicons' }
   use { 'simeji/winresizer' }
   use { 'nvim-lua/plenary.nvim' }
   use { 'kyazdani42/nvim-web-devicons' }
   use { "kdheepak/lazygit.nvim" }
   use { 'folke/trouble.nvim', config = function() require('trouble').setup({
         position = 'top',
         height = 20,
      })
   end }
   use { 'j-hui/fidget.nvim', config = function() require "fidget".setup {}
   end
   }

   use { 'rcarriga/nvim-dap-ui', requires = {
      { 'mfussenegger/nvim-dap', config = function()
         vim.fn.sign_define('DapBreakpoint', { text = '🤔', texthl = '', linehl = '', numhl = '' })
         vim.fn.sign_define('DapStopped', { text = '✔️', texthl = '', linehl = '', numhl = '' })
      end }
   },
   config = require("nvim-dap-ui") }
   use { 'vim-test/vim-test' }
   use { 'folke/lsp-colors.nvim', config = function()
      require('lsp-colors').setup({
         Error = '#db4b4b',
         Warning = '#e0af68',
         Information = '#0db9d7',
         Hint = '#10B981'
      })
   end
   }
   use { 'cespare/vim-toml', ft = 'toml' }
   use {
      'm-demare/hlargs.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function() require('hlargs').setup {} end
   }
   use { 'mvllow/modes.nvim', config = require("modes")
   }
   use { 'edluffy/specs.nvim', config = require("specs") }
   use { 'rmagatti/goto-preview', config = function()
      require('goto-preview').setup {}
   end }
   use { "lukas-reineke/indent-blankline.nvim", config = require('indent-blankline') }
   use {
      "karb94/neoscroll.nvim", config = function()
         require('neoscroll').setup {}
      end }
   use { "akinsho/toggleterm.nvim", config = function()
      require('toggleterm').setup {
         size = 30
      }
   end }
   use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } }, config = function()
      require('telescope').setup()
   end
   }
   use { "SmiteshP/nvim-gps", requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
         require('nvim-gps').setup {}
      end
   }
   use { 'theHamsta/nvim-dap-virtual-text',
      requires = { { 'nvim-treesitter/nvim-treesitter' }, { 'mfussenegger/nvim-dap', config = function()
         vim.fn.sign_define('DapBreakpoint', { text = '🤔', texthl = '', linehl = '', numhl = '' })
         vim.fn.sign_define('DapStopped', { text = '✔️', texthl = '', linehl = '', numhl = '' })
      end } }, config = function()
         require("nvim-dap-virtual-text").setup()
      end
   }
   use {
      "rcarriga/nvim-notify", config = require("nvim-notify")
   }
   use { "nvim-lualine/lualine.nvim",
      requires = { "SmiteshP/nvim-gps" },
      config = require("lualine")
   }

end
)
