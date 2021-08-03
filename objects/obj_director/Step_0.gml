/// @description Director AI decisions

san_percent = (PLAYER.sanity.val / PLAYER.sanity._max) * 100;

// Check if shadows spawned
hunter_spawned = instance_exists(obj_hunter);
stalker_spawned = instance_exists(obj_stalker);
beholder_spawned = instance_exists(obj_beholder);

// Tick delta alarms
delta_alarm();