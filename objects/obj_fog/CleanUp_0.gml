/// @description Clean up Data Structures

// Clean up unused surface
if (surface_exists(global.fog.surface)) {
	surface_free(global.fog.surface);
}
