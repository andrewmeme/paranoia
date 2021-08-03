/// @description Initialize the camera
// Macros for camera
#macro CAM_WIDTH  480
#macro CAM_HEIGHT 270
#macro CAM_RES    3
#macro CAM_SLIDE  0.2

// Enable the view
view_enabled = true;
view_visible[0] = true;

// Create the camera
cam = {
	camera: camera_create_view(0, 0, CAM_WIDTH, CAM_HEIGHT),
	_width: CAM_WIDTH,
	_height: CAM_HEIGHT,
	_x: 0,
	_y: 0,
}
view_set_camera(0, cam.camera);

// Get size of game window
var w_width = cam._width * CAM_RES;
var w_height = cam._height * CAM_RES;

// Resize window & app surface
window_set_size(w_width, w_height);
surface_resize(application_surface, w_width, w_height);
display_set_gui_size(cam._width, cam._height);

// Center and resize window
var d_width = display_get_width();
var d_height = display_get_height();
window_set_position(d_width/2 - w_width/2, d_height/2 - w_height/2);