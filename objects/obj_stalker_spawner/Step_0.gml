/// @description Check if player comes close

var dis = point_distance(x, y, PLAYER.x, PLAYER.y);

if (dis < 64) {
	var stalker = instance_create_layer(x + 270, y, "Instances", obj_stalker);
	stalker.Alarm[STALK_TIMER] = 2.5 * room_speed;
	instance_destroy();
}
