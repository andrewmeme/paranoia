/// @description Initialize scratches

// Text bank
normal_options = ["I'm scared", "Is someone there?", "Please help me", "Where is the exit?", "Is there hope",
					"Please protect me", "I want to live", "Fairy don't leave", "Papa", "Mama", "It's them or me",
					"home", "I must survive", "why are goblins here?", "someone help"];
extreme_options = ["THE SHADOWS", "HELP", "I'LL BE KILLED", "NO ESCAPE", "BLOOD", "THIS IS A NIGHTMARE",
					"WHY DO I HAVE TO SUFFER",  "DEATH", "THE EYES", "POSSESSED", "FAIRY?", "WHY", "DISPAIR",
					"NO HOPE", "WHEN WILL IT END", "THEY'LL GET ME", "I NEED TO HIDE", "DARKNESS"];

// Fade properties
max_fade = irandom_range(1.5 * room_speed, 3 * room_speed);
tx = 60;
ty = 60;
angle = random_range(-20, 20);
initiated = false;

// Determine text
text = "";
color = T_COLOR;

var san = PLAYER.sanity.val / PLAYER.sanity._max;
var options = normal_options;
if (san < 0.3) {
	options = extreme_options;
	color = T_RED;
}
text = options[irandom(array_length(options) - 1)];


// Delta Alarms
Alarm = array_create(12);
Alarm[FADE] = max_fade;

show_debug_message("Scratch Spawned");