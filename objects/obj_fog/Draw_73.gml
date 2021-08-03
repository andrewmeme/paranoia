/// @description Wait till all lights are drawn
// Render the fog on screen at last
if (instance_exists(camera)) {
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.fog.surface, view_xport[0], view_yport[0]);
	gpu_set_blendmode(bm_normal);
}