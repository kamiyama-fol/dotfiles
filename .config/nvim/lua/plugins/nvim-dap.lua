return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "williamboman/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "delve" },
    })
    require("dap-go").setup()
  end,
}