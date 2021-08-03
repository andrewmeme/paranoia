/// @description Initialize the fog

// Fog grid
#macro GRID_SIZE 16
#macro FOG_BUFFER (6 * GRID_SIZE)
#macro FOG_ALPHA 0.75
#macro FOG_COLOR c_ltgray
#macro LIGHT_COLOR make_color_rgb(249, 243, 244)

// Camera reference for optimization
camera = noone;

global.fog = {
	_width: ceil(room_width / GRID_SIZE) + FOG_BUFFER,
	_height: ceil(room_height / GRID_SIZE) + FOG_BUFFER,
	surface: noone
}
