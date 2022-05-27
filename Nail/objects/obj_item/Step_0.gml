
if (mouse_check_button_pressed(mb_left)) {
  if (position_meeting(mouse_x, mouse_y, self)) {
    _dragging = true;
    _anchorX = x - mouse_x;
    _anchorY = y - mouse_y;
    _previousOwnerSlot = _ownerSlot;
    _ownerSlot = undefined;
  }
}

if (_dragging) {
  x = _anchorX + mouse_x;
  y = _anchorY + mouse_y;

  if (mouse_check_button_released(mb_left)) {
    _dragging = false;
    var target = _targetingSlot();
    if (is_undefined(target)) {
      target = _previousOwnerSlot;
    }
    assignToSlot(target);
  }

}
