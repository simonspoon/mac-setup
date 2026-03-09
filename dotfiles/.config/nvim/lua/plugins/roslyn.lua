return {
  -- 1. Add the custom Mason registry to get access to the Roslyn server
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = opts.registries or { "github:mason-org/mason-registry" }
      table.insert(opts.registries, "github:Crashdummyy/mason-registry")
    end,
  },

  -- 2. Setup the Roslyn plugin
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- You can add custom roslyn configuration here
      -- See: https://github.com/seblyng/roslyn.nvim#configuration
      config = {
        -- Optional: Add your custom on_attach or capabilities here
        -- on_attach = function(client, bufnr) ... end,
      },
    },
  },

  -- 3. Disable OmniSharp in lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
      },
    },
  },
}
