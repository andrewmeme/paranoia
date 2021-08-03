/// @description Fairy talks in Tutorial

switch (progress) {
	case tut.walk:
		// Check for walking
		var is_walking = keyboard_check(ord("D")) or keyboard_check(ord("A")) or
				keyboard_check(ord("S")) or keyboard_check(ord("W"));
		if (is_walking) {
			walk_value = max(0, walk_value - delta);
		}

		if (walk_value == 0) {
			progress++;
			draw_control = false;
			with (PLAYER) {
				dialogue_say(dial.p_walk, 3);
			}
		}
		dialogue_say(dial.tut_walk, 1/room_speed);
		break;
	case tut.shoot:
		// Check if crossbow in hand
		if (PLAYER.hand.crossbow != noone) {
			draw_control = true;
			dialogue_say(dial.tut_shoot, 1/room_speed);
			if (mouse_check_button_pressed(mb_left)) {
				dialogue_say(dial.tut_shoot_2, 3.5);
				progress++;
				
				with (PLAYER) {
					dialogue_say(dial.p_shoot, 3);
				}
			}
		}
		break;
}

// Hint when player see corpse
if (PLAYER.textbox.text_index == dial.corpse_goblin) {
	dialogue_say(dial.tut_corpse, 0.5);
}

// Hint when goblin is near it
if (instance_exists(obj_goblin)) {
	var gob = instance_find(obj_goblin, 0);
	if (point_distance(x, y, gob.x, gob.y) < LIGHT_RANGE * 1.5) {
		dialogue_say(dial.tut_goblin, 0.5);
	}
}

// Hint when idol is near it
if (instance_exists(obj_idol)) {
	var idol = instance_find(obj_idol, 0);
	if (point_distance(x, y, idol.x, idol.y) < LIGHT_RANGE * 1.2) {
		dialogue_say(dial.tut_idol, 0.5);
	}
}


// When near the hunter
if (instance_exists(obj_hunter)) {
	var hunter = instance_find(obj_hunter, 0);
	if (point_distance(x, y, hunter.x, hunter.y) < LIGHT_RANGE) {
		dialogue_say(dial.tut_shadow, 0.5);
	}
}

// Inherit the parent event
event_inherited();

