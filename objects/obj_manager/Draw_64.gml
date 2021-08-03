/// @description Display qutting

if (quitting < QUIT_TIME) {
	var bar_x = CAM_WIDTH/2 - 60;
	var bar_y = 36;

	// Draw the text
	var text = "Quitting...";
	draw_set_font(roboto_bold);
	draw_text(CAM_WIDTH/2 - string_width(text) / 2, 32, text);
	draw_set_font(roboto);

	// Draw the bar
	var bar_len = 120 * (1 - quitting/QUIT_TIME);
	draw_set_color(LIGHT_COLOR);
	draw_rectangle(bar_x, bar_y, bar_x + 120, bar_y + 4, true);
	draw_rectangle(bar_x, bar_y, bar_x + bar_len, bar_y + 4, false);
	draw_set_color(c_white);
}