/// @description Attribut du personnage

hspd = 0;
vspd = 0;
grav = 0.5;
antigrav = 0;
walkspd = 8;
targetX = x;
targetY = y;
global.hp = 3;
global.key_count = 0;
global.reset_position_x = 0;
global.reset_position_y = 0;
invincible = false;
is_attacking = false;
is_facing_right = true;
grounded = true;
jump = false;
audio_play_sound(Music, 1, true);