/// @description Insert description here

// Draw the arrow count
if (PLAYER.hand.crossbow != noone) {
	var ammo_x = CAM_WIDTH - 10;
	var ammo_y = sb_y + sprite_get_height(spr_sanity_frame);
	for (var i = 0; i < PLAYER.hand.ammo; ++i) {
		var arrow_w = sprite_get_width(spr_arrow_hud);
		var offset_x = (arrow_w * i) - 2;
		draw_sprite(spr_arrow_hud, 0, ammo_x - offset_x, ammo_y);
	}
}

// Draw the sanity bar on screen
var bar_x = sb_x + sb_offset;
var bar_y = sb_y + 2;
draw_text_color(sb_x, sb_y - string_height("Sanity")/2, "Sanity", P_COLOR, P_COLOR, P_COLOR, P_COLOR, 1);
draw_sprite_ext(spr_sanity_frame, 0, sb_x, sb_y, SB_SCALE, 1, 0, -1, 1);
draw_sprite_ext(spr_sanity_bar, 0, bar_x, bar_y, sb_scale, 1, 0, -1, 1);

// Smoking effect when sanity decreases
var bar_endx = bar_x + sb_scale;
if (sb_change and can_emit) {
	var pcount = irandom_range(2, 5);
	part_emitter_region(ps, p_emit, bar_endx, bar_endx, bar_y, bar_y + 4, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, p_emit, p_type, pcount);
	can_emit = false;
	Alarm[PART] = 10;
}

part_system_drawit(ps);