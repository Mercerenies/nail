
getText = function() {
  var match = noone;
  with (obj_Item) {
    if (isDragging()) {
      // If we're dragging anything at all, show no tooltip
      return "";
    } else if (position_meeting(mouse_x, mouse_y, self)) {
      match = self;
    }
  }
  if (instance_exists(match)) {
    return match.getData().getName();
  }
  return "";
}