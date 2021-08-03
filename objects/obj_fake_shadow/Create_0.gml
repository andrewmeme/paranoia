/// @description Initialize fake shadow
// Inherit the parent event
event_inherited();

light_health = 6;
persist = false;

// Pick one sprite
var sprite_list = [spr_hunter, spr_stalker];
sprite_index = sprite_list[irandom(array_length(sprite_list) - 1)];
image_index = 2;
image_speed = 0;

// Despawn Alarm
#macro ILL_DESPAWN 0
Alarm[ILL_DESPAWN] = irandom_range(10, 16) * room_speed;