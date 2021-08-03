/// @description Initialize the director

// Threshold Macros
#macro HUNTER_THRES 90
#macro HUNTER_CHANCE 6
#macro HUNTER_TIMER (3 * room_speed)
#macro STALKER_THRES 80 // spawn at x% or lower
#macro STALKER_CHANCE 5 // % Chance to spawn
#macro STALKER_TIMER (4 * room_speed) // Decide to check spawn every x seconds
#macro BEHOLDER_THRES 70
#macro BEHOLDER_CHANCE 8
#macro BEHOLDER_TIMER (5 * room_speed)

// Spawn modification
spawn_mod = floor(global.level / 2);

// Keep track of player sanity
san_percent = 100;

// Keep track of shadows
stalker_spawned = false;
hunter_spawned = false;
beholder_spawned = false;

// Pathfinding
path = path_add();

// Delta alarms
#macro STALKER  0
#macro HUNTER   1
#macro BEHOLDER 2

Alarm = array_create(12);
Alarm[STALKER] = 0;
Alarm[HUNTER] = 0;
Alarm[BEHOLDER] = 0;