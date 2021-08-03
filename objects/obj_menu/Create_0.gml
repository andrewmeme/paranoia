/// @description Initialize the menu

// Inherit camera setup
event_inherited();

// Fog
fog = instance_create_layer(0, 0, "Fog", obj_fog);

// Menu fairy
global.delta_factor = (delta_time / 1000000);
global.fairy = instance_create_layer(room_width/2, room_height/2, "Instances", obj_fairy_menu);

// Delta value
#macro FADE 0
#macro FADE_TIME room_speed
Alarm = array_create(12);
Alarm[FADE] = ALARM_END;

// Spawn the 2 buttons
var bx = room_width/2;
var by = room_height/2 + string_height("S");;
start_button = instance_create_layer(bx, by, "Instances", obj_button);
start_button.text = "Start Game";
start_button.effect = start_game;
exit_button = instance_create_layer(bx, by + 32, "Instances", obj_button);
exit_button.text = "Exit";
exit_button.effect = close_game;

// Play the menu theme (No)
//audio_play_sound(snd_menu, 1, true);

// Fullscreen variables
//aspect_ratio = display_get_width()/display_get_height();
//ideal_h = round(aspect_ratio * )

// Set cursor to default
// window_set_cursor(cr_default);