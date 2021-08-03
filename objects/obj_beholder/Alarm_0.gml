/// @description Spawn fake shadows in intervals

if (not deactivate) {
	beholder_spawn();
}

Alarm[ILLUSION] = irandom_range(ILL_MIN, ILL_MAX);
