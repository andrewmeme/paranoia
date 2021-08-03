/// @description Tutorial Fairy
// Inherit the parent event
event_inherited();

enum tut {
	walk,
	shoot,
	corpse,
	shadow
}

// Tutorial Progress
progress = 0;
draw_control = true;
sprite_offset_y = string_height("A") + 4;

// Walk stage
walk_value = 1.5 * room_speed;
walk_control = spr_keyboard;

// Shoot stage
shoot_control = spr_mouse;