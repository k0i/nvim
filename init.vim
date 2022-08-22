set nocompatible 
set runtimepath +=/home/koyam/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#load_state('/home/koyam/.cache/nvim/dein')
call dein#begin('/home/koyam/.cache/nvim/dein') 
let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
let s:toml      = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/lazy.toml'
call dein#add('/home/koyam/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('nvim-treesitter/nvim-treesitter-textobjects')
call dein#add('nvim-treesitter/nvim-treesitter',{'merged' : 0})
call dein#load_toml(s:toml, {'lazy' : 0})
call dein#load_toml(s:lazy_toml, {'lazy' : 1})
call dein#end() 
filetype plugin indent on 
syntax enable
if dein#check_install()
   call dein#install()
endif
autocmd VimEnter * call dein#call_hook('post_source') " End dein Scripts-----------------------
" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select={
      enable = true,
      lookahead = true,
      keymaps = {
        ["fo"] = "@function.outer",
        ["fi"] = "@function.inner",
        ["co"] = "@class.outer",
        ["ci"] = "@class.inner",
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', 
        ['@function.outer'] = 'V', 
        ['@class.outer'] = '<c-v>', 
      },
    },
     swap = {
      enable = true,
      swap_next = {
        ["sw"] = "@parameter.inner",
      },
      swap_previous = {
        ["sW"] = "@parameter.inner",
      },
    },
     move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["ll"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["kk"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["hh"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["jj"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  }
}
EOF
let g:python3_host_prog = '/usr/bin/python3'
let g:moonlight_italic_comments = 1
let g:moonlight_italic_keywords = 1
let g:moonlight_italic_functions = 1
let g:moonlight_italic_variables = 1
let g:moonlight_contrast = 1
let g:moonlight_borders = 1
let g:moonlight_disable_background = 1
colorscheme moonlight
hi! Normal ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
hi! LineNr ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
set showmatch
set termguicolors
set matchtime=1
set matchpairs& matchpairs+=<:>
hi MatchParen cterm=bold ctermbg=201 ctermfg=0
set nobackup
set noswapfile
let mapleader=" "
nnoremap <SPACE> <Nop>
set noshowmode
autocmd BufWritePost  ~/.config/nvim/init.vim  so ~/.config/nvim/init.vim
set encoding=utf-8
scriptencoding utf-8
set backspace=indent,eol,start
nnoremap <C-Left>w <C-Left>wc 
nnoremap <silent><C-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>g <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>dt <cmd>lua require"dapui".toggle()<CR>
nnoremap <leader>ds <cmd>lua require"dapui".eval()<CR>
nnoremap <leader><leader>e <cmd>TroubleToggle<cr>
nnoremap <leader><leader>q <cmd>TroubleToggle quickfix<cr>
nnoremap <Leader>. <cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>
nnoremap <Leader>, <cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>
nnoremap <Leader>v <cmd>Telescope neoclip a<CR>
nnoremap <Leader>[ <cmd>bnext<CR>
nnoremap <Leader>] <cmd>bprev<CR>
nnoremap <Leader>tf <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <Leader>tn <cmd>lua require("neotest").run.run()<CR>
nnoremap <Leader><tab> <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap <silent><c-t> <Cmd>lua require('FTerm').toggle()<CR>
nnoremap <Leader><leader>p <cmd>lua require'telescope'.extensions.project.project{}<CR>
nnoremap <Leader><leader>z <cmd>Twilight<CR>
nnoremap gg gg0
nnoremap G G$
nnoremap q vegyy
nnoremap tn <cmd>$tabnew<CR>
nnoremap t] <cmd>tabn<CR>
nnoremap t[ <cmd>tabp<CR>
nnoremap td <cmd>tabclose<CR>
nnoremap <CR> G
nnoremap <leader>r <cmd>lua require('spectre').open_visual({select_word=true})<CR>
nnoremap <leader>ra <cmd>lua require('spectre.actions').run_replace()<CR>
nnoremap <leader>rc <cmd>lua require('spectre.actions').run_current_replace()<CR>

:nmap <c-s> :w<CR>
inoremap <Esc> <Esc>lh
:tnoremap <Esc> <C-\><C-n>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
command! -nargs=* Tv split | wincmd L | terminal <args>
autocmd TermOpen * startinsert
set clipboard+=unnamedplus
let g:rustfmt_autosave = 1
filetype plugin indent on
highlight Blamer guifg=#90EE90 guibg=none
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
let g:blamer_enabled = 1
let g:blamer_delay =400
set completeopt=menuone,noinsert,noselect
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
nmap s <Plug>(easymotion-s)
map  w <Plug>(easymotion-w)
map  b <Plug>(easymotion-b)
map  e <Plug>(easymotion-lineforward)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='1234567890asdfqwegzxc'
"dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <F9> :lua require'dap'.toggle_breakpoint()<CR>

"goto-preview
nnoremap <leader>pr <cmd>lua require('goto-preview').goto_preview_references()<CR>
nnoremap <leader>ps <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <leader>pc <cmd>lua require('goto-preview').close_all_win()<CR>
"symbols-outline
nnoremap <leader>a :SymbolsOutline<CR>
"nvim-tree
nnoremap <leader>z :NvimTreeFindFileToggle <CR>
"lazygit
nnoremap lgt :LazyGit <CR>
let g:lazygit_floating_window_winblend = 0
let g:lazygit_floating_window_use_plenary = 0
"resize
let g:winresizer_start_key = '<leader>1'

lua require('lualine').setup()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})
augroup END

lua <<EOF
  function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {
  only = { "source.organizeImports" }}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end
EOF

let g:line_number_interval_enable_at_startup = 1
let g:line_number_interval = 10
highlight HighlightedLineNr guifg=#00FFFF ctermfg=201
highlight DimLineNr guifg=#CCCCFF ctermfg=5
let g:line_number_interval#use_custom = 1
let g:line_number_interval#custom_interval = [1,2,3,4,5,11,21,31,41,51,61,71]
highlight HighlightedLineNr1 guifg=#17ffcf ctermfg=15
highlight HighlightedLineNr2 guifg=#9ACD32 ctermfg=2
highlight HighlightedLineNr3 guifg=#FF7276 ctermfg=6
highlight HighlightedLineNr4 guifg=#FFD580 ctermfg=4
highlight HighlightedLineNr5 guifg=#F50B94 ctermfg=5

" VSnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ?  '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

autocmd BufWritePre *.go lua OrgImports(1000)
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#144e52 ctermbg=22
set mouse+=a
set number
set autoindent
set expandtab
set hls

let g:cursorhold_updatetime = 100

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop']
\}

let g:ale_linters_explicit = 1

" Lint Ruby files with binstub
let g:ale_ruby_rubocop_executable = '/usr/local/bin/rubocop'

" Let's leave a column for the signs so that the left side of the window doesn't move
let g:ale_sign_column_always = 1
:set guicursor=a:blinkon100
