/// @description Basic Entity Behaviour

// Check for collision
collide_check();

// Record the true coordinates
true_x = true_x + spd._x;
true_y = true_y + spd._y;

// Keep entity in bound
sprite_offset = abs(sprite_width/2);
true_x = clamp(true_x, 0 + sprite_offset, room_width - sprite_offset);
true_y = clamp(true_y, 0 + sprite_offset, room_height - sprite_offset);

// Floor them for gamemaker
x = floor(true_x);
y = floor(true_y);