/// @description Backend work for Fog System

// Grab the camera in case initialization failed
if (camera == noone) {
	camera = instance_find(obj_camera, 0);
}

// Calculate where the mouse is
