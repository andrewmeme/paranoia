///@function find_player()
///@description Finds the player on the pathfinding grid
function find_player(){
	px = (PLAYER.x div 32) * 32 + 16;
	py = (PLAYER.y div 32) * 32 + 16;
}

///@function enemy_idle_state()
///@description Enemy Idle State, see if the player is in vision
function enemy_idle_state() {
	in_vision = is_in_view(PLAYER, vision_range);
}

///@function enemy_chase_state()
///@description Enemy Chase State, pathfinds and checks for vision
function enemy_chase_state() {
	var reached_end = point_distance(x, y, px, py) < spd._max;
	var too_far = point_distance(px, py, PLAYER.x, PLAYER.y) > p_end_range;
	
	// Facing the player direction
	facing = point_direction(x, y, PLAYER.x, PLAYER.y);

	// Chase after player
	if (reached_end or too_far) {
		if(in_vision) {
			p_end = true;
			find_player();
			path_end();
		}
		
		in_vision = is_in_view(PLAYER, vision_range);
	}

	// Pathfind
	if (p_end and mp_grid_path(global.grid, path, x, y, px, py, true)) {
		p_end = false;
		path_start(path, spd._max, path_action_stop, false);
	}
	
	
}

///@function enemy_attack()
///@description enemy attacks player, cause player to die
function enemy_attack() {
	var in_range = point_distance(x, y, PLAYER.x, PLAYER.y) < sprite_get_width(sprite_index);
	if (not PLAYER.dead and in_range and 
			instance_place(x, y, obj_player) != noone) {
		PLAYER.dead = true;
	}
}