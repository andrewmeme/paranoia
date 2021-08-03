/// @description Getting broadcast

if (event_data[? "event_type"] == "sprite event") {
	switch (event_data[? "message"]) {
		case "step":
			audio_play_sound(snd_step, 0, false);
			break;
		case "player_dead":
			image_speed = 0;
			image_index = sprite_get_number(sprite_index) - 1;
			break;
		case "player_scream":
			audio_play_sound(snd_screech, 1, false);
			break;
	}
}
