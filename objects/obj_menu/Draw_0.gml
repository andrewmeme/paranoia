/// @description Draw effect on the screen

// Title
draw_set_font(scratches);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text(room_width / 2, 80, "Paranoia");

draw_set_font(roboto);
draw_set_halign(fa_left);
draw_text(10, room_height - 10, "Press F for fullscreen");

// Fade out effect
if (Alarm[FADE] > ALARM_END) {
	var clr = c_black;
	draw_set_alpha(0.2 + (1 - Alarm[FADE]/FADE_TIME));
	draw_rectangle_color(0, 0, room_width, room_height, clr, clr, clr, clr, false);
	draw_set_alpha(1);
}