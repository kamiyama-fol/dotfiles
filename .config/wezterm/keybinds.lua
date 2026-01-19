-- WezTermの機能を読み込みます
local wezterm = require("wezterm")
-- アクション（操作）を簡単に呼び出せるように変数に格納します
local act = wezterm.action

-- 設定を構築するためのビルダーを初期化します
-- 引用元: https://wezfurlong.org/wezterm/config/lua/config/index.html
local config = wezterm.config_builder()

-- ==========================================
-- 基本設定
-- ==========================================

-- 右下のステータスエリアにアクティブなキーテーブルを表示する設定
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

-- ==========================================
-- キー操作の設定 (Key Assignments)
-- ==========================================
config.keys = {
  -- リーダーキー経由の分割 
  { key = "'", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- Workspaceの切り替え
  { key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }) },
  
  -- コマンドパレット (Cmd + p または Ctrl + Shift + p)
  { key = "p", mods = "SUPER", action = act.ActivateCommandPalette },
  { key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },

  -- タブ操作
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
  { key = "{", mods = "LEADER", action = act({ MoveTabRelative = -1 }) },
  { key = "}", mods = "LEADER", action = act({ MoveTabRelative = 1 }) },
  { key = "t", mods = "SUPER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "w", mods = "SUPER", action = act({ CloseCurrentTab = { confirm = true } }) },

  -- ペイン移動 (Leader + h,j,k,l)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

  -- キーテーブルの呼び出し
  { key = "s", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
}

-- ==========================================
-- キーテーブル (モード切替)
-- ==========================================
-- 引用元: https://wezfurlong.org/wezterm/config/key-tables.html
config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter", action = "PopKeyTable" },
  },
  -- コピーモード（Viライクな操作）
  copy_mode = {
    { key = "h", action = act.CopyMode("MoveLeft") },
    { key = "j", action = act.CopyMode("MoveDown") },
    { key = "k", action = act.CopyMode("MoveUp") },
    { key = "l", action = act.CopyMode("MoveRight") },
    { key = "y", action = act.CopyTo("Clipboard") },
    { key = "q", action = act.CopyMode("Close") },
    { key = "Escape", action = act.CopyMode("Close") },
  },
}

-- 最後にすべての設定が入った config を返します
return config
