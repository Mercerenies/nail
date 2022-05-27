
var draggedItem = noone;
with (obj_Item) {
  if (isDragging()) {
    draggedItem = self;
    break;
  }
}

if (instance_exists(draggedItem)) {
  with (draggedItem) {
    var alpha = 0.5;
    var xx = x;
    var yy = y;
    var target = _targetingSlot();
    if (isDragging() && !is_undefined(target)) {
      xx = mean(target.bbox_left, target.bbox_right);
      yy = mean(target.bbox_top, target.bbox_bottom);
    }

    draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, image_blend, alpha);

  }
}