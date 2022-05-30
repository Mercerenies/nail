
var yy = y;
draw_set_color(c_black);
draw_set_font(fnt_InventoryLabel);

var count = 0;
for (var i = 0; i < 4; i++) {
  if (ctrl_PersistentState.gotEnding[i]) {
    count += 1;
  }
}

draw_text(x, yy, "Endings obtained: " + string(count) + " / 4");
yy += string_height("M");
 
for (var i = 0; i < 4; i++) {
  var text = endingTagline(i);
  if (ctrl_PersistentState.gotEnding[i]) {
    draw_set_color(c_black);
  } else {
    draw_set_color(c_gray);
    text = "(" + text + ")";
  }
  draw_text(x, yy, text);
  yy += string_height("M");
}
