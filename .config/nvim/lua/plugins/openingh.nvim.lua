return{
  "almo7aya/openingh.nvim",
  keys = {
    { "<Leader>gr", ":OpenInGHRepo<CR>", mode = "n", { silent = true, noremap = true }, desc = "GitHubリポジトリを開く" },
    { "<Leader>gf", ":OpenInGHFile<CR>", mode = "n", { silent = true, noremap = true }, desc = "GitHubでファイルを開く" },
    { "<Leader>gf", ":OpenInGHFileLines<CR>", mode = "v", { silent = true, noremap = true }, desc = "GitHubで選択行を開く" },
  }

}
