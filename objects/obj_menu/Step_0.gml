/// @description Update the menu

// Update delta time
delta = (delta_time / 1000000) * room_speed;
depth = obj_fog.depth - 1;

// Check if fullscreen toggled
if (keyboard_check_pressed(ord("F"))) {
	window_set_fullscreen(!window_get_fullscreen());
}


// Tick timer
delta_alarm();