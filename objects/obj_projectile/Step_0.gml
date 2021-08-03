/// @description Projectile behaviour

// Check for collision
if (tilemap_get_at_pixel(collision_set, x, y) != 0) {
	hit_wall = true;
}

// Projectile Travel
if (not hit_wall) {
	x += spd * dcos(angle) * delta;
	y += spd * -dsin(angle) * delta;
}

// Tick delta alarms
delta_alarm();