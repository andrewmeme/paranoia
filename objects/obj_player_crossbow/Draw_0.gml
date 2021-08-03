/// @description Control crossbow graphic

// Depth control
depth = player.depth - 1;

// Points at where the player is looking at
image_angle = point_direction(x, y, mouse_x, mouse_y);
draw_self();