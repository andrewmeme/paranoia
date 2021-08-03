/// @description Calculate scaling

sb_change = PLAYER.sanity.val < sb_sanity;
sb_sanity = PLAYER.sanity.val;
sb_scale = ((PLAYER.sanity.val / PLAYER.sanity._max) * sb_max);

// Tick delta alarms
delta_alarm();