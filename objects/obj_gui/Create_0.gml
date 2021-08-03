  /// @description Initialize GUI properties

/// Particle system
ps = part_system_create();
part_system_automatic_draw(ps, false);
p_emit = part_emitter_create(ps);

// Particle for sanity
#macro P_COLOR make_color_rgb(176, 109, 135)

can_emit = false;
p_type = part_type_create();
part_type_shape(p_type, pt_shape_pixel);
part_type_life(p_type, 0.5 * room_speed, room_speed);
part_type_size(p_type, 2, 4, 0.01, 0);
part_type_orientation(p_type, 0, 90, 0.1, 0, 0);
part_type_direction(p_type, 60, 120, 0, 0);
part_type_speed(p_type, 0.1, 0.4, 0.002, 0);
part_type_color1(p_type, P_COLOR);
part_type_alpha3(p_type, 0.9, 0.6, 0);

/// Sanity Bar
#macro SB_SCALE 24

sb_w = sprite_get_width(spr_sanity_frame);
sb_h = sprite_get_height(spr_sanity_frame);
sb_x = 16;
sb_y = (CAM_HEIGHT - 16) - sb_h;
sb_offset = 4;

// Scaling for inner bar
sb_max = (sb_w * SB_SCALE) - (2 * sb_offset);
sb_scale = sb_max;
sb_change = false;
sb_sanity = PLAYER.sanity._max;

// Delta Alarms
#macro PART 0
Alarm = array_create(12);
Alarm[PART] = 0;