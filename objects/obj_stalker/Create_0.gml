/// @description Initialize the Stalker

// Inherit the parent event
event_inherited();

// Stalking properties
stalk = {
	x1: x,
	y1: y,
	x2: grid_snap(PLAYER.x),
	y2: grid_snap(PLAYER.y),
	range: LIGHT_RANGE
}

// Light interaction
light_range = 0.8 * LIGHT_RANGE;
light_health = 1.5 * room_speed;

// State machine
stalk_state = stalker_stalk;
chase_state = stalker_chase;
stun_state = stalker_stun;
state = stalk_state;

// Sound effects
screech = false;
audio_emitter_gain(emitter, 1);
audio_emitter_falloff(emitter, 480, 720, 1);
audio_emitter_pitch(emitter, 0.5);

// Delta alarms
#macro STALK_TIMER 0
Alarm[STALK_TIMER] = 16 * room_speed;