/// @description Insert description here
// Debug: Draw line to target
//if (not dead) {
//	draw_line_color(x, y, px, py, c_red, c_red);
//}

// Check for player facing
if (270 < facing or facing <= 90) {
	image_xscale = 1;
} else {
	image_xscale = -1;
}

// Inherit the parent event
event_inherited();

