/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

is_tutorial = true;
sanity.val = 600 * room_speed;
sanity._max = sanity.val;

// Destroy the crossbow
instance_destroy(hand.crossbow);
hand.crossbow = noone;