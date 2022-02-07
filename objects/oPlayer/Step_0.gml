/// @description Controles du personnage

press_right = keyboard_check(vk_right);
press_left = keyboard_check(vk_left);
press_down = keyboard_check(vk_down);
press_up = keyboard_check(vk_up);
press_jump = keyboard_check(vk_space);
press_attack = keyboard_check(ord("A"));

//Mouvements du personnage

var move = press_right - press_left;
hspd = move * walkspd;
vspd += grav + antigrav;

// LADDER

if(place_meeting(x,y, oLadder))
{
	if (oAlly.hide == false) {
		oAlly.x = x; oAlly.y = y + 10;
	}
	antigrav = -0.5;
	dir = 0;
	if(press_up && !press_down)
	{
		dir = -1 * walkspd;
	}
	else if(press_down && !press_up)
	{
		dir = 1 * walkspd;
	}
	if(!place_meeting(x, y + dir, oMur))
	{
		y += dir;
	}
}
else
{
	antigrav = 0;
}

//.........................................

if (move > 0) {
	is_facing_right = true;
} else if (move < 0) {
	is_facing_right = false;
}

if (place_meeting(x, y + 1, oMur)) && (press_jump) && (grounded)
{
	vspd = -17;
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
	}
	if (((vcollide).type == 2) && sign(vspd) == 1)
	{
		if (y - vcollide.y < 75 && y - vcollide.y > 65) {
			
			vspd = 0;
			grounded = true;
		}
	}
}

if (vspd > 0)
{
	grounded = false;
}

y = y + vspd;

//Animations

if (place_meeting(x, y + 1, oMur))
{
	jump = false;
	image_speed = 1;
	if(!is_attacking)
	{
		if (hspd == 0)
		{
			sprite_index = sPlayer_Idle;
		}
		else
		{
			sprite_index = sPlayer_Run;
			if(!audio_is_playing(FootStep))
			{
				audio_play_sound(FootStep,2,0);
			}
		}
	}
}
else
{
	if(!jump)
	{
		jump = true;
		sprite_index = sPlayer_JumpUp;
	}
	else
	{
		if(sign(vspd) == 1)
		{
			image_speed = 1;
			sprite_index = sPlayer_JumpDown;
		}
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}


if (press_attack && is_attacking == false) {
	is_attacking = true;
	sprite_index = sPlayer_Attack;
	audio_play_sound(Sword, 0, 0)
	if (is_facing_right) {
		instance_create_layer(x + 80, y, "Player", oWhip);
	} else {
		instance_create_layer(x - 80, y, "Player", oWhip);
	}
	alarm[1] = 30;
}



// Fermeture du jeu

if(keyboard_check_pressed(vk_escape))
	game_end();