/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Travelling properties
spd._max = 1.8;

// State Machine
idle = enemy_idle_state;
chase = enemy_chase_state;
state = idle;

// Sprite control
spr_idle = spr_goblin;
spr_walk = spr_goblin_walk;
spr_dead = spr_goblin_dead