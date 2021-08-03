/// @description Wait for switch to activate

if (image_index == 0 and place_meeting(x, y, PLAYER)) {
	// sprite becomes pressed
	image_index = 1; 
	
	// Signal to gate
	with(obj_gate) {
		switch_toggled++;
		show_debug_message(switch_toggled);
	}
	
	// Play sound
	audio_play_sound(snd_break, 2, false);
}
