/// @description Controles du personnage

press_right = keyboard_check(vk_right);
press_left = keyboard_check(vk_left);
press_jump = keyboard_check(vk_space);

//Mouvements du personnage

var move = press_right - press_left;
hspd = move * walkspd;
vspd = vspd + grav;


if (place_meeting(x, y + 1, oMur)) && (press_jump)
{
	vspd = - 5;
}

//Collision horizontales

if (place_meeting(x + hspd, y, oMur))
{
	while (!place_meeting(x + sign(hspd), y, oMur))
	{
		x = x + sign(hspd);
	}
	hspd = 0;	
}

x = x + hspd;

//Collisions verticales

if (place_meeting(x, y + vspd, oMur))
{
	while (!place_meeting(x, y + sign(vspd), oMur))
	{
		y = y + sign(vspd);
	}
	vspd = 0;	
}

y = y + vspd;

//Animations

if (!place_meeting(x, y + 1, oMur))
{
	sprite_index = Splayer_Jump;
} else {
	if (hspd == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = Splayer_Run;
	}
}





