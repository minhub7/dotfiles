local g = vim.g

-- Setting for neovide
if vim.fn.exists("g:neovide") ~= 0 then
  vim.opt.guifont = { "D2Codingligature_Nerd_Font", ":h11" }
  g.neovide_scale_factor = 1.0
  g.neovide_floating_blur_amount_x = 1.0
  g.neovide_floating_blur_amount_y = 1.0
  g.neovide_scroll_animation_length = 0.15
  g.neovide_hide_mouse_when_typing = true
  g.neovide_remember_window_size = true
end

-- if exists("g:neovide") then
    -- vim.opt.guifont = {"D2Coding ligature Regular, h11"}
-- end
