return {
  -- 平滑光标移动效果
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  }
}