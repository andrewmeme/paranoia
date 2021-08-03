 /// @description Manager Initalization
// Macro
global.delta_factor = (delta_time / 1000000) * room_speed;;
#macro delta global.delta_factor

var dep = -room_height;
#macro FOG_DEPTH (dep * 2)
#macro ROOM_FADE (1.5 * room_speed)

// Commonly used objects
global.collision_tile = layer_tilemap_get_id("collision");

// Graphic Configs
depth = FOG_DEPTH - 1;
draw_set_font(roboto);
//auto_tile();

// Get spawn type
var spawn = obj_start_point;
var fairy_type = obj_fairy;
var player_type = obj_player;

if (instance_exists(obj_start_tutorial)) {
	spawn = obj_start_tutorial;
	fairy_type = obj_fairy_tutorial;
	player_type = obj_player_tutorial;
}

// Player
global.player = instance_create_layer(spawn.x, spawn.y, "Instances", player_type);
#macro PLAYER global.player

// Fairy
global.fairy = instance_create_layer(PLAYER.x, PLAYER.y, "Instances", fairy_type);
#macro FAIRY global.fairy

/// Backend Initialization
cam = instance_create_layer(0, 0, "Instances", obj_camera);

fog = instance_create_layer(0, 0, "Fog", obj_fog);
fog.cam = cam;
fog.depth = FOG_DEPTH;

gui = instance_create_layer(0, 0, "Instances", obj_gui);

grid = instance_create_layer(0, 0, "Instances", obj_grid);

if (not instance_exists(obj_start_tutorial)) {
	director = instance_create_layer(0, 0, "Instances", obj_director);
}

// Delta Alarms
#macro L_START 0
#macro L_END   1
Alarm = array_create(12);
Alarm[L_START] = ROOM_FADE;
Alarm[L_END] = ALARM_END;

// Level Progression
level_start = false;
level_end = false;
level_restart = false;
levels = [room_tutorial, room_level_1, room_level_2, room_level_3, room_level_4, room_level_5, room_level_6, room_ending];

// Hide cursor
// window_set_cursor(cr_none);

// Quitting function
#macro QUIT_TIME (2 * room_speed)
quitting = QUIT_TIME;