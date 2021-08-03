/// @description Hearing broadcast when the entity is dead


if (event_data[? "event_type"] == "sprite event") {
	switch (event_data[? "message"]) {
		case "goblin_dead":
			if (dead) {
				var corpse = instance_create_layer(x, y, "Instances", obj_goblin_corpse);
				corpse.image_xscale = image_xscale;
				instance_destroy();
			}
			break;
		case "goblin_step":
			// Play stepping sound
			if (state == chase and image_index < 1) {
				audio_play_sound(snd_step, 0, false);
			}
			break;
	}
}

