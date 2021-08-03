/// @description Insert description here

// Draw it in front of objects
depth = -y - 2;

// Turn image angle to match direction
image_angle = angle;

// Detect if there are light around
var nearest_light = instance_nearest(x, y, obj_fairy);
if (not always_render) {
	var dis = point_distance(x, y, nearest_light.x, nearest_light.y);
	if (dis < INVIS_DIS and is_in_view(nearest_light, INVIS_DIS)) {
		image_alpha = (1 - (dis - FADE_DIS) / (INVIS_DIS - FADE_DIS));
	} else {
		image_alpha = 0;
	}
}

draw_self();