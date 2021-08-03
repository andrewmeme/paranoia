/// @description Follow mouse cursor

var dir = arctan2(mouse_y - y, mouse_x - x) * (180/pi);
var dis = point_distance(x, y, mouse_x, mouse_y);

if (dis > spd._max) {
	spd._x = spd._max * dcos(dir) * delta;
	spd._y = spd._max * dsin(dir) * delta;
} else {
	spd._x = dis * dcos(dir) * delta;
	spd._y = dis * dsin(dir) * delta;
}

// When near a switch
if (instance_exists(obj_gate)) {
	var gate = instance_nearest(x, y, obj_gate);
	if (point_distance(x, y, gate.x, gate.y) < LIGHT_RANGE * 1.2) {
		dialogue_say(dial.gate, 0.5);
	}
}

// Inherit the parent event
event_inherited();