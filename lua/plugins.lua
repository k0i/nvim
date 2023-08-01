return {
  { 
    'shaunsingh/moonlight.nvim',
    config = function()
      vim.cmd([[colorscheme moonlight]])
      vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
      vim.cmd([[highlight NonText ctermbg=NONE guibg=NONE]])
      vim.cmd([[highlight LineNr ctermbg=NONE guibg=NONE]])
      vim.cmd([[highlight Folded ctermbg=NONE guibg=NONE]])
      vim.cmd([[highlight EndOfBuffer ctermbg=NONE guibg=NONE]])
      vim.g.moonlight_italic_comments = true
      vim.g.moonlight_italic_keywords = true
      vim.g.moonlight_italic_functions = true
      vim.g.moonlight_italic_variables = false
      vim.g.moonlight_contrast = true
      vim.g.moonlight_borders = false 
      vim.g.moonlight_disable_background = false
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FFFF00' })
      vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })
      vim.cmd[[highlight CursorLine guibg=#144e52 ctermbg=22]]
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons','SmiteshP/nvim-navic'},
    config = function()
      require('config/lualine')
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
         require('config/trouble')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config/gitsigns')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('config/nvim-tree')
    end
  },
  'github/copilot.vim',
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('config/navic')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config/treesitter')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
   'nvim-telescope/telescope.nvim', tag = '0.1.2',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
       require('config/telescope')
     end
   },
   {
     'karb94/neoscroll.nvim',
     config = function()
       require('neoscroll').setup()
     end
   },
{
  'numToStr/FTerm.nvim',
   config = function()
    require('config/fterm')
  end
},
{
  "kdheepak/lazygit.nvim",
  'wakatime/vim-wakatime',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', 'lgt', '<CMD>LazyGit<CR>')
    vim.g['lazygit_floating_window_winblend']=0
    vim.g['lazygit_floating_window_use_plenary']=0
  end
},
{
"hrsh7th/nvim-cmp",
	dependencies = {
    'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ'
	},
  config = function()
    require('config/cmp')
  end
},
{
'phaazon/hop.nvim',
config = function()
  require('config/hop')
end
},
{
'neovim/nvim-lspconfig',
config = function()
  require('config/lsp')
end
}
}
