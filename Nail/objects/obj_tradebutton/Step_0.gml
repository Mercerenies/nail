
if (mouse_check_button_released(mb_left)) {
  if (position_meeting(mouse_x, mouse_y, self) && !UI.isShowingModal()) {
    var target = obj_Customer;
    if (instance_exists(target)) {
      target.performTrade();
    }
  }
}