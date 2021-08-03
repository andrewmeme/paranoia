/// @description Hunter behaviour

// Inherit the parent event
event_inherited();

// Detect if the player is close and under light
if (state == idle) {
	if (under_light) {
		state = chase;
		sprite_index = spr_hunter_walk;
		audio_emitter_gain(emitter, 0.8);
		audio_play_sound_on(emitter, snd_screech, false, 2);
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