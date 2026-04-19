return {
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    -- branch = "develop"
    -- (optional) updates the plugin's dependencies on each update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@module "gopher"
    ---@type gopher.Config
    opts = {},
  },
  {
    'maxandron/goplements.nvim',
    ft = 'go',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- The prefixes prepended to the type names
      prefix = {
        interface = 'implemented by: ',
        struct = 'implements: ',
      },
      -- Whether to display the package name along with the type name (i.e., builtins.error vs error)
      display_package = true,
      -- The namespace to use for the extmarks (no real reason to change this except for testing)
      namespace_name = 'goplements',
      -- The highlight group to use (if you want to change the default colors)
      -- The default links to DiagnosticHint
      highlight = 'Goplements', -- refer to the configuration section below
    },
  },
  {
    'fredrikaverpil/godoc.nvim',
    version = '*',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }, -- optional
      { 'folke/snacks.nvim' }, -- optional
      { 'echasnovski/mini.pick' }, -- optional
      { 'ibhagwan/fzf-lua' }, -- optional
      {
        'nvim-treesitter/nvim-treesitter',
        opts = { ensure_installed = { 'go', 'gomod', 'gowork', 'gosum' } },
        config = function(_, opts)
          -- Register godoc parser BEFORE nvim-treesitter loads
          require('nvim-treesitter.parsers').godoc = {
            install_info = {
              url = 'https://github.com/fredrikaverpil/tree-sitter-godoc',
              files = { 'src/parser.c' },
              branch = 'main',
            },
            filetype = 'godoc',
          }

          -- Map godoc filetype to use godoc parser
          vim.treesitter.language.register('godoc', 'godoc')

          -- Apply nvim-treesitter opts
          require('nvim-treesitter.configs').setup(opts)
        end,
      },
    },
    build = 'go install github.com/lotusirous/gostdsym/stdsym@latest', -- optional
    cmd = { 'GoDoc' }, -- optional
    ft = 'godoc', -- optional
    init = function()
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = '*.godoc',
        callback = function()
          vim.bo.filetype = 'godoc'
        end,
      })
    end,
    config = function(_, opts)
      require('godoc').setup(opts)
    end,

    opts = {
      adapters = {
        {
          name = 'go',
          opts = {
            get_syntax_info = function()
              return {
                filetype = 'godoc',
                language = 'godoc', -- Enable tree-sitter godoc parser
              }
            end,
          },
        },
      },
    }, -- see further down below for configuration
  },
}
