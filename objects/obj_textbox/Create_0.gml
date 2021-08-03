/// @description Initialize textbox system

// Text Macro
#macro T_COLOR  make_color_rgb(216, 227, 234)
#macro T_RED    make_color_rgb(201,  88,  88)
#macro T_PURPLE make_color_rgb(176, 109, 135)
#macro T_YELLOW make_color_rgb( 88, 145, 159)

// Text enum
enum dial {
	dark,
	corpse,
	corpse_goblin,
	shadow,
	stalker,
	idol,
	idol_break,
	p_walk,
	p_shoot,
	tut_walk,
	tut_shoot,
	tut_shoot_2,
	tut_goblin,
	tut_corpse,
	tut_idol,
	tut_shadow,
	tut_shadow_2,
	no_ammo,
	gate
}

owner = noone;
depth = -10000000;

// Available Dialogue [content, highlight, highlight color]
#macro T_CONTENT   0
#macro T_HIGHLIGHT 1
#macro T_HCOLOR    2

// Setup dialogue
text_options = array_create(22);
dialogue_setup();

// Drawing properties
text_index = 0;
text_san_level = 0;
offset_y = 0;
intensity = 0;

// Delta Alarms
#macro TEXT_TIMER 0
Alarm = array_create(12);
Alarm[TEXT_TIMER] = ALARM_END;