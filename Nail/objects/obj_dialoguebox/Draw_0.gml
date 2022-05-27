
draw_self();

draw_set_font(fnt_Dialogue);
draw_set_color(c_black);
draw_text_ext(x, y, display_text, -1, sprite_width - (x - bbox_left) * 2);
