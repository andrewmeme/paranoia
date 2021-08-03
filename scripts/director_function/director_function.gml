///@function director_spawn_stalker()
///@description Finds the player on the pathfinding grid
function director_spawn_stalker(){
	// Check if stalker spawned
	var spawn = irandom(100);
	var chance = STALKER_CHANCE * spawn_mod;

	if (not stalker_spawned and san_percent <= STALKER_THRES and spawn <= chance) {
		// Choose a point opposite to player facing
		var dir = PLAYER.facing + (180 - irandom_range(-30, 30));
		var dis = irandom_range(180, 320);
		var sx = grid_snap(PLAYER.x + dis * dcos(dir));
		var sy = grid_snap(PLAYER.y - dis * dsin(dir));
	
		// Create a stalker that can pathfind to player (try 6 times)
		var attempts = 0;
		var valid = is_valid_spawn(sx, sy, 480);
		while (not valid and attempts < 6) {
			dir = PLAYER.facing + (180 - irandom_range(-30, 30));
			dis = irandom_range(180, 320);
			sx = PLAYER.x + dis * dcos(dir);
			sy = PLAYER.y - dis * dsin(dir);
		
			// Check if the attempt is successful
			valid = is_valid_spawn(sx, sy, 480);
			attempts++;
		}
	
		// If a valid location is found
		if (valid) {
			instance_create_layer(sx, sy, "Instances", obj_stalker);
			
			// Alert the player
			//with (PLAYER) {
			//	dialogue_say(dial.stalker, 2);
			//}
		}
	}

	Alarm[STALKER] = 3 * STALKER_TIMER;
}

///@function director_spawn_hunter()
///@description Finds the player on the pathfinding grid
function director_spawn_hunter(){
	// Check if hunter spawned
	var spawn = irandom(100);
	var chance = HUNTER_CHANCE * spawn_mod;
	
	if (not hunter_spawned and san_percent <= HUNTER_THRES and spawn <= chance) {
		// Choose a point the player is currently facing
		var dir = PLAYER.facing + irandom_range(-45, 45);
		var dis = irandom_range(180, 320);
		var sx = grid_snap(PLAYER.x + dis * dcos(dir));
		var sy = grid_snap(PLAYER.y - dis * dsin(dir));
		
		// Create a hunter that can pathfind to player (try 10 times)
		var attempts = 0;
		var valid = is_valid_spawn(sx, sy, 480);
		while (not valid and attempts < 10) {
			var dir = PLAYER.facing + irandom_range(-75, 75);
			var dis = irandom_range(180, 320);
			sx = PLAYER.x + dis * dcos(dir);
			sy = PLAYER.y - dis * dsin(dir);
		
			// Check if the attempt is successful
			valid = is_valid_spawn(sx, sy, 480);
			attempts++;
		}
		
		// If a valid location is found
		if (valid) {
			instance_create_layer(sx, sy, "Instances", obj_hunter);
		}
	}
	
	Alarm[HUNTER] = 3 * HUNTER_TIMER;
}

///@function director_spawn_beholder()
///@description Finds the player on the pathfinding grid
function director_spawn_beholder(){
	// Check if hunter spawned
	var spawn = irandom(100);
	var chance = BEHOLDER_CHANCE * spawn_mod;
	
	if (not beholder_spawned and san_percent <= BEHOLDER_THRES and spawn <= chance) {
		// Choose a point on the map
		var sx = grid_snap(irandom(room_width));
		var sy = grid_snap(irandom(room_height));
		
		// Create a beholder that is in the map (try 10 times)
		var attempts = 0;
		var valid = is_valid_spawn(sx, sy, 2500);
		while (not valid and attempts < 10) {
			var sx = grid_snap(irandom(room_width));
			var sy = grid_snap(irandom(room_height));
		
			// Check if the attempt is successful
			valid = is_valid_spawn(sx, sy, 2500);
			attempts++;
		}
		
		// If a valid location is found
		if (valid) {
			instance_create_layer(sx, sy, "Instances", obj_beholder);
		}
	}
	
	Alarm[BEHOLDER] = 3 * BEHOLDER_TIMER;
}

///@function is_valid_spawn()
///@description Checks if the spawn is valid
function is_valid_spawn(sx, sy, range) {
	// Check if it is pathable with reasonable length
	var has_path = mp_grid_path(global.grid, path, sx, sy, PLAYER.x, PLAYER.y, true);
	var is_near = path_get_length(path) < range;
	
	// Check if it is near a lightsource
	var light = instance_nearest(sx, sy, obj_fairy);
	var is_near_light = point_distance(sx, sy, light.x, light.y) > light.light_range;
	
	return has_path and is_near and is_near_light;
}