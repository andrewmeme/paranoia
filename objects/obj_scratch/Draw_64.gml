/// @description Draw text on GUI

draw_set_font(scratches);

var alpha = 0.8 * (Alarm[FADE]/max_fade);
var size_shift = 0.4 + 0.4 * (1 - Alarm[FADE]/max_fade);
draw_set_alpha(alpha);
draw_set_color(color);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (initiated) {
	draw_text_transformed(tx, ty, text, size_shift, size_shift, angle);
}
draw_set_font(roboto);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_alpha(1);