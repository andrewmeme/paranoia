/// @description Manage backend data

// Control delta timer
delta = (delta_time / 1000000) * room_speed;

// Check if fullscreen toggled
if (keyboard_check_pressed(ord("F"))) {
	window_set_fullscreen(!window_get_fullscreen());
}

// Check if player is closing game
if (keyboard_check(vk_escape)) {
	quitting = max(0, quitting - delta);
	show_debug_message("Pressed: " + string(quitting/QUIT_TIME));
} else {
	quitting = QUIT_TIME;
	show_debug_message("Released: "+ string(quitting/QUIT_TIME));
}

if (quitting == 0) {
	close_game();
}

// Perform Action when level ends or restarts
if (level_end and Alarm[L_END] == ALARM_END) {
	global.level++;
	Alarm[L_END] = ROOM_FADE;
	with (obj_enemy) {
		deactivate = true;
	}
} else if (level_restart and Alarm[L_END] == ALARM_END) {
	Alarm[L_END] = ROOM_FADE;
}

// Tick delta alarm
delta_alarm();