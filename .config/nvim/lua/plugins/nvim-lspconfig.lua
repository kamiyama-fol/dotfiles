return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "solargraph" },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        ["solargraph"] = function()
          require("lspconfig").solargraph.setup({
            cmd = { "bundle", "exec", "solargraph", "stdio" },
            settings = {
              solargraph = {
                diagnostics = true,
                completion = true,
                formatting = true,
              },
            },
            root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
          })
        end,
      },
    })

    vim.diagnostic.config({})
  end,
}
