/// @description Display shadow effects

// Inherit the parent event
event_inherited();

// Draw burning particles when touching light
if (under_light and can_emit) {
	can_emit = false;
	
	// Emit particles
	var count = irandom_range(1, 3);
	part_system_depth(ps, -y - 1);
	part_emitter_region(ps, p_emit, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, p_emit, p_type, count);
}