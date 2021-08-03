/// @description Player Behaviours
if (not dead and sanity.val > 0) {
	// Allow player movement control
	player_move();

	// Allow player to shoot and collect arrow
	player_shoot();
	player_collect_arrow();

	// Check player facing
	facing = point_direction(x, y, mouse_x, mouse_y);

	// Restore sanity when near idols
	player_near_idol();

	// Detect if player takes sanity damage
	sanity.is_recovering = true;
	if (manager.level_start) {
		player_sanity_dark();
		player_sanity_vision(obj_human_corpse, dial.corpse);
		player_sanity_vision(obj_goblin_corpse, dial.corpse_goblin);
		player_sanity_vision(obj_shadow, dial.shadow);
	}
	
	// Buffer recover
	if (sanity.is_recovering) {
		sanity.buffer = min(sanity.buffer + delta, SANITY_BUFFER);
	}
	
	// Check if player reached room end
	player_reach_end();

	// Hint about corners when out of ammo
	player_no_ammo_hint();
	
	// Play whispers when sanity decreases 
	play_whispers();

	// Inherit the parent event
	event_inherited();
} else {
	player_died(sanity.val <= 0);
}


// Tick delta alarm
delta_alarm();