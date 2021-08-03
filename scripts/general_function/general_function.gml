//General Macros
#macro ALARM_END -100
#macro TILE_SIZE 32
#macro LIGHT_RANGE 96

///@function delta_alarm()
///@description Allows alarms to support delta values
function delta_alarm() {
	var count = array_length(Alarm);
	for (var i = 0; i < count; ++i) {
		if (Alarm[i] > 0) {
			Alarm[i] -= delta;
		} else if (Alarm[i] <= 0 and Alarm[i] != ALARM_END) {
			Alarm[i] = ALARM_END;
			event_perform(ev_alarm, i);
		}
	}
}

///@function grid_snap()
///@description return the x or y value of the center of the nearest grid
///@param value {Real} the value to snap to
function grid_snap(value) {
	return (value div 32) * 32 + 16;
}

///@function collide_check()
///@description Check if entity is collided with collision tiles
function collide_check() {
	var bbox_side;
	var offset;
	// Horizontal collision
	if (spd._x > 0) {
		bbox_side = bbox_right;
		offset = bbox_side + ceil(spd._x);
	} else {
		bbox_side = bbox_left;
		offset = bbox_side + floor(spd._x);
	}
	
	if (tilemap_get_at_pixel(global.collision_tile, offset, bbox_top) != 0 or
			tilemap_get_at_pixel(global.collision_tile, offset, bbox_bottom) != 0) {
		if (spd._x > 0) {
			x = x - (x mod TILE_SIZE) + 31 - (bbox_right - x);
		} else {
			x = x - (x mod TILE_SIZE) - (bbox_left - x);
		}
		true_x = x;
		spd._x = 0;
	}
	
	// Vertical collision
	if (spd._y > 0) {
		bbox_side = bbox_bottom;
		offset = bbox_side + ceil(spd._y);
	} else {
		bbox_side = bbox_top;
		offset = bbox_side + floor(spd._y);
	}
	
	if (tilemap_get_at_pixel(global.collision_tile, bbox_left, offset) != 0 or
			tilemap_get_at_pixel(global.collision_tile, bbox_right, offset) != 0) {
		if (spd._y > 0) {
			y = y - (y mod TILE_SIZE) + 31 - (bbox_bottom - y);
		} else {
			y = y - (y mod TILE_SIZE) - (bbox_top - y);
		}
		true_y = y;
		spd._y = 0;
	}
}

///@function emit_light()
///@description Draw light circle on the fog layer
function emit_light(range) {
	if (surface_exists(global.fog.surface)) { 
		surface_set_target(global.fog.surface);
	
		// Draw light from self
		gpu_set_blendmode(bm_subtract);
		draw_circle_colour(x, y, range, LIGHT_COLOR, c_black, 0);
		gpu_set_blendmode(bm_normal);
	
		surface_reset_target();
	}
}

///@function is_in_view()
///@description detect is object is in range and not behind tiles
///@param object {Real} the target object
///@param range {Integer} the range of detection
function is_in_view(object, range) {
	var dis = point_distance(x, y, object.x, object.y);
	if (dis <= range) {
		// Check if player is behind tiles
		var dir = point_direction(x, y, object.x, object.y);
		var gap = 4;
		for(var i = 0; i < floor(dis/gap); ++i) {
			var check_x = x + lengthdir_x(i * gap, dir);
			var check_y = y + lengthdir_y(i * gap, dir);
			if tilemap_get_at_pixel(global.collision_tile, check_x, check_y) {
				return false;
			}
		}
		
		// Clear sight
		return true;
	}
	
	// Too far away
	return false;
}

///@function auto_tile()
///@description tile the blank space
function auto_tile() {
	var tile = layer_tilemap_get_id("Tiles");
	var tile_size = 32;
	var hcells = room_width div tile_size;
	var vcells = room_height div tile_size;
	
	for (var h = 0; h < hcells; ++h) {
		for (var v = 0; v < vcells; ++v) {
			if (tilemap_get(tile, h, v) == 0) {
				tilemap_set(tile, 10, h, v);
			}
		}
	}
}

///@function dialogue_setup()
///@description Setup all the dialogue
function dialogue_setup() {
	// Fuck me this is so scuffed
	text_options[dial.dark] = [[["I'm", "scared of dark!"], 1, T_RED], [["FAIRY? I'M SCARED"], 0, T_RED]];
	text_options[dial.corpse] = [[["Eep a", "corpse!"], 1, T_RED], [["I DON'T WANNA DIE"], 0, T_RED]];
	text_options[dial.corpse_goblin] = [[["I", "took.. a life"], 1, T_RED], [["NO MORE.."], 0, T_RED]];
	text_options[dial.shadow] = [[["SHADOW MONSTER!!"], 0, T_PURPLE], [["THAT ISN'T REAL RIGHT?"], 0, T_PURPLE]];
	text_options[dial.stalker] = [[["Feels like I'm", "being followed"], 1, T_PURPLE], [["SOMETHING IS FOLLOWING ME"], 0, T_PURPLE]];
	text_options[dial.idol] = [[["Goddess of light,", "grant me strength"], 1, T_YELLOW], [["IT'S THE GODDESS, I'M SAVED"], 0, T_YELLOW]];
	text_options[dial.idol_break] = [[["What is going on?"], 0, T_RED], [["WHY IS THE WORLD SO CRUEL"], 0, T_RED]];
	text_options[dial.p_walk] = [[["Yeah I can manage"], 0, T_COLOR], [["Yeah I can manage"], 0, T_COLOR]];
	text_options[dial.p_shoot] = [[["Think I am getting the hang of it"], 0, T_COLOR], [["Think I am getting the hang of it"], 0, T_COLOR]];
	text_options[dial.tut_walk] = [[["Can you", "Walk?"], 1, T_YELLOW]];
	text_options[dial.tut_shoot] = [[["Do you know how to", "use a crossbow?"], 1, T_YELLOW]];
	text_options[dial.tut_shoot_2] = [[["You should", "pick the arrow up"], 1, T_YELLOW]];
	text_options[dial.tut_goblin] = [[["A", "goblin,", "kill it or sneak pass it"], 1, T_RED]];
	text_options[dial.tut_corpse] = [[["Stay calm,", "just don't look at it"], 1, T_YELLOW]];
	text_options[dial.tut_idol] = [[["Looking at her is comforting"], 0, T_YELLOW]];
	text_options[dial.tut_shadow] = [[["A Shade!", "I'll kill it with my light!"], 0, T_PURPLE]];
	text_options[dial.tut_shadow_2] = [[["What does it say?"], 0, T_COLOR], [["What does it say?"], 0, T_COLOR]];
	text_options[dial.no_ammo] = [[["Run around corners", "to shake them off!"], 0, T_YELLOW]];
	text_options[dial.gate] = [[["This gate is locked,", "but the switches might be near"], 0, T_YELLOW]];
}

///@function start_game()
///@description Sends the player to tutorial
function start_game() {
	instance_find(obj_menu, 0).Alarm[FADE] = FADE_TIME;
	disabled = true;
	global.level = 0;
}

///@function start_game()
///@description Exit the game
function close_game() {
	game_end();
}