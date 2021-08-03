/// @description Scratch Timer

if (not initiated) {
	while ((40 < tx and tx < CAM_WIDTH - 40 - string_width(text)) and (50 < ty)) {
		tx = irandom_range(10, CAM_WIDTH - string_width(text) - 10);
		ty = irandom_range(string_height(text), 0.8 * CAM_HEIGHT);
	}
	initiated = true;
}

delta_alarm();