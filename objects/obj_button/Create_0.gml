/// @description Initialize a button

// Macros
#macro HOVER_FACTOR 0.08
#macro B_WHITE make_color_rgb(215, 218, 220)
#macro B_GRAY  make_color_rgb(114, 118, 132)

// Button properties
text = "";
width = 80;
height = 80;

disabled = false
hover = 0; // between 0 and 1
effect = -1; // The effect when the button is pressed
played_sound = false; // Play sound when hovered