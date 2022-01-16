vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua, plugins.lua PackerCompile
  augroup end
]]

--
-- Packer status
--
local packer = require("packer")
packer.init {
    opt_default = false,
    display = {
        open_fn  = require("packer.util").float, 		-- An optional function to open a window for packer's display
        working_sym = '⟳', 					            -- The symbol for a plugin being installed/updated
        error_sym = '✗', 					            -- The symbol for a plugin with an error in installation/updating
        done_sym = '✓', 					            -- The symbol for a plugin which has completed installation/updating
        removed_sym = '-', 				                -- The symbol for an unused plugin which was removed
        moved_sym = '→', 					            -- The symbol for a plugin which was moved (e.g. from opt to start)
        header_sym = '━', 				                -- The symbol for the header line in packer's display
        show_all_info = true, 		                 	-- Should packer show all update details automatically?
        prompt_border = 'single',                  	    -- Border style of prompt popups.
        keybindings = { 					            -- Keybindings for the display window
          quit = 'q',
          toggle_info = '<CR>',
          diff = 'd',
          prompt_revert = 'r',
        }
    },
    config = {
	    default_url_format = 'https://hub.fastgit.org/%s'
    }
}

--
-- plugins install following from here
--
local use = packer.use
packer.reset()

packer.startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require'plugins.devicons' end,
    }

    -- Use specific branch, dependency and run lua file after load
    use {
      	'glepnir/galaxyline.nvim',
      	branch = 'main',
      	requires = { 'kyazdani42/nvim-web-devicons' },
      	config = function() require'plugins.statusline' end
    }

    use {
    	'kyazdani42/nvim-tree.lua',
    	requires = { 'kyazdani42/nvim-web-devicons' },
    	config = function() require'plugins.nvim-tree' end
    }

    -- ColorScheme
    use {
        'tanvirtin/monokai.nvim',
        config = function() require'monokai'.setup { palette = require'monokai'.pro } end
    }

    -- A collection of common configurations for Neovim's built-in language server client.
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }

    -- A completion engine plugins for neovim written in Lua.
    -- Completion sources are installed from external repositories and "sourced".
    use {
        'hrsh7th/nvim-cmp',
        requires = {
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'hrsh7th/cmp-nvim-lsp'},

                -- For vsnip users.
                -- {'hrsh7th/cmp-vsnip'},
                -- {'hrsh7th/vim-vsnip', config = function() require('plugins.vsnip') end },

                --  For luasnip users.
                {'L3MON4D3/LuaSnip'},
                {'saadparwaiz1/cmp_luasnip'},

                {'onsails/lspkind-nvim'},
                {
                    'f3fora/cmp-spell',
                    config = function()
                        vim.opt.spell = true
                        vim.opt.spelllang = 'en_us'
                    end
                }
        }
    }

    -- vim-signature is a plugins to place, toggle and display marks.
    use {
        'tpope/vim-surround',
        config = function()
            vim.g.surround_mappings_style = "surround"
        end
    }

    use 'dominikduda/vim_current_word'

    use {
        '907th/vim-auto-save', config = function() require("plugins.autosave") end
    }

    use { 'numToStr/FTerm.nvim', config = function() require'plugins.nvim-fterm' end }

    use { 'terryma/vim-expand-region' }

    use { 'voldikss/vim-translator', config = function() require'plugins.translator' end }

    use {"rafamadriz/friendly-snippets", requires = {{"hrsh7th/vim-vsnip"}}}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'plugins.treesitter' end
    }

    use 'jiangmiao/auto-pairs'

    -- a highly extendable fuzzy finder over lists
    use { 'nvim-lua/plenary.nvim', config = function() require'plenary.async' end }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
        config = function() require'plugins.telescope' end
    }

    -- A lua plugins for Neovim 0.5 to highlight and search
    -- for todo comments like TODO, HACK, BUG in your code base.
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -- Smart and Powerful commenting plugins for neovim
    use {
        'numToStr/Comment.nvim',
        config = function()
            require'plugins.comment'
        end
    }

	use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'master',
        config = function() require("plugins.blankline") end
    }

    -- Color highlighter
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()require'colorizer'.setup() end
    }

    -- A format runner for neovim.
    use {
        'mhartington/formatter.nvim',
        config = function() require('plugins.format') end
    }

    -- Markdown Preview for (Neo)vim
    use {
        'iamcco/markdown-preview.nvim',
        -- run = function() vim.fn['mkdp#util#install']() end,
        run=vim.fn["mkdp#util#install()"], as="markdownPreview",
        ft = {'markdown'},
        config = function() require("plugins.markdown") end
    }

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    -- use {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --         require("plugins.null-ls")
    --     end,
    --     requires = { "nvim-lua/plenary.nvim" },
    -- }

    use {
        'L3MON4D3/LuaSnip',
        config = function()
            -- require("luasnip.loaders.from_vscode").load()
            require("plugins.snippets")
        end
    }

    use {
        'neovim/nvim-lspconfig',
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
