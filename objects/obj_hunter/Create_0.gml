/// @description Initialize the hunter

// Inherit the parent event
event_inherited();

// Sprite setting
sprite_index = spr_hunter;

// Chase config
spd._max = 2.15;

// Light interaction
light_range = 0.8 * LIGHT_RANGE;
light_health = 1.5 * room_speed;

// State machine
idle = hunter_idle;
chase = stalker_chase;
state = idle;

// Noise setting
#macro NOISE_MIN (4 * room_speed)
#macro NOISE_MAX (6 * room_speed)
#macro NOISE 0
Alarm[NOISE] = 0;

// Despawn setting
#macro DESPAWN 1
Alarm[DESPAWN] = 18 * room_speed;
persist = false;

// Audio emitter tweaks
audio_emitter_gain(emitter, 0.4);
audio_emitter_falloff(emitter, 3 * LIGHT_RANGE, 5 * LIGHT_RANGE, 1);