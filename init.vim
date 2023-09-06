set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
	" Plugin Section
	Plug 'morhetz/gruvbox' " Gruvbox Themes
	Plug 'ryanoasis/vim-devicons' " Developer Icons
	Plug 'honza/vim-snippets' "Snippets aux
	Plug 'preservim/nerdtree' " NerdTree
	Plug 'preservim/nerdcommenter' " Commenting Operations
	Plug 'tpope/vim-surround' " Surrounding ysw
	Plug 'vim-airline/vim-airline' " Status bar
	Plug 'neovim/nvim-lspconfig' " Language Server Protocol
	Plug 'hrsh7th/cmp-nvim-lsp' " Code Completion aux for LSP
	Plug 'hrsh7th/cmp-buffer' " Code Completion aux
	Plug 'hrsh7th/cmp-path' " Code Completion aux
	Plug 'hrsh7th/cmp-cmdline' " Code Completion aux
	Plug 'hrsh7th/nvim-cmp' " Code Completion
	Plug 'SirVer/ultisnips' "Snippets solutions in Vim
	Plug 'quangnguyen30192/cmp-nvim-ultisnips' "Snippets integration with nvim-cmp
	Plug 'preservim/tagbar' " Tagbar for code navigation
	Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
call plug#end()

:colorscheme gruvbox

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
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

  local lspconfig = require('lspconfig')

  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end

EOF
