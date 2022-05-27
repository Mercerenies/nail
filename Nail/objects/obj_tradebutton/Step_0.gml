
if (mouse_check_button_released(mb_left)) {
  if (position_meeting(mouse_x, mouse_y, self) && !UI.isShowingModal()) {
    if (!instance_exists(Inventory.getDraggedItem())) {
      var target = obj_Customer;
      if (instance_exists(target)) {
        target.performTrade();
      }
    }
  }
}

// Set image index
image_index = _targetImageIndex();
