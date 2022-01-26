/// @description Controles du personnage

press_right = keyboard_check(vk_right);
press_left = keyboard_check(vk_left);
press_jump = keyboard_check(vk_space);

//Mouvements du personnage

var move = press_right - press_left;
hspd = move * walkspd;
x = x + hspd;