//@function player_move()
//@description allow player to move with wasd keys smoothly
function player_move(){
	var x_key = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var y_key = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	if (x_key != 0 or y_key != 0) {
		angle = arctan2(y_key, x_key) * (180 / pi);
	}
	
	// Add acceleration to axes
	if (x_key != 0) {
		var max_x = spd._max * dcos(angle);
		spd._x += accel * dcos(angle) * delta;
		spd._x = clamp(spd._x, -max_x, max_x);
	} else {
		spd._x = 0;
	}
		
	if (y_key != 0) {
		var max_y = spd._max * dsin(angle);
		spd._y += accel * dsin(angle) * delta;
		spd._y = clamp(spd._y, -max_y, max_y);
	} else {
		spd._y = 0;
	}
	
	// move the audio listener
	audio_listener_position(x, y, 0);
}

//@function player_shoot()
//@description allow player to shoot arrow from the hand
function player_shoot() {
	// Reduce cooldown
	hand.cooldown = max(0, hand.cooldown  - delta);

	// Check if the player clicked
	var shoot_key = mouse_check_button_pressed(mb_left);
	if (hand.crossbow != noone and hand.cooldown == 0 and hand.ammo > 0 and shoot_key) {
		// Put crossbow into cooldown and take away 1 ammo
		hand.cooldown = hand.fire_speed;
		hand.ammo--;
		
		// Get mouse angle
		var _x = hand.crossbow.x;
		var _y = hand.crossbow.y;
		var angle = point_direction(_x, _y, mouse_x, mouse_y);
		
		// Create projectile
		var arrow = instance_create_layer(_x, _y, "Instances", obj_arrow);
		arrow.angle = angle;
		
		// Play shooting sound
		audio_play_sound(snd_crossbow, 1, false);
	}
}

//@function player_collect_arrow()
//@description allow player to collect stuck arrow
function player_collect_arrow() {
	var arrow = instance_nearest(x, y, obj_arrow);
	if (arrow != noone and arrow.hit_wall) {
		var dis = point_distance(x, y, arrow.x, arrow.y);
		if (dis < COLLECT_RANGE) {
			instance_destroy(arrow);
			hand.ammo++;
		}
		else if (dis < RETRACT_RANGE) {
			arrow.x = lerp(arrow.x, x, RETRACT_FACTOR);
			arrow.y = lerp(arrow.y, y, RETRACT_FACTOR);
			
			// Scale the arrow when retracting
			var scale = (dis - COLLECT_RANGE) / (RETRACT_RANGE - COLLECT_RANGE);
			arrow.image_xscale = scale;
			arrow.image_yscale = scale;
		}
	}
}

//@function player_sanity_decrease()
//@description Decrease the sanity of the player
function player_sanity_decrease(value) {
	sanity.val = clamp(sanity.val - value * delta, 0, sanity._max);
}

//@function player_near_idol()
//@description Increase sanity of player when near an idol
function player_near_idol() {
	var idol = instance_nearest(x, y, obj_idol);
	if (instance_exists (idol) and point_distance(x, y, idol.x, idol.y) < 0.5 * idol.light_range) {
		player_sanity_decrease(-2);
		dialogue_say(dial.idol, 1);
	}
}

//@function player_sanity_dark()
//@description Control how player take sanity damage in dark
function player_sanity_dark() {
	// Detect if light is too far from player
	var near_light = instance_nearest(x, y, obj_fairy);
	var range = near_light.light_range;
	var dis = point_distance(x, y, near_light.x, near_light.y);
	if (dis > range) {
		var buffer_damage = (dis - range) / DARK_SCALE;
		sanity.buffer = max(0, sanity.buffer - buffer_damage * delta);
		sanity.is_recovering = false;
	}

	if (sanity.buffer == 0) {
		player_sanity_decrease(DARK_DMG);
		dialogue_say(dial.dark, 0.25);
	}
}

//@function player_sanity_vision()
//@description Control how player take sanity damage when seeing object
//@param obj {Real} the object to look for
//@param dialogue {enum} The dialogue to say when she sees it
function player_sanity_vision(obj, dialogue) {
	if(instance_exists(obj)) {
		var nearest = instance_nearest(x, y, obj);
		var dis = point_distance(x, y, nearest.x, nearest.y);
		
		// Check if player is facing corpse
		var dir = point_direction(x, y, nearest.x, nearest.y);
		var is_facing = abs(angle_difference(facing, dir)) <= (CORPSE_CONE / 2);
		
		if (dis < 1.2 * LIGHT_RANGE and is_facing and nearest.image_alpha >= 1) {
			var dmg = obj.san_dmg;
			if (sanity.buffer > 0) {
				var buffer_dmg = max(3 * dmg, 3) * delta;
				sanity.buffer = max(0, sanity.buffer - buffer_dmg);
				sanity.is_recovering = false;
			} else {
				player_sanity_decrease(dmg);
				dialogue_say(dialogue, 0.5);
			}
		}
	}
}

///@function player_died()
///@description send a signal to the manager that the player died
function player_died(insanity) {
	// Destroy the crossbow
	instance_destroy(hand.crossbow);
	hand.crossbow = noone;
	
	// Change sprite to dead sprite
	if (insanity) {
		if (sprite_index != s_insane) {
			sprite_index = s_insane;
			image_index = 0;
		}
	} else {
		if (sprite_index != s_dead) {
			sprite_index = s_dead;
			image_index = 0;
			audio_play_sound(snd_scream, 3, false);
		}
	}
	
	// Stop whisper sounds
	audio_stop_sound(snd_whisper);
	
	if (not manager.level_restart) {
		// Fire a signal to manager
		manager.level_restart = true;
	}
}

//@function player_reach_end()
//@description Detect if player reached room end
function player_reach_end() {
	// Check if player collided with end point
	if (not manager.level_end and position_meeting(x, y, obj_exit)) {
		// Fire a signal to manager
		manager.level_end = true;
	}
}

//@function dialogue_say()
//@description Say dialogue with lifetime control
//@param dialogue {Enum} the line to say
//@param lifetime {Real} how many seconds it lasts
function dialogue_say(dialogue, lifetime){
	// If a more important message is being displayed, don't overwrite
	if (textbox.Alarm[TEXT_TIMER] == ALARM_END or textbox.text_index <= dialogue) {
		textbox.text_index = dialogue;
		textbox.Alarm[TEXT_TIMER] = lifetime * room_speed;
	}
}

//@function play_whispers()
//@description Play whisper sounds when player sanity is low
function play_whispers() {
	if (whispers) {
		var volume = 0.2 * (1 - sanity.val/sanity._max);
		audio_sound_gain(snd_whisper, volume, 0);
	}

	if (not whispers and sanity.val/sanity._max < 0.8) {
		whispers = true;
		audio_play_sound(snd_whisper, 2, true);
	}
}

//@function show_texts()
//function show_texts() {
//	if (sanity.val/sanity._max < 0.6) {
//		instance_create_layer(0, 0, "Instances", obj_scratch);
//	}
//}

//@function player_no_ammo_hint()
//@description Let fairy tell the player what to do when no ammo
function player_no_ammo_hint() {
	// Out of ammo
	if (hand.ammo == 0) {
		// Check if chased by goblin
		var goblin = instance_nearest(x, y, obj_goblin);
		if (instance_exists(goblin) and goblin.state = enemy_chase_state and
				point_distance(x, y, goblin.x, goblin.y) < LIGHT_RANGE) {
			// have fairy tell hint
			with (FAIRY) {
				dialogue_say(dial.no_ammo, 1);
			}
		}
	}
}