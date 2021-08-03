/// @description Proceed to next level or restart
show_debug_message("Next Level: " + string(global.level));

if (level_end and global.level < array_length(levels)) {
	// Save the value for next level
	if (PLAYER.object_index == obj_player) {
		global.sanity = PLAYER.sanity.val;
		global.ammo = PLAYER.hand.ammo;
	}
	
	room_goto(levels[global.level]);
} else if (level_restart) {
	room_restart();
}