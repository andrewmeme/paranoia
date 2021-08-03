/// @description Despawn when health is 0

// Inherit the parent event
event_inherited();

if (light_health == 0) {
	instance_destroy();
}
