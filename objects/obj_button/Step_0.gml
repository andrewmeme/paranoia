/// @description Detect hover and click

// Hover detection
draw_set_font(roboto);
var mx = mouse_x;
var my = mouse_y;
var x1 = x - string_width(text) / 2;
var y1 = y - string_height(text);
var x2 = x1 + string_width(text);
var y2 = y;
var on_button = point_in_rectangle(mx, my, x1, y1, x2, y2);

hover = lerp(hover, on_button, HOVER_FACTOR);

if (on_button) {
	if (not played_sound) {
		audio_play_sound(snd_select, 1, false);
		played_sound = true;
	}
} else {
	played_sound = false;
}

if (not disabled and on_button and mouse_check_button_pressed(mb_left)) {
	script_execute(effect);
}
