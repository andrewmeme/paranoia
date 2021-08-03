/// @description Control the camera

/// Follow the player
// Get cam position
cam._x = camera_get_view_x(cam.camera);
cam._y = camera_get_view_y(cam.camera);
	
// Get target position
var tar_x = PLAYER.x - cam._width/2;
var tar_y = PLAYER.y - cam._height/2;


// Glide to it
var final_x = floor(lerp(cam._x, tar_x, CAM_SLIDE));
var final_y = floor(lerp(cam._y, tar_y, CAM_SLIDE));
final_x = clamp(final_x, 0, room_width - cam._width);
final_y = clamp(final_y, 0, room_height - cam._height);

camera_set_view_pos(cam.camera, final_x, final_y);
