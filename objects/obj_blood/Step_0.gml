/// @description Appear when the player has low sanity

var san = PLAYER.sanity.val/PLAYER.sanity._max;

if (san <= 0.6 and image_alpha == 0) {
	var close_to_player = point_distance(x, y, PLAYER.x, PLAYER.y) < LIGHT_RANGE * 0.9;
	var is_light_close = point_distance(x, y, FAIRY.x, FAIRY.y) < LIGHT_RANGE * 0.9;

	if (close_to_player and is_light_close) {
		image_alpha = 1;
		audio_play_sound(snd_splatter, 2, false);
	}
}