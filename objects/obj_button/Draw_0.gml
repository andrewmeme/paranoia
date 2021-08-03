/// @description Draw the button
var clr = merge_color(B_GRAY, B_WHITE, hover);
var y_offset = 4 * hover;

draw_set_font(roboto_bold);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text_color(x, y - y_offset, text, clr, clr, clr, clr, 1);