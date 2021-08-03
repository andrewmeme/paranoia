/// @description Create fade effects

var alpha = 0;
var clr = c_black;

if(Alarm[L_START] > ALARM_END) {
	alpha = (Alarm[L_START] / ROOM_FADE);
} else if(Alarm[L_END] > ALARM_END) {
	alpha = 1 - (Alarm[L_END] / ROOM_FADE);
	// Fade to white in level 6
	if (level_end and global.level == 7) {
		clr = c_white;
	}
}
	
// Draw fading effect
draw_set_alpha(alpha);
draw_rectangle_color(0, 0, room_width, room_height, clr, clr, clr, clr, false);
draw_set_alpha(1);
