/// @description Hunter Noise Timer

// Play sound in idle state
if (state == idle) {
	audio_falloff_set_model(audio_falloff_linear_distance_clamped);
	audio_emitter_pitch(emitter, random_range(0.5, 0.8));
	audio_play_sound_on(emitter, snd_hunter_noise, false, 2);
}


Alarm[NOISE] = irandom_range(NOISE_MIN, NOISE_MAX);