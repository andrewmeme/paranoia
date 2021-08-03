/// @description Player Initialization

/// Macros
#macro COLLECT_RANGE 8 // for arrow collection
#macro RETRACT_RANGE 32 // for arrow retraction
#macro RETRACT_FACTOR 0.1

// Sanity Macros
#macro SANITY_VAL 10 * room_speed // seconds for full decrease
#macro SANITY_BUFFER 0.75 * room_speed
#macro DARK_DMG 1
#macro DARK_SCALE 16 // each 16 pixel away scales buffer damage
#macro CORPSE_CONE 110 // the vision cone where player detect corpse

// Inherit the parent event
event_inherited();

// Smooth movement
spd._max = 2;
angle = 0;
accel = 0.4;

// Sprite property
facing = 0;
s_idle = spr_player_idle;
s_walk = spr_player_walk;
s_dead = spr_player_dead;
s_insane = spr_player_insanity;
always_render= true;

// Sanity mechanic
sanity = {
	val: global.sanity,
	_max: SANITY_VAL, 
	buffer: SANITY_BUFFER,
	is_recovering: true
}

if (sanity.val/sanity._max < 0.25) {
	sanity.val = 0.25 * sanity._max;
}

// Crossbow properties
hand = {
	crossbow: instance_create_layer(x, y, "Instances", obj_player_crossbow),
	ammo: global.ammo,
	cooldown: 0,
	fire_speed: 2 * room_speed,
}
hand.crossbow.player = id;

// Textbox
textbox = instance_create_layer(x, y, "Instances", obj_textbox);
textbox.owner = id;

// Game manager reference
manager = instance_find(obj_manager, 0);

// Audio settings
whispers = false;
audio_listener_orientation(0, 0, 1000, 0, -1, 0);

// Scratch display
#macro SCRATCH 0
Alarm[SCRATCH] = 0;

// Is in tutorial?
is_tutorial = false;

// Show how much ammo and sanity the player has
show_debug_message("Ammo: " + string(hand.ammo));
show_debug_message("Sanity: " + string(sanity.val/room_speed));

