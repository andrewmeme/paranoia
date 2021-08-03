/// @description Get collected and destroyed

var dis = point_distance(x, y, PLAYER.x, PLAYER.y);
if (dis < COLLECT_RANGE) {
	instance_destroy();
	PLAYER.hand.crossbow = instance_create_layer(PLAYER.x, PLAYER.y, "Instances", obj_player_crossbow);
	PLAYER.hand.crossbow.player = PLAYER.id;
}
else if (dis < RETRACT_RANGE) {
	x = lerp(PLAYER.x, x, RETRACT_FACTOR);
	y = lerp(PLAYER.y, y, RETRACT_FACTOR);
			
	// Scale the arrow when retracting
	var scale = (dis - COLLECT_RANGE) / (RETRACT_RANGE - COLLECT_RANGE);
	image_xscale = scale;
	image_yscale = scale;
}

