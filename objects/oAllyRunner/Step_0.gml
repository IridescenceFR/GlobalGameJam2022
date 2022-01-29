/// @description Comportement de l'allié

// Movement de l'allié

hspd = walkspd;
vspd = vspd + grav;

//Collision horizontales

if (place_meeting(x + hspd, y, oMur)) {
	while (!place_meeting(x + sign(hspd), y, oMur)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}

x = x + hspd;

//Collisions verticales

if (place_meeting(x, y + vspd, oMur)) {
	while (!place_meeting(x, y + sign(vspd), oMur)) {
		y = y + sign(vspd);
	}
	vspd = 0;	
}

y = y + vspd;

//Animations

if (!place_meeting(x, y + 1, oMur)) {
	//sprite_index = Splayer_Jump;
} else {
	if (hspd == 0) {
		sprite_index = sAlly_Idle;
	} else {
		sprite_index = sAlly_Run;
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}