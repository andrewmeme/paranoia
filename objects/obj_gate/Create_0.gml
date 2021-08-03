/// @description Initialize the gate

// Make the gate an obstacle
h = x div CELL_WIDTH;
v = y div CELL_HEIGHT;

mp_grid_add_cell(global.grid, h, v);
tilemap_set(global.collision_tile, 1, h, v);

// Graphic settings
image_speed = 0;
light_range = 0;

// Gate properties
switch_toggled = 0;