/// @description Insert description here

// Draw controls at the top
if (draw_control and (progress == tut.walk or progress == tut.shoot)) {
	var sprite = walk_control;
	if (progress == tut.shoot) {
		sprite = shoot_control;
	}
	
	draw_sprite(sprite, 0, x, y - sprite_offset_y);
}

// Inherit the parent event
event_inherited();

