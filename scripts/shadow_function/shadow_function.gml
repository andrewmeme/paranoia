///@function stalker_stalk()
///@description Moves to the last position of the player
function stalker_stalk(){
	// Check if player is far from coord 2
	facing = point_direction(x, y, PLAYER.x, PLAYER.y);
	var dis = point_distance(stalk.x2, stalk.y2, PLAYER.x, PLAYER.y);
	var closer = point_distance(x, y, PLAYER.x, PLAYER.y) < point_distance(stalk.x1, stalk.y1, stalk.x2, stalk.y2);
	if (dis >= stalk.range and not closer) {
		stalk.x1 = stalk.x2;
		stalk.y1 = stalk.y2;
		stalk.x2 = grid_snap(PLAYER.x);
		stalk.y2 = grid_snap(PLAYER.y);
		
		// Immediately stop path
		path_end();
		p_end = true;
		px = stalk.x1;
		py = stalk.y1;
		
		// Pathfind to new coord 1
		if (p_end and mp_grid_path(global.grid, path, x, y, px, py, true)) {
			path_start(path, spd._max, path_action_stop, false);
			p_end = false;
			image_speed = 1;
		}
	}

	// Check if arrive at end
	if (point_distance(x, y, px, py) < spd._max) {
		path_end();
		p_end = true;
		image_speed = 0;
	}
}

///@function stalker_chase()
///@description Chase the player, always sense player
function stalker_chase() {
	// Chase after player
	var reached_end = point_distance(x, y, px, py) < spd._max;
	var too_far = point_distance(px, py, PLAYER.x, PLAYER.y) > p_end_range;
	
	if (reached_end or too_far) {
		p_end = true;
		find_player();
		path_end();
	}

	// Pathfind
	if (p_end and mp_grid_path(global.grid, path, x, y, px, py, true)) {
		p_end = false;
		path_start(path, spd._max, path_action_stop, false);
	}
}

///@function stalker_stun()
///@description Gets stun by light
function stalker_stun() {
	if (not p_end) {
		image_speed = 0;
		p_end = true;
		path_end();
	
		stalk.x1 = x;
		stalk.y1 = y;
		stalk.x2 = grid_snap(PLAYER.x);
		stalk.y2 = grid_snap(PLAYER.y);
	}
}

///@function hunter_idle()
///@description Do nothing except make noises
function hunter_idle() {
	// nothin lol
}

///@function beholder_spawn()
///@description Spawn illusion around the player
function beholder_spawn() {
	// Choose a point on the map
	var dir = irandom(359);
	var dis = LIGHT_RANGE + irandom_range(20, 40);
	var sx = grid_snap(FAIRY.x + dis * dcos(dir));
	var sy = grid_snap(FAIRY.y - dis * dsin(dir));
		
	// Create a fake shadow that can pathfind to player (try 15 times)
	var attempts = 0;
	var valid = is_valid_spawn(sx, sy, 480);
	while (not valid and attempts < 15) {
		var dir = irandom(359);
		var dis = LIGHT_RANGE + irandom_range(20, 40);
		sx = grid_snap(FAIRY.x + dis * dcos(dir));
		sy = grid_snap(FAIRY.y - dis * dsin(dir));
		
		// Check if the attempt is successful
		valid = is_valid_spawn(sx, sy, 480);
		attempts++;
	}
	
	if (valid) {
		instance_create_layer(sx, sy, "Instances", obj_fake_shadow);
	}
}