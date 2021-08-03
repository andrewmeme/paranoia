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

// Record the true coordinates
true_x = true_x + spd._x;
true_y = true_y + spd._y;

// Keep entity in bound
sprite_offset = abs(sprite_width/2);
true_x = clamp(true_x, 0 + sprite_offset, room_width - sprite_offset);
true_y = clamp(true_y, 0 + sprite_offset, room_height - sprite_offset);

// Floor them for gamemaker
x = floor(true_x);
y = floor(true_y);
