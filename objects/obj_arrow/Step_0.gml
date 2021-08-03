/// @description Arrow behaviour
// Check if it collided with enemy
var enemy = instance_place(x, y, obj_goblin);
if (not hit_wall and enemy != noone and not enemy.dead) {
	enemy.dead = true;
	instance_destroy();
}

event_inherited();