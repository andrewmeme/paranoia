/// @description Initialize Beholder

// Inherit the parent event
event_inherited();

// Delta alarm
#macro ILL_MIN 6 * room_speed
#macro ILL_MAX 9 * room_speed
#macro ILLUSION 0
Alarm[ILLUSION] = irandom_range(ILL_MIN, ILL_MAX);
