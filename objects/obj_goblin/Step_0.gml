/// @description Insert description here

// State Change
if (state == idle and in_vision) {
	state = chase;
	sprite_index = spr_walk;
	audio_play_sound(snd_goblin, 1, false);
} else if (state == chase and p_end and not in_vision) {
	state = idle;
	sprite_index = spr_idle;
}

if (dead or deactivate) {
	// Stop actions when dead or deactivate
	path_end();
	
	if (dead and sprite_index != spr_dead) {
		sprite_index = spr_dead;
		image_index = 0;
	}
}
else {
	// Attacks player
	enemy_attack();
	
	// Run the current state
	script_execute(state);
}

