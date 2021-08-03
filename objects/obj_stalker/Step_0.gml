/// @description Stalker shadow behaviour

event_inherited();

// Detect if the shadow is under light
if (under_light) {
	if (state != chase_state and state != stun_state) {
		state = stun_state;
	}
} else {
	if (state != chase_state and state != stalk_state) {
		state = stalk_state;
	}
}

// Run current state
if (light_health > 0 and not deactivate) {
	// Kill the player
	enemy_attack();
	script_execute(state);
} else {
	audio_play_sound(snd_shadow_death, 3, false);
	instance_destroy();
}


// Screech
if (not screech and state == chase_state) {
	var close_to_player = point_distance(x, y, PLAYER.x, PLAYER.y) < LIGHT_RANGE * 1.5;
	is_light_close = point_distance(x, y, FAIRY.x, FAIRY.y) <= LIGHT_RANGE * 1.5;
	if (close_to_player or is_light_close) {
		screech = true;
		audio_play_sound_on(emitter, snd_screech, false, 3);
	}
}