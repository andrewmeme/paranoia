/// @description Play footsteps
if (event_data[? "event_type"] == "sprite event") {
	if (event_data[? "message"] == "stalker_step") {
		audio_falloff_set_model(audio_falloff_linear_distance_clamped);
		audio_play_sound_on(emitter, snd_step, false, 0);
	}
}