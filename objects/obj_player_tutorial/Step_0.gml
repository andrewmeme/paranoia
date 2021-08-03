/// @description Additional Behaviour

// Say dialogue when near tablet
if(instance_exists(obj_scripture)) {
	if (point_distance(x, y, obj_scripture.x, obj_scripture.y) < LIGHT_RANGE) {
		dialogue_say(dial.tut_shadow_2, 0.5);
	}
}

// Inherit the parent event
event_inherited();

