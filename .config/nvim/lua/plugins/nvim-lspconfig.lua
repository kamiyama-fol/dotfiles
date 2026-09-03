return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "solargraph", "gopls" },

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

    -- LSP がアタッチされたバッファでのみ有効なキーマップ
    -- （README.md「コードを読む・定義へジャンプ」と対応）
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
      callback = function(ev)
        local opts = function(desc)
          return { buffer = ev.buf, desc = desc }
        end
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("定義へジャンプ"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("宣言へジャンプ"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("実装へジャンプ"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("参照一覧"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("ホバーでドキュメント表示"))
        -- rename は Neovim 標準の grn、コードアクションは gra を使用
      end,
    })
  end,
}
