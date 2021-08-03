/// @description Beholder behaviours

// Inherit the parent event
event_inherited();

if (light_health > 0 and not deactivate) {
	// Kill the player
	enemy_attack();
} else {
	audio_play_sound(snd_shadow_death, 3, false);
	instance_destroy();
}