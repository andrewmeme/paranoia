/// @description Free memory resources
// Free particle system
part_type_destroy(p_type);
part_emitter_destroy(ps, p_emit);
part_system_destroy(ps);

// Free the emitter
audio_emitter_free(emitter);

// Inherit the parent event
event_inherited();

