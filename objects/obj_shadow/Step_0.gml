/// @description Basic Shadow Behaviours

// Detect if it is under light source
var near = instance_nearest(x, y, obj_fairy);
if (instance_exists(near)) {
	under_light = point_distance(x, y, near.x, near.y) <= light_range and
				is_in_view(near, light_range);
}

// Detect if the shadow is damaged by light
if (under_light) {
	light_health = max(0, light_health - delta);
}

// Move sound emitter
audio_emitter_position(emitter, x, y, 0);

// Delta ticks
delta_alarm();