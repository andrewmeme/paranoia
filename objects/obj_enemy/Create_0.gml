/// @description Insert description here

// Inherit the parent event
event_inherited();

// Pathfinding properties
spd._max = 1.2;
path = path_add();
path_set_kind(path, true); // Smooth path
path_set_precision(path, 4);
p_end = true;
p_end_range = 64;
px = x;
py = y;

// Aggro properties
in_vision = false;
vision_range = LIGHT_RANGE * 1.2;

// Graphic setting
facing = 0;

// Deactivate on level end
deactivate = false;