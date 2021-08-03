/// @description Control Player Sprite
event_inherited();

if (not dead and sanity.val > 0) {
	if (spd._x == 0 and spd._y == 0) {
		// Idle when the not moving
		sprite_index = s_idle;
	} else {
		// Change direction when you move
		sprite_index = s_walk;
	}

	// Check for player facing
	if (270 < facing or facing <= 90) {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}
	
	// Reload ammo
	if (hand.cooldown > 0) {
		var x_offset = 12;
		var x_bar = 20 * (1 - hand.cooldown / hand.fire_speed);
		var y_offset = sprite_get_height(s_idle) / 2;
		draw_set_color(LIGHT_COLOR);
		draw_rectangle(x - x_offset, y - y_offset - 5, x + x_offset, y - y_offset - 1, true);
		draw_rectangle(x - x_offset + 2, y - y_offset - 3, x - x_offset + 2 + x_bar, y - y_offset - 3, false);
		draw_set_color(c_white);
	}
}


draw_self();
