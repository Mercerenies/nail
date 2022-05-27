
var should_animate = false;
if (dia_text == display_text) {
  should_animate = !text_is_passive;
} else {
  display_text = string_copy(dia_text, 1, string_length(display_text) + 2);
}

if (should_animate) {
  image_speed = 1;
} else {
  image_speed = 0;
  image_index = 0;
}

if (mouse_check_button_pressed(mb_left)) {
  if (dia_text != display_text) {
    display_text = dia_text;
  } else if (!text_is_passive) {
    next();
  }
}
