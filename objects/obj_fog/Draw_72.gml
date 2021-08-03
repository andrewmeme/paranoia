/// @description Draw the fog

// Create a surface for the fog
if (!surface_exists(global.fog.surface)) {
	global.fog.surface = surface_create(room_width, room_height);
}

// Draw the fog surface first
surface_set_target(global.fog.surface);
draw_clear_alpha(FOG_COLOR, FOG_ALPHA);
surface_reset_target();