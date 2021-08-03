/// @description Create a grid for entities to pathfind

#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32

var hcells = room_width div CELL_WIDTH; // For whole numbers
var vcells = room_height div CELL_HEIGHT;

// Setup the cell by checking if tiles are contained in a grid position
global.grid = mp_grid_create(0, 0, hcells, vcells, CELL_WIDTH, CELL_HEIGHT);
for (var h = 0; h < hcells; ++h) {
	for (var v = 0; v < vcells; ++v) {
		var pix_x = h * CELL_WIDTH;
		var pix_y = v * CELL_HEIGHT;
		if (tilemap_get_at_pixel(global.collision_tile, pix_x, pix_y) != 0) {
			mp_grid_add_cell(global.grid, h, v);
		}
	}
}
