/// @description Initialize Fairy
event_inherited();

light_range = LIGHT_RANGE;
spd._max = 8;
always_render = true;

textbox = instance_create_layer(x, y, "Instances", obj_textbox);
textbox.owner = id;