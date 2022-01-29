/// @description Controles du personnage

press_right = keyboard_check(vk_right);
press_left = keyboard_check(vk_left);
press_down = keyboard_check(vk_down);
press_jump = keyboard_check(vk_space);
press_attack = keyboard_check(ord("A"));

//Mouvements du personnage

var move = press_right - press_left;
hspd = move * walkspd;
vspd = vspd + grav;

if (move > 0) {
	is_facing_right = true;
} else if (move < 0) {
	is_facing_right = false;
}

if (place_meeting(x, y + 1, oMur)) && (press_jump) {
	vspd = -15;
	grounded = false;
}

//Collision horizontales

var hcollide = instance_place(x + hspd, y, oMur);
if (hcollide != noone)
{
	if((hcollide).type == 1)
	{
		while (!place_meeting(x + sign(hspd), y, oMur)) {
			x += sign(hspd);
		}
		hspd = 0;	
	}
}

if (global.key_count < 1 && place_meeting(x + hspd, y, oNextLocked)) {
	while (!place_meeting(x + sign(hspd) + 5, y, oNextLocked)) {
		x = x + sign(hspd);
	}
	hspd = 0;	
}

x = x + hspd;

//Collisions verticales

var vcollide = instance_place(x, y + vspd, oMur);
if (vcollide != noone)
{
	if ((vcollide).type == 1)
	{
		if (place_meeting(x, y + vspd, oMur))
		{
			while (!place_meeting(x, y + sign(vspd), oMur))
			{
				y += sign(vspd);
			}
			vspd = 0;
			grounded = true;
		}
		if (((vcollide).type == 2) && sign(vspd) == 1)
		{
			while (!place_meeting(x, y + sign(vspd), oMur))
			{
				y += 1;
			}
			vspd = 0;
			grounded = true;
		}
	}
}

y = y + vspd;

//Animations

if (!place_meeting(x, y + 1, oMur)) {
	sprite_index = Splayer_Jump;
} else {
	if (hspd == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = Splayer_Run;
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}

if (press_attack && is_attacking == false) {
	is_attacking = true;
	sprite_index = sPlayer;
	if (is_facing_right) {
		instance_create_layer(x + 50, y, "Player", oWhip);
	} else {
		instance_create_layer(x - 50, y, "Player", oWhip);
	}
	alarm[1] = 30;
}



