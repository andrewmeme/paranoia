/// @description Draw text

// Get data from the dialogue bank
var text_option = text_options[text_index][text_san_level];
var text_sections = text_option[T_CONTENT];
var text_highlight = text_option[T_HIGHLIGHT];
var text_hcolor = text_option[T_HCOLOR];

// Calculate total length
var total_length = 0;
for (var i = 0; i < array_length(text_sections); ++i) {
	total_length += string_width(text_sections[i]);
}
total_length += (array_length(text_sections) - 1) * string_width(" ");

// Get text offset
var tx = owner.x - total_length/2;
var ty = owner.y - offset_y;

// Draw text
if (Alarm[TEXT_TIMER] > ALARM_END) {
	draw_set_font(roboto);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	for (var sec = 0; sec < array_length(text_sections); ++sec) {
		// Get color for text
		var text = text_sections[sec];
		var clr = T_COLOR;
		if (sec == text_highlight) {
			clr = text_hcolor;
		}
		
		// Draw the section
		for (var i = 0; i < string_length(text); ++i) {
			var c = string_copy(text, i + 1, 1);
			var rx = random_range(-intensity, intensity);
			var ry = random_range(-intensity, intensity);
			draw_text_color(tx + rx, ty + ry, c, clr, clr, clr, clr, 1);
			tx += string_width(c);
		}
		
		// Draw a space
		draw_text(tx + rx, ty + ry, " ");
		tx += string_width(" ");
	}
	
}

