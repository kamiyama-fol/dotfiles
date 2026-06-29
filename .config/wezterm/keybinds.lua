local wezterm = require("wezterm")
local act = wezterm.action

-- nvim のステータスラインと同様にモードを右端に表示
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  local text, bg, fg = "", "#1e2127", "#abb2bf"
  if name == "copy_mode" then
    text, bg, fg = "  NORMAL  ", "#98c379", "#1e2127"
  elseif name == "resize_pane" then
    text, bg, fg = "  RESIZE  ", "#e5c07b", "#1e2127"
  elseif name == "window_mode" then
    text, bg, fg = "  WINDOW  ", "#61afef", "#1e2127"
  end
  window:set_right_status(wezterm.format({
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Attribute = { Intensity = "Bold" } },
    { Text = text },
  }))
end)

-- ==========================================
-- メインキーバインド
-- ==========================================
local keys = {
  -- フルスクリーン
  { key = "f", mods = "SHIFT|META", action = act.ToggleFullScreen },

  -- コピーモード (nvim の Normal モード相当)
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },

  -- ウィンドウモード: LEADER+w → nvim の <C-w> と同じ感覚
  { key = "w", mods = "LEADER", action = act.ActivateKeyTable({ name = "window_mode", one_shot = true }) },

  -- ペイン直接移動 (LEADER + hjkl)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

  -- タブ操作
  { key = "Tab",  mods = "CTRL",       action = act.ActivateTabRelative(1) },
  { key = "Tab",  mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
  { key = "t",    mods = "SUPER",      action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w",    mods = "SUPER",      action = act.CloseCurrentTab({ confirm = true }) },
  { key = "{",    mods = "LEADER",     action = act.MoveTabRelative(-1) },
  { key = "}",    mods = "LEADER",     action = act.MoveTabRelative(1) },

  -- Workspace ランチャー (LEADER+Space)
  { key = " ", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Workspaces" }) },

  -- コマンドパレット
  { key = "p", mods = "SUPER",      action = act.ActivateCommandPalette },
  { key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
}

-- ==========================================
-- キーテーブル
-- ==========================================
local key_tables = {

  -- ウィンドウ操作 (nvim の <C-w>? と同じ感覚で使う)
  -- 使い方: LEADER → w → 以下のキー
  window_mode = {
    { key = "h", action = act.ActivatePaneDirection("Left") },
    { key = "j", action = act.ActivatePaneDirection("Down") },
    { key = "k", action = act.ActivatePaneDirection("Up") },
    { key = "l", action = act.ActivatePaneDirection("Right") },
    { key = "w", action = act.ActivatePaneDirection("Next") },
    { key = "p", action = act.ActivatePaneDirection("Prev") },
    { key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "z", action = act.TogglePaneZoomState },
    { key = "c", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "n", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "r", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q",      action = "PopKeyTable" },
  },

  -- ペインリサイズ (LEADER+w → r で突入)
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize({ "Left",  3 }) },
    { key = "l",      action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "k",      action = act.AdjustPaneSize({ "Up",    3 }) },
    { key = "j",      action = act.AdjustPaneSize({ "Down",  3 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
    { key = "q",      action = "PopKeyTable" },
  },

  -- コピーモード: nvim の Normal/Visual モードと同じ感覚
  -- 突入: LEADER+[
  -- 終了: q / Escape / Ctrl+[
  copy_mode = {
    -- === 基本移動 (hjkl) ===
    { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
    { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
    { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
    { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

    -- === 行移動 (0, $, ^) ===
    { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
    { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
    { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },

    -- === 単語移動 (w, e, b) ===
    { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
    { key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
    { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

    -- === スクロールバック先頭/末尾 (g=top, G=bottom) ===
    { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
    { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },

    -- === ビューポート内移動 (H, M, L) ===
    { key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
    { key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
    { key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },

    -- === ページ移動 ===
    { key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
    { key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
    { key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage =  0.5 }) },
    { key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },

    -- === ビジュアルモード (v=文字, V=行, Ctrl+v=矩形) ===
    { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
    { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
    { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
    -- 選択範囲の反対端へ (o/O)
    { key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
    { key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

    -- === ヤンク (y でコピーしてモード終了) ===
    { key = "y", mods = "NONE", action = act.Multiple({
      act.CopyTo("ClipboardAndPrimarySelection"),
      act.CopyMode("Close"),
    }) },

    -- === 検索 (/ で前方、n/N で次/前) ===
    { key = "/", mods = "NONE", action = act.Search({ CaseSensitiveString = "" }) },
    { key = "n", mods = "NONE", action = act.CopyMode("NextMatch") },
    { key = "N", mods = "NONE", action = act.CopyMode("PriorMatch") },

    -- === 終了 ===
    { key = "q",      mods = "NONE", action = act.CopyMode("Close") },
    { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    { key = "[",      mods = "CTRL", action = act.CopyMode("Close") },
  },

  -- 検索モード (/ 入力後の状態)
  search_mode = {
    { key = "Enter",  mods = "NONE", action = act.CopyMode("AcceptPattern") },
    { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    { key = "[",      mods = "CTRL", action = act.CopyMode("Close") },
    { key = "r",      mods = "CTRL", action = act.CopyMode("CycleMatchType") },
    { key = "u",      mods = "CTRL", action = act.CopyMode("ClearPattern") },
    { key = "n",      mods = "CTRL", action = act.CopyMode("NextMatch") },
    { key = "p",      mods = "CTRL", action = act.CopyMode("PriorMatch") },
  },
}

return {
  keys = keys,
  key_tables = key_tables,
}
