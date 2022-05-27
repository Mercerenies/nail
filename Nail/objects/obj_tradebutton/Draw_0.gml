
if (position_meeting(mouse_x, mouse_y, self) && !UI.isShowingModal()) {
  shader_set(sh_Invert);
}
draw_self();
shader_reset();