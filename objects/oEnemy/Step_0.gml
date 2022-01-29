//Mouvements du personnage

hspd = walkspd;
vspd = vspd + grav;

//Collision horizontales

if (place_meeting(x + hspd, y, oMur)) {
	walkspd = walkspd * -1;	
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
	sprite_index = sEnemy;
} else {
	if (hspd == 0) {
		sprite_index = sEnemy;
	} else {
		sprite_index = sEnemy;
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}

// Interaction avec le joueur

if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	if (oPlayer.y < y - 10) {
		with (oPlayer) vspd = -4;
		hp -= 1;
	} else if (oPlayer.invincible == false) {
		global.hp -= 1;
		oPlayer.invincible = true;
		oPlayer.alarm[0] = 30;
	}
}