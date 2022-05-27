
var text = getText();
if (text != "") {
  draw_set_font(fnt_Tooltip);

  var w = string_width_ext(text, -1, 240) + 4;
  var h = string_height_ext(text, -1, 240) + 4;

  var xx = mouse_x;
  var yy = mouse_y;

  if (xx + w > room_width) {
    xx -= w;
  }
  if (yy - h > 0) {
    yy -= h;
  }

  var bgcolor = c_dkgrey;
  draw_rectangle_color(xx, yy, xx + w, yy + h, bgcolor, bgcolor, bgcolor, bgcolor, false);
  draw_set_color(c_white);
  draw_text_ext(xx + 2, yy + 2, text, -1, 240)

}
