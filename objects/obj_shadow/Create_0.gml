/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Sanity damage from vision
san_dmg = 1.2;

// Light interaction
under_light = false;
light_range = 0.75 * LIGHT_RANGE;
light_health = 1.5 * room_speed;

// Sound emitter
emitter = audio_emitter_create();
audio_emitter_falloff(emitter, 240, 420, 1);

// Particle emitter
can_emit = false;
ps = part_system_create();
p_emit = part_emitter_create(ps);
p_type = part_type_create();
part_type_shape(p_type, pt_shape_pixel);
part_type_life(p_type, 0.5 * room_speed, room_speed);
part_type_size(p_type, 3, 5, 0.01, 0);
part_type_orientation(p_type, 0, 90, 0.1, 0, 0);
part_type_direction(p_type, 75, 105, 0, 0);
part_type_speed(p_type, 0.4, 0.8, 0.004, 0);
part_type_color1(p_type, $524f5c);
part_type_alpha3(p_type, 0.9, 0.6, 0);

// Particle Timer
#macro BURN 11
Alarm[BURN] = 0;