/// @description Check if the statue is an event statue

if (will_break and point_distance(x, y, PLAYER.x, PLAYER.y) < light_range) {
	break_timer = max(0, break_timer - delta);
}

// Spawn a broken statue and destroy itself
if (break_timer == 0) {
	// Player dialogue
	with (PLAYER) {
		dialogue_say(dial.idol_break, 3);
	}
	
	// Ramp up the spawn chance
	var manager = instance_find(obj_manager, 0);
	manager.spawn_mod = 5;
	
	audio_play_sound(snd_break, 3, false);
	instance_create_layer(x, y, "Instances", obj_broken_idol);
	instance_destroy();
}