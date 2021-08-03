/// @description Initialize projectile

// Travelling properties
spd = 5;
angle = 0;
hit_wall = false;

// Get tilemap for collision
collision_set = global.collision_tile;

// Delta alarms
#macro TRAVEL_TIMER 0
Alarm = array_create(12);
Alarm[TRAVEL_TIMER] = 0.9 * room_speed;