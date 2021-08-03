/// @description Textbox logic

// Update offset
if (offset_y == 0) {
	offset_y = sprite_get_height(owner.sprite_index) / 2 + 6;
}

// Update intensity
if (owner.object_index == obj_player or owner.object_index == obj_player_tutorial) {
	var sanity = (owner.sanity.val / owner.sanity._max);
	intensity = 0.2 + 1.3 * (1 - sanity);
	text_san_level = (sanity < 0.4);
}


// Tick Alarms
delta_alarm();
