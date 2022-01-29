//Collisions verticales

if (place_meeting(x, y + vspd, oMur)) {
	while (!place_meeting(x, y + sign(vspd), oMur)) {
		y = y + sign(vspd);
	}
	vspd = 0;	
}

y = y + vspd;

//Animation 

if (hspd != 0) {
	image_xscale = sign(hspd);
}

// Interaction avec le joueur
if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 50;
	if (instance_exists(oAlly)) {
		oAlly.stress += 5;
	}
} else if (place_meeting(x, y, oAlly) && oAlly.hide == false) {
	oAlly.stress += 10;
}

// Interaction avec le fouet
if (place_meeting(x, y, oWhip)) {
	hp -= 1;
}
