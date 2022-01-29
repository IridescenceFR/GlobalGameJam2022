event_inherited();
//Mouvements du personnage

if (instance_exists(oAlly) && oAlly.hide == false) {
	hspd = sign(oAlly.x - x) * walkspd;
} else {
	hspd = sign(oPlayer.x - x) * walkspd;
}

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
