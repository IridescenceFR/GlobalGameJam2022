//Mouvements du personnage

hspd = sign(oPlayer.x - x) * walkspd;

vspd = vspd + grav;

//Collision horizontales

if (place_meeting(x + hspd, y, oMur)) {
	while (!place_meeting(x + sign(hspd), y, oMur)) {
		x = x + sign(hspd);
	}
	hspd = 0;
	if (place_meeting(x, y + 1, oMur)) {
		vspd = -10;
	}
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
	sprite_index = sEnemySmart;
} else {
	if (hspd == 0) {
		sprite_index = sEnemySmart;
	} else {
		sprite_index = sEnemySmart;
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}

// Interaction avec le joueur

if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 30;
}

// Interaction avec le fouet
if (place_meeting(x, y, oWhip)) {
	hp -= 1;
}
