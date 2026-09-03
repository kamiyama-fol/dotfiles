-- grep したファイル群の文字列をまとめて置換するためのプラグイン
-- ripgrep でプロジェクト全体を検索し、バッファ上で結果を編集 → <leader>rr で一括置換
return {
  'MagicDuck/grug-far.nvim',
  cmd = { 'GrugFar', 'GrugFarWithin' },
  keys = {
    {
      '<leader>rr',
      function() require('grug-far').open() end,
      mode = { 'n' },
      desc = 'Grep & Replace（プロジェクト全体）',
    },
    {
      '<leader>rw',
      function() require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } }) end,
      mode = { 'n' },
      desc = 'Grep & Replace（カーソル下の単語）',
    },
    {
      '<leader>rf',
      function() require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } }) end,
      mode = { 'n' },
      desc = 'Grep & Replace（現在のファイル）',
    },
    {
      '<leader>rr',
      function()
        require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })
      end,
      mode = { 'x' },
      desc = 'Grep & Replace（選択範囲の文字列）',
    },
  },
  opts = {
    -- 検索欄などを日本語で表示
    headerMaxWidth = 80,
    keymaps = {
      replace = { n = '<leader>rp' },       -- 置換を実行
      qflist = { n = '<leader>rq' },        -- 結果を quickfix へ
      syncLocations = { n = '<leader>rs' }, -- バッファの編集をファイルへ反映
      syncLine = { n = '<leader>rl' },
      close = { n = '<leader>rc' },
      historyOpen = { n = '<leader>rt' },
      historyAdd = { n = '<leader>ra' },
      refresh = { n = '<leader>rn' },
      openLocation = { n = '<leader>ro' },
      gotoLocation = { n = '<enter>' },
      pickHistoryEntry = { n = '<enter>' },
    },
  },
}
