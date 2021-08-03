/// @description Fade in and start game

// Stop the music
audio_stop_sound(snd_menu);

// Set basic attributes
global.ammo = 2;
global.sanity = SANITY_VAL;
global.level = 0;
room_goto(room_tutorial);