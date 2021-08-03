/// @description Check how much switches are toggled

switch (switch_toggled) {
	case 1:
		image_index = 1;
		light_range = 96;
		break;
	case 2:
		// Remove self from level
		mp_grid_clear_cell(global.grid, h, v);
		tilemap_set(global.collision_tile, 0, h, v);
		instance_destroy();
		break;
}
