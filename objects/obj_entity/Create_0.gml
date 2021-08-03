/// @description Entity Initialization

// Travel speed
spd = {
	_x: 0,
	_y: 0,
	_max: 2
}

// True coordinates
true_x = x;
true_y = y;

// Death control
dead = false;

// Light Interaction
#macro FADE_DIS  0.7 * LIGHT_RANGE
#macro INVIS_DIS LIGHT_RANGE

// Render control
always_render = false;

// Delta Alarm
Alarm = array_create(12);